// ========================================
// TRANSPORTES WEB - JAVASCRIPT PRINCIPAL
// Empresa de Transporte de Residuos Peligrosos
// ========================================

document.addEventListener('DOMContentLoaded', function () {
    // Inicializar componentes
    initPreloader();
    initNavbar();
    initScrollAnimations();
    initFormValidation();
    initCounters();
});

// ===== PRELOADER =====
function initPreloader() {
    const preloader = document.querySelector('.preloader');
    if (preloader) {
        window.addEventListener('load', function () {
            setTimeout(function () {
                preloader.classList.add('hidden');
            }, 500);
        });
    }
}

// ===== NAVBAR SCROLL EFFECT =====
function initNavbar() {
    const navbar = document.querySelector('.navbar');

    if (navbar) {
        // Verificar posición inicial
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        }

        // Cambiar estilo en scroll
        window.addEventListener('scroll', function () {
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });
    }

    // Cerrar menú móvil al hacer clic en un enlace
    const navLinks = document.querySelectorAll('.navbar-nav .nav-link');
    const navbarCollapse = document.querySelector('.navbar-collapse');

    navLinks.forEach(function (link) {
        link.addEventListener('click', function () {
            if (navbarCollapse.classList.contains('show')) {
                const bsCollapse = new bootstrap.Collapse(navbarCollapse);
                bsCollapse.hide();
            }
        });
    });
}

