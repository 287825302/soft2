document.addEventListener('DOMContentLoaded', function() {
    // 登录模态框功能
    const loginBtn = document.getElementById('loginBtn');
    const loginModal = document.getElementById('loginModal');
    const closeBtn = document.querySelector('.close');
    
    if (loginBtn && loginModal && closeBtn) {
        loginBtn.addEventListener('click', function(e) {
            e.preventDefault();
            loginModal.style.display = 'block';
        });
        
        closeBtn.addEventListener('click', function() {
            loginModal.style.display = 'none';
        });
        
        window.addEventListener('click', function(e) {
            if (e.target == loginModal) {
                loginModal.style.display = 'none';
            }
        });
    }
    
    // 导航栏滚动效果
    const header = document.querySelector('header');
    
    if (header) {
        window.addEventListener('scroll', function() {
            if (window.scrollY > 100) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
    }
    
    // 卡片动画效果
    const animateOnScroll = function(elements, className) {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add(className);
                }
            });
        }, { threshold: 0.1 });
        
        elements.forEach(el => {
            observer.observe(el);
        });
    };
    
    // 为各种元素添加滚动动画
    animateOnScroll(document.querySelectorAll('.culture-card'), 'fade-in');
    animateOnScroll(document.querySelectorAll('.feature-item'), 'slide-up');
    animateOnScroll(document.querySelectorAll('.gallery-item'), 'fade-in');
    animateOnScroll(document.querySelectorAll('.event-item'), 'slide-in');
    animateOnScroll(document.querySelectorAll('.resource-card'), 'zoom-in');
    
    // 轮播图功能
    const testimonialSlider = document.querySelector('.testimonials-slider');
    const testimonials = document.querySelectorAll('.testimonial-item');
    const dots = document.querySelectorAll('.dot');
    const prevBtn = document.querySelector('.testimonial-prev');
    const nextBtn = document.querySelector('.testimonial-next');
    
    if (testimonialSlider && testimonials.length > 0) {
        let currentSlide = 0;
        
        // 隐藏所有轮播项，只显示当前的
        const showSlide = (index) => {
            testimonials.forEach((slide, i) => {
                slide.style.display = i === index ? 'block' : 'none';
            });
            
            dots.forEach((dot, i) => {
                dot.classList.toggle('active', i === index);
            });
        };
        
        // 初始化显示第一个
        showSlide(currentSlide);
        
        // 点击下一个
        if (nextBtn) {
            nextBtn.addEventListener('click', () => {
                currentSlide = (currentSlide + 1) % testimonials.length;
                showSlide(currentSlide);
            });
        }
        
        // 点击上一个
        if (prevBtn) {
            prevBtn.addEventListener('click', () => {
                currentSlide = (currentSlide - 1 + testimonials.length) % testimonials.length;
                showSlide(currentSlide);
            });
        }
        
        // 点击指示点
        dots.forEach((dot, i) => {
            dot.addEventListener('click', () => {
                currentSlide = i;
                showSlide(currentSlide);
            });
        });
        
        // 自动轮播
        setInterval(() => {
            currentSlide = (currentSlide + 1) % testimonials.length;
            showSlide(currentSlide);
        }, 5000);
    }
    
    // 为CSS添加动画类
    const style = document.createElement('style');
    style.textContent = `
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        @keyframes slideUp {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        
        @keyframes slideIn {
            from { transform: translateX(-50px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        
        @keyframes zoomIn {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }
        
        .fade-in {
            animation: fadeIn 0.8s ease forwards;
        }
        
        .slide-up {
            animation: slideUp 0.8s ease forwards;
        }
        
        .slide-in {
            animation: slideIn 0.8s ease forwards;
        }
        
        .zoom-in {
            animation: zoomIn 0.8s ease forwards;
        }
        
        .culture-card, .feature-item, .gallery-item, .event-item, .resource-card {
            opacity: 0;
        }
    `;
    document.head.appendChild(style);
    
    // 图片画廊点击放大效果
    const galleryItems = document.querySelectorAll('.gallery-item');
    
    galleryItems.forEach(item => {
        item.addEventListener('click', function() {
            const imgSrc = this.querySelector('img').src;
            const imgTitle = this.querySelector('h3').textContent;
            
            const modal = document.createElement('div');
            modal.classList.add('gallery-modal');
            modal.innerHTML = `
                <div class="gallery-modal-content">
                    <span class="gallery-close">&times;</span>
                    <img src="${imgSrc}" alt="${imgTitle}">
                    <h3>${imgTitle}</h3>
                </div>
            `;
            
            document.body.appendChild(modal);
            
            // 添加样式
            const modalStyle = document.createElement('style');
            modalStyle.textContent = `
                .gallery-modal {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background-color: rgba(0, 0, 0, 0.9);
                    z-index: 1000;
                    opacity: 0;
                    transition: opacity 0.3s ease;
                }
                
                .gallery-modal.show {
                    opacity: 1;
                }
                
                .gallery-modal-content {
                    max-width: 80%;
                    max-height: 80%;
                    position: relative;
                }
                
                .gallery-modal-content img {
                    max-width: 100%;
                    max-height: 80vh;
                    display: block;
                    border: 5px solid white;
                    box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
                }
                
                .gallery-modal-content h3 {
                    color: white;
                    text-align: center;
                    margin-top: 20px;
                    font-family: 'Noto Serif SC', serif;
                }
                
                .gallery-close {
                    position: absolute;
                    top: -40px;
                    right: -40px;
                    color: white;
                    font-size: 30px;
                    cursor: pointer;
                    width: 30px;
                    height: 30px;
                    text-align: center;
                    line-height: 30px;
                }
            `;
            document.head.appendChild(modalStyle);
            
            // 显示模态框
            setTimeout(() => {
                modal.classList.add('show');
            }, 10);
            
            // 关闭模态框
            const closeModal = document.querySelector('.gallery-close');
            closeModal.addEventListener('click', function() {
                modal.classList.remove('show');
                setTimeout(() => {
                    document.body.removeChild(modal);
                }, 300);
            });
            
            // 点击背景关闭
            modal.addEventListener('click', function(e) {
                if (e.target === modal) {
                    modal.classList.remove('show');
                    setTimeout(() => {
                        document.body.removeChild(modal);
                    }, 300);
                }
            });
        });
    });
});