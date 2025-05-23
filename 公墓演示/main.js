document.addEventListener('DOMContentLoaded', function() {
    // 登录模态框控制
    const loginBtn = document.getElementById('loginBtn');
    const loginModal = document.getElementById('loginModal');
    
    if (loginModal) { // 确保 loginModal 存在
        const closeModalBtn = loginModal.querySelector('.close');
        // const modalContent = loginModal.querySelector('.modal-content'); // Not strictly needed for current logic

        if (loginBtn && closeModalBtn) {
            // 打开模态框
            loginBtn.addEventListener('click', function(event) {
                event.preventDefault(); // 阻止 <a> 标签的默认跳转行为
                loginModal.classList.add('show');
                document.body.classList.add('modal-open'); // 禁止背景滚动
            });

            // 关闭模态框 - 通过关闭按钮
            closeModalBtn.addEventListener('click', function() {
                loginModal.classList.remove('show');
                document.body.classList.remove('modal-open'); // 恢复背景滚动
            });

            // 关闭模态框 - 点击模态框外部区域
            loginModal.addEventListener('click', function(event) {
                if (event.target === loginModal) { // 如果点击的是模态框背景本身
                    loginModal.classList.remove('show');
                    document.body.classList.remove('modal-open'); // 恢复背景滚动
                }
            });

            // 关闭模态框 - 按 ESC键
            document.addEventListener('keydown', function(event) {
                if (event.key === 'Escape' && loginModal.classList.contains('show')) {
                    loginModal.classList.remove('show');
                    document.body.classList.remove('modal-open'); // 恢复背景滚动
                }
            });
        }
    }

    // 视频控制
    const video = document.getElementById('hero-video');
    const playPauseBtn = document.getElementById('play-pause-btn');
    
    if (video && playPauseBtn) {
        playPauseBtn.addEventListener('click', function() {
            if (video.paused || video.ended) {
                video.play();
                playPauseBtn.innerHTML = '<i class="fas fa-pause"></i>';
            } else {
                video.pause();
                playPauseBtn.innerHTML = '<i class="fas fa-play"></i>';
            }
        });
    }
    
    // 特色服务滑块控制
    const featuresSliderContainer = document.querySelector('.features-slider');
    if (featuresSliderContainer) {
        const prevFeatureBtn = document.getElementById('prev-feature');
        const nextFeatureBtn = document.getElementById('next-feature');
        const featureCards = featuresSliderContainer.querySelectorAll('.feature-card');
        const featureDots = document.querySelectorAll('.features .slider-dots .dot');
        
        let currentFeatureSlide = 0;
        const totalFeatureSlides = featureCards.length;

        function updateFeatureSlider() {
            featureCards.forEach((card, index) => {
                card.classList.remove('active');
                if (index === currentFeatureSlide) {
                    card.classList.add('active');
                }
            });
            featureDots.forEach((dot, index) => {
                dot.classList.remove('active');
                if (index === currentFeatureSlide) {
                    dot.classList.add('active');
                }
            });
        }

        if (featureCards.length > 0) {
            featureCards[0].classList.add('active'); // Show first slide initially
            if(featureDots.length > 0) featureDots[0].classList.add('active');

            if (prevFeatureBtn) {
                prevFeatureBtn.addEventListener('click', function() {
                    currentFeatureSlide = (currentFeatureSlide - 1 + totalFeatureSlides) % totalFeatureSlides;
                    updateFeatureSlider();
                });
            }
            
            if (nextFeatureBtn) {
                nextFeatureBtn.addEventListener('click', function() {
                    currentFeatureSlide = (currentFeatureSlide + 1) % totalFeatureSlides;
                    updateFeatureSlider();
                });
            }

            featureDots.forEach(dot => {
                dot.addEventListener('click', function() {
                    currentFeatureSlide = parseInt(this.dataset.index);
                    updateFeatureSlider();
                });
            });
        }
    }

    // 家属感言滑块控制
    const testimonialSliderContainer = document.querySelector('.testimonial-slider');
    if (testimonialSliderContainer) {
        const prevTestimonialBtn = document.getElementById('prev-testimonial');
        const nextTestimonialBtn = document.getElementById('next-testimonial');
        const testimonialCards = testimonialSliderContainer.querySelectorAll('.testimonial-card');
        const testimonialDots = document.querySelectorAll('.testimonials .slider-dots .dot');

        let currentTestimonialSlide = 0;
        const totalTestimonialSlides = testimonialCards.length;

        function updateTestimonialSlider() {
            testimonialCards.forEach((card, index) => {
                card.classList.remove('active');
                if (index === currentTestimonialSlide) {
                    card.classList.add('active');
                }
            });
             testimonialDots.forEach((dot, index) => {
                dot.classList.remove('active');
                if (index === currentTestimonialSlide) {
                    dot.classList.add('active');
                }
            });
        }
        
        if (testimonialCards.length > 0) {
            testimonialCards[0].classList.add('active'); // Show first slide initially
            if(testimonialDots.length > 0) testimonialDots[0].classList.add('active');


            if (prevTestimonialBtn) {
                prevTestimonialBtn.addEventListener('click', function() {
                    currentTestimonialSlide = (currentTestimonialSlide - 1 + totalTestimonialSlides) % totalTestimonialSlides;
                    updateTestimonialSlider();
                });
            }

            if (nextTestimonialBtn) {
                nextTestimonialBtn.addEventListener('click', function() {
                    currentTestimonialSlide = (currentTestimonialSlide + 1) % totalTestimonialSlides;
                    updateTestimonialSlider();
                });
            }
            testimonialDots.forEach(dot => {
                dot.addEventListener('click', function() {
                    currentTestimonialSlide = parseInt(this.dataset.index);
                    updateTestimonialSlider();
                });
            });
        }
    }
    
    // 导航栏滚动效果
    const header = document.querySelector('header');
    if (header) {
        const headerHeight = header.offsetHeight;
        // Adjust hero margin-top based on actual header height after it's rendered
        const heroSection = document.querySelector('.hero');
        if (heroSection) {
            heroSection.style.marginTop = `${headerHeight}px`;
        }

        window.addEventListener('scroll', function() {
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
    }
    
    // 图库图片点击放大效果 (Optimized to use CSS classes)
    const galleryItems = document.querySelectorAll('.gallery-item');
    let galleryModal = null; // Keep a reference to the modal

    function createGalleryModal() {
        if (galleryModal) return galleryModal; // Return existing modal if already created

        const modal = document.createElement('div');
        modal.className = 'gallery-modal'; // Use class from CSS
        
        const closeBtn = document.createElement('button');
        closeBtn.innerHTML = '&times;';
        closeBtn.className = 'modal-close'; // Use class from CSS
        
        const modalImg = document.createElement('img');
        const modalCaption = document.createElement('p');
        
        modal.appendChild(closeBtn);
        modal.appendChild(modalImg);
        modal.appendChild(modalCaption);
        document.body.appendChild(modal);

        closeBtn.addEventListener('click', () => {
            modal.classList.remove('show');
            document.body.classList.remove('modal-open');
        });
        
        modal.addEventListener('click', (e) => {
            if (e.target === modal) {
                modal.classList.remove('show');
                document.body.classList.remove('modal-open');
            }
        });
        galleryModal = modal; // Store reference
        return modal;
    }
    
    galleryItems.forEach(item => {
        item.addEventListener('click', function() {
            const img = this.querySelector('img');
            const captionText = this.querySelector('.caption') ? this.querySelector('.caption').textContent : '';
            
            const modal = createGalleryModal(); // Get or create the modal
            
            const modalImg = modal.querySelector('img');
            const modalCaption = modal.querySelector('p');
            
            modalImg.src = img.src;
            modalImg.alt = img.alt;
            modalCaption.textContent = captionText;
            
            modal.classList.add('show');
            document.body.classList.add('modal-open');
        });
    });
    
    // 平滑滚动到锚点
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            if (href === '#' || href === '') { // Handle cases like href="#"
                e.preventDefault(); // Prevent jumping to top
                window.scrollTo({ top: 0, behavior: 'smooth' }); // Optionally scroll to top
                return;
            }
            
            try {
                const targetElement = document.querySelector(href);
                if (targetElement) {
                    e.preventDefault();
                    const headerHeight = header ? header.offsetHeight : 0;
                    const targetPosition = targetElement.getBoundingClientRect().top + window.pageYOffset - headerHeight;
                    
                    window.scrollTo({
                        top: targetPosition,
                        behavior: 'smooth'
                    });
                }
            } catch (error) {
                // console.warn(`Element with selector "${href}" not found or invalid selector.`);
                // Allow default behavior if querySelector fails (e.g., it's a real link)
            }
        });
    });

    // FAQ 展开/折叠
    const faqItems = document.querySelectorAll('.faq-item');
    faqItems.forEach(item => {
        const question = item.querySelector('.faq-question');
        if (question) {
            question.addEventListener('click', () => {
                const currentlyActive = document.querySelector('.faq-item.active');
                if (currentlyActive && currentlyActive !== item) {
                    currentlyActive.classList.remove('active');
                }
                item.classList.toggle('active');
            });
        }
    });

});