// ===== SCROLL ANIMATIONS =====
function initScrollAnimations() {
    const observerOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.1
    };

    const observer = new IntersectionObserver(function (entries, observer) {
        entries.forEach(function (entry) {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-fadeInUp');
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Observar elementos con la clase .animate-on-scroll
    const animatedElements = document.querySelectorAll('.animate-on-scroll');
    animatedElements.forEach(function (el) {
        observer.observe(el);
    });
}

// ===== FORM VALIDATION & GOOGLE SHEETS INTEGRATION =====
// URL del Google Apps Script
const GOOGLE_SCRIPT_URL = 'https://script.google.com/macros/s/AKfycbziEsxNMxvpe_Ytl9mcD5wxhG7WaBHGTjv3IfO7BrVbRNDdbLDyAJfHksWUC2A6kAyjMQ/exec';

function initFormValidation() {
    const contactForm = document.getElementById('contactForm');

    if (contactForm) {
        contactForm.addEventListener('submit', async function (e) {
            e.preventDefault();

            // Obtener campos
            const nombre = document.getElementById('nombre');
            const email = document.getElementById('email');
            const telefono = document.getElementById('telefono');
            const empresa = document.getElementById('empresa');
            const servicio = document.getElementById('servicio');
            const mensaje = document.getElementById('mensaje');

            let isValid = true;

            // Validar nombre
            if (nombre.value.trim() === '') {
                showError(nombre, 'Por favor ingrese su nombre');
                isValid = false;
            } else {
                removeError(nombre);
            }

            // Validar email
            if (!isValidEmail(email.value)) {
                showError(email, 'Por favor ingrese un email válido');
                isValid = false;
            } else {
                removeError(email);
            }

            // Validar teléfono
            if (telefono.value.trim() === '') {
                showError(telefono, 'Por favor ingrese su teléfono');
                isValid = false;
            } else {
                removeError(telefono);
            }

            // Validar mensaje
            if (mensaje.value.trim() === '') {
                showError(mensaje, 'Por favor ingrese su mensaje');
                isValid = false;
            } else {
                removeError(mensaje);
            }

            if (isValid) {
                // Mostrar estado de carga
                const submitBtn = contactForm.querySelector('button[type="submit"]');
                const originalBtnText = submitBtn.innerHTML;
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Enviando...';

                // Preparar datos para enviar
                const formData = {
                    nombre: nombre.value.trim(),
                    email: email.value.trim(),
                    telefono: telefono.value.trim(),
                    empresa: empresa ? empresa.value.trim() : '',
                    servicio: servicio ? servicio.value : '',
                    mensaje: mensaje.value.trim()
                };

                try {
                    // Verificar si la URL está configurada
                    if (GOOGLE_SCRIPT_URL === 'YOUR_GOOGLE_SCRIPT_URL_HERE') {
                        // Modo demo - simular envío exitoso
                        console.log('Datos del formulario (modo demo):', formData);
                        await new Promise(resolve => setTimeout(resolve, 1000));
                        showSuccessMessage('¡Mensaje enviado con éxito! Nos pondremos en contacto pronto.');
                        contactForm.reset();
                    } else {
                        // Enviar a Google Sheets
                        const response = await fetch(GOOGLE_SCRIPT_URL, {
                            method: 'POST',
                            mode: 'no-cors',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify(formData)
                        });

                        // Con mode: 'no-cors' no podemos leer la respuesta,
                        // pero asumimos éxito si no hay error
                        showSuccessMessage('¡Mensaje enviado con éxito! Nos pondremos en contacto pronto.');
                        contactForm.reset();
                    }
                } catch (error) {
                    console.error('Error al enviar:', error);
                    showErrorMessage('Hubo un error al enviar el mensaje. Por favor intenta de nuevo o contáctanos directamente.');
                }

                // Restaurar botón
                submitBtn.disabled = false;
                submitBtn.innerHTML = originalBtnText;
            }
        });
    }
}

function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

function showError(input, message) {
    const formGroup = input.parentElement;
    let errorElement = formGroup.querySelector('.error-message');

    if (!errorElement) {
        errorElement = document.createElement('div');
        errorElement.className = 'error-message text-danger mt-1';
        errorElement.style.fontSize = '0.875rem';
        formGroup.appendChild(errorElement);
    }

    errorElement.textContent = message;
    input.classList.add('is-invalid');
}

function removeError(input) {
    const formGroup = input.parentElement;
    const errorElement = formGroup.querySelector('.error-message');

    if (errorElement) {
        errorElement.remove();
    }

    input.classList.remove('is-invalid');
}

function showSuccessMessage(message) {
    // Remover mensajes anteriores
    const existingAlerts = document.querySelectorAll('.form-alert');
    existingAlerts.forEach(alert => alert.remove());

    const successAlert = document.createElement('div');
    successAlert.className = 'alert alert-success alert-dismissible fade show mt-3 form-alert';
    successAlert.innerHTML = `
        <i class="fas fa-check-circle me-2"></i>
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;

    const form = document.getElementById('contactForm');
    form.parentElement.insertBefore(successAlert, form.nextSibling);

    // Scroll al mensaje
    successAlert.scrollIntoView({ behavior: 'smooth', block: 'center' });

    // Auto-remover después de 8 segundos
    setTimeout(function () {
        if (successAlert.parentElement) {
            successAlert.remove();
        }
    }, 8000);
}

function showErrorMessage(message) {
    // Remover mensajes anteriores
    const existingAlerts = document.querySelectorAll('.form-alert');
    existingAlerts.forEach(alert => alert.remove());

    const errorAlert = document.createElement('div');
    errorAlert.className = 'alert alert-danger alert-dismissible fade show mt-3 form-alert';
    errorAlert.innerHTML = `
        <i class="fas fa-exclamation-circle me-2"></i>
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;

    const form = document.getElementById('contactForm');
    form.parentElement.insertBefore(errorAlert, form.nextSibling);

    // Scroll al mensaje
    errorAlert.scrollIntoView({ behavior: 'smooth', block: 'center' });
}

// ===== COUNTER ANIMATION =====
function initCounters() {
    const counters = document.querySelectorAll('.stat-number');

    if (counters.length === 0) return;

    const observerOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.5
    };

    const observer = new IntersectionObserver(function (entries, observer) {
        entries.forEach(function (entry) {
            if (entry.isIntersecting) {
                const counter = entry.target;
                const target = parseInt(counter.getAttribute('data-target'));
                const duration = 2000; // 2 segundos
                const start = 0;
                const increment = target / (duration / 16);

                animateCounter(counter, start, target, increment);
                observer.unobserve(counter);
            }
        });
    }, observerOptions);

    counters.forEach(function (counter) {
        observer.observe(counter);
    });
}

function animateCounter(element, start, target, increment) {
    let current = start;
    const prefix = element.getAttribute('data-prefix') || '';

    const timer = setInterval(function () {
        current += increment;

        if (current >= target) {
            element.textContent = prefix + formatNumber(target);
            clearInterval(timer);
        } else {
            element.textContent = prefix + formatNumber(Math.floor(current));
        }
    }, 16);
}

function formatNumber(num) {
    if (num >= 1000) {
        return num.toLocaleString('es-PE');
    }
    return num.toString();
}

// ===== SMOOTH SCROLL =====
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        const href = this.getAttribute('href');

        if (href !== '#' && href.length > 1) {
            e.preventDefault();
            const target = document.querySelector(href);

            if (target) {
                const navbarHeight = document.querySelector('.navbar').offsetHeight;
                const targetPosition = target.getBoundingClientRect().top + window.pageYOffset - navbarHeight;

                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        }
    });
});

// ===== ACTIVE NAV LINK =====
function updateActiveNavLink() {
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.navbar-nav .nav-link');

    window.addEventListener('scroll', function () {
        let current = '';
        const scrollY = window.pageYOffset;

        sections.forEach(function (section) {
            const sectionHeight = section.offsetHeight;
            const sectionTop = section.offsetTop - 100;
            const sectionId = section.getAttribute('id');

            if (scrollY > sectionTop && scrollY <= sectionTop + sectionHeight) {
                current = sectionId;
            }
        });

        navLinks.forEach(function (link) {
            link.classList.remove('active');
            if (link.getAttribute('href') === '#' + current) {
                link.classList.add('active');
            }
        });
    });
}

// ===== BACK TO TOP =====
function initBackToTop() {
    const backToTop = document.querySelector('.back-to-top');

    if (backToTop) {
        window.addEventListener('scroll', function () {
            if (window.scrollY > 300) {
                backToTop.classList.add('show');
            } else {
                backToTop.classList.remove('show');
            }
        });

        backToTop.addEventListener('click', function (e) {
            e.preventDefault();
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }
}

// ===== UTILITY FUNCTIONS =====
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = function () {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}
