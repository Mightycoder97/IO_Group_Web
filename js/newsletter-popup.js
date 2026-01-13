/**
 * Newsletter Popup - IO Group
 * Sistema de Suscripción con Descuento 15%
 */

(function () {
    'use strict';

    // Configuration
    const CONFIG = {
        delay: 0,                       // Show immediately (was 8000 for production)
        storageKey: 'iogroup_newsletter_shown',
        storageExpiry: 7,               // Days before showing again
        apiEndpoint: '/api/newsletter-subscribe.php',
        testMode: true                  // Set to false for production
    };

    // DOM Elements
    let overlay, popup, form, emailInput, nameInput, submitBtn, closeBtn, skipLink, errorEl;

    /**
     * Initialize the newsletter popup
     */
    function init() {
        // Check if popup should be shown
        if (!shouldShowPopup()) {
            return;
        }

        // Wait for DOM to be ready
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', setup);
        } else {
            setup();
        }
    }

    /**
     * Check if popup should be displayed
     */
    function shouldShowPopup() {
        // In test mode, always show the popup
        if (CONFIG.testMode) {
            return true;
        }

        const stored = localStorage.getItem(CONFIG.storageKey);
        if (!stored) return true;

        try {
            const data = JSON.parse(stored);
            const expiryDate = new Date(data.expiry);

            // If expired, show popup again
            if (new Date() > expiryDate) {
                localStorage.removeItem(CONFIG.storageKey);
                return true;
            }

            return false;
        } catch (e) {
            localStorage.removeItem(CONFIG.storageKey);
            return true;
        }
    }

    /**
     * Mark popup as shown in localStorage
     */
    function markAsShown(subscribed = false) {
        const expiry = new Date();
        expiry.setDate(expiry.getDate() + (subscribed ? 365 : CONFIG.storageExpiry));

        localStorage.setItem(CONFIG.storageKey, JSON.stringify({
            shown: true,
            subscribed: subscribed,
            expiry: expiry.toISOString()
        }));
    }

    /**
     * Setup popup after delay
     */
    function setup() {
        setTimeout(showPopup, CONFIG.delay);
    }

    /**
     * Show the popup
     */
    function showPopup() {
        // Get DOM elements
        overlay = document.getElementById('newsletter-overlay');
        popup = document.getElementById('newsletter-popup');

        if (!overlay || !popup) {
            console.warn('Newsletter popup elements not found');
            return;
        }

        form = popup.querySelector('.newsletter-form');
        emailInput = popup.querySelector('#newsletter-email');
        nameInput = popup.querySelector('#newsletter-name');
        submitBtn = popup.querySelector('.newsletter-submit');
        closeBtn = popup.querySelector('.newsletter-close');
        skipLink = popup.querySelector('.newsletter-skip');
        errorEl = popup.querySelector('.newsletter-error');

        // Bind events
        bindEvents();

        // Show popup with animation
        requestAnimationFrame(() => {
            overlay.classList.add('active');
            popup.classList.add('active');
            document.body.style.overflow = 'hidden';
        });

        // Track view (for analytics)
        trackEvent('newsletter_popup_shown');
    }

    /**
     * Hide the popup
     */
    function hidePopup(subscribed = false) {
        overlay.classList.remove('active');
        popup.classList.remove('active');
        document.body.style.overflow = '';

        markAsShown(subscribed);

        // Track close
        trackEvent(subscribed ? 'newsletter_subscribed' : 'newsletter_closed');
    }

    /**
     * Bind event listeners
     */
    function bindEvents() {
        // Close button
        closeBtn.addEventListener('click', () => hidePopup(false));

        // Skip link
        skipLink.addEventListener('click', () => hidePopup(false));

        // Overlay click
        overlay.addEventListener('click', () => hidePopup(false));

        // Prevent popup click from closing
        popup.addEventListener('click', (e) => e.stopPropagation());

        // ESC key to close
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && popup.classList.contains('active')) {
                hidePopup(false);
            }
        });

        // Form submission
        form.addEventListener('submit', handleSubmit);

        // Remove error on input
        emailInput.addEventListener('input', () => {
            emailInput.classList.remove('error');
            hideError();
        });
    }

    /**
     * Handle form submission
     */
    async function handleSubmit(e) {
        e.preventDefault();

        const email = emailInput.value.trim();
        const nombre = nameInput.value.trim();

        // Validate email
        if (!email || !isValidEmail(email)) {
            emailInput.classList.add('error');
            showError('Por favor, ingresa un correo electrónico válido.');
            emailInput.focus();
            return;
        }

        // Disable button and show loading
        setLoading(true);

        try {
            const response = await fetch(CONFIG.apiEndpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams({
                    email: email,
                    nombre: nombre,
                    pagina_origen: window.location.pathname
                })
            });

            const data = await response.json();

            if (data.success) {
                showSuccess(data.discount_code);
            } else {
                showError(data.message || 'Hubo un error. Por favor, intenta nuevamente.');
            }
        } catch (error) {
            console.error('Newsletter subscription error:', error);
            showError('Error de conexión. Por favor, intenta nuevamente.');
        } finally {
            setLoading(false);
        }
    }

    /**
     * Validate email format
     */
    function isValidEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }

    /**
     * Show loading state
     */
    function setLoading(loading) {
        submitBtn.disabled = loading;
        submitBtn.classList.toggle('loading', loading);
    }

    /**
     * Show error message
     */
    function showError(message) {
        errorEl.textContent = message;
        errorEl.classList.add('show');
    }

    /**
     * Hide error message
     */
    function hideError() {
        errorEl.classList.remove('show');
    }

    /**
     * Show success state
     */
    function showSuccess(discountCode) {
        // Update discount code in success message
        const codeEl = popup.querySelector('.discount-code-value');
        if (codeEl && discountCode) {
            codeEl.textContent = discountCode;
        }

        // Switch to success state
        popup.classList.add('success');

        // Bind success close button
        const successCloseBtn = popup.querySelector('.success-close-btn');
        if (successCloseBtn) {
            successCloseBtn.addEventListener('click', () => hidePopup(true));
        }

        markAsShown(true);
    }

    /**
     * Track events (for Google Analytics if available)
     */
    function trackEvent(eventName) {
        if (typeof gtag === 'function') {
            gtag('event', eventName, {
                'event_category': 'Newsletter',
                'event_label': window.location.pathname
            });
        }
    }

    // Initialize
    init();

})();
