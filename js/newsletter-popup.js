/**
 * Newsletter Popup - IO Group
 * Sistema de Captura de Leads con Descuento 15%
 * Envía datos a Google Sheets
 */

(function () {
    'use strict';

    // Configuration
    const CONFIG = {
        triggerOnScroll: true,          // Show on first scroll
        scrollThreshold: 50,            // Minimum pixels to scroll before showing
        storageKey: 'iogroup_newsletter_shown',
        storageExpiry: 7,               // Days before showing again
        testMode: true,                 // Set to false for production
        // Google Sheets Web App URL - REPLACE WITH YOUR OWN AFTER SETUP
        googleSheetsUrl: 'https://script.google.com/macros/s/AKfycbx3woX6IGoNU91bGntIfiVYUhBEV_5AAHEhR6vI2vOAPcIq6cWbLzgfMr-rBAYkOxvb4Q/exec'
    };

    // DOM Elements
    let overlay, popup, form, emailInput, nameInput, companyInput, phoneInput, submitBtn, closeBtn, skipLink, errorEl;
    let hasTriggered = false;

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
     * Setup popup trigger - listen for first scroll
     */
    function setup() {
        if (CONFIG.triggerOnScroll) {
            // Add scroll listener
            window.addEventListener('scroll', onFirstScroll, { passive: true });
        } else {
            // Fallback: show immediately
            showPopup();
        }
    }

    /**
     * Handle first scroll event
     */
    function onFirstScroll() {
        // Check if already triggered
        if (hasTriggered) return;

        // Check if scrolled past threshold
        if (window.scrollY >= CONFIG.scrollThreshold) {
            hasTriggered = true;
            // Remove scroll listener
            window.removeEventListener('scroll', onFirstScroll);
            // Show popup
            showPopup();
        }
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
        companyInput = popup.querySelector('#newsletter-company');
        phoneInput = popup.querySelector('#newsletter-phone');
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
        [emailInput, nameInput, companyInput, phoneInput].forEach(input => {
            if (input) {
                input.addEventListener('input', () => {
                    input.classList.remove('error');
                    hideError();
                });
            }
        });
    }

    /**
     * Handle form submission
     */
    async function handleSubmit(e) {
        e.preventDefault();

        const nombre = nameInput.value.trim();
        const razonSocial = companyInput.value.trim();
        const telefono = phoneInput.value.trim();
        const email = emailInput.value.trim();

        // Validate fields
        let hasError = false;

        if (!nombre) {
            nameInput.classList.add('error');
            hasError = true;
        }
        if (!razonSocial) {
            companyInput.classList.add('error');
            hasError = true;
        }
        if (!telefono) {
            phoneInput.classList.add('error');
            hasError = true;
        }
        if (!email || !isValidEmail(email)) {
            emailInput.classList.add('error');
            hasError = true;
        }

        if (hasError) {
            showError('Por favor, completa todos los campos correctamente.');
            return;
        }

        // Disable button and show loading
        setLoading(true);

        try {
            // Send to Google Sheets
            const response = await fetch(CONFIG.googleSheetsUrl, {
                method: 'POST',
                mode: 'no-cors', // Required for Google Apps Script
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    nombre: nombre,
                    razonSocial: razonSocial,
                    telefono: telefono,
                    email: email,
                    fecha: new Date().toLocaleString('es-PE'),
                    pagina: window.location.pathname
                })
            });

            // Since mode is 'no-cors', we can't check response status
            // We assume success and show the success message
            showSuccess();

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
    function showSuccess() {
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
