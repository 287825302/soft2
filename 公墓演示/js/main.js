document.addEventListener('DOMContentLoaded', function() {
    // 登录模态框
    const loginBtn = document.getElementById('loginBtn');
    const loginModal = document.getElementById('loginModal');
    const closeBtn = document.querySelector('.close');
    const loginForm = document.getElementById('loginForm');
    
    loginBtn.addEventListener('click', function(e) {
        e.preventDefault();
        loginModal.style.display = 'block';
        document.body.style.overflow = 'hidden'; // 防止背景滚动
    });
    
    closeBtn.addEventListener('click', function() {
        loginModal.style.display = 'none';
        document.body.style.overflow = '';
    });
    
    window.addEventListener('click', function(e) {
        if (e.target == loginModal) {
            loginModal.style.display = 'none';
            document.body.style.overflow = '';
        }
    });
    
    loginForm.addEventListener('submit', function(e) {
        e.preventDefault();
        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        
        // 这里是静态演示，实际应用中应该进行真正的验证
        if (username && password) {
            // 跳转到仪表盘页面
            window.location.href = 'dashboard.html';
        } else {
            alert('请输入用户名和密码');
        }
    });
    
    // 视频控制
    const video = document.getElementById('hero-video');
    const playPauseBtn = document.getElementById('play-pause-btn');
    
    playPauseBtn.addEventListener('click', function() {
        if (video.paused) {
            video.play();
            playPauseBtn.innerHTML = '<i class="fas fa-pause"></i>';
        } else {
            video.pause();
            playPauseBtn.innerHTML = '<i class="fas fa-play"></i>';
        }
    });
    
    // 特色服务滑块控制
    const prevBtn = document.getElementById('prev-feature');
    const nextBtn = document.getElementById('next-feature');
    const featureCards = document.querySelectorAll('.feature-card');
    const featureDots = document.querySelectorAll('.features .dot');
    
    let currentFeature = 0;
    const totalFeatures = featureCards.length;
    
    // 初始化显示第一张卡片
    updateFeatureSlider();
    
    prevBtn.addEventListener('click', function() {
        currentFeature = (currentFeature - 1 + totalFeatures) % totalFeatures;
        updateFeatureSlider();
    });
    
    nextBtn.addEventListener('click', function() {
        currentFeature = (currentFeature + 1) % totalFeatures;
        updateFeatureSlider();
    });
    
    // 点击圆点切换滑块
    featureDots.forEach((dot, index) => {
        dot.addEventListener('click', function() {
            currentFeature = index;
            updateFeatureSlider();
        });
    });
    
    function updateFeatureSlider() {
        featureCards.forEach((card, index) => {
            if (index === currentFeature) {
                card.classList.add('active');
            } else {
                card.classList.remove('active');
            }
        });
        
        featureDots.forEach((dot, index) => {
            if (index === currentFeature) {
                dot.classList.add('active');
            } else {
                dot.classList.remove('active');
            }
        });
    }
    
    // 家属感言滑块控制
    const prevTestimonialBtn = document.getElementById('prev-testimonial');
    const nextTestimonialBtn = document.getElementById('next-testimonial');
    const testimonialCards = document.querySelectorAll('.testimonial-card');
    const testimonialDots = document.querySelectorAll('.testimonials .dot');
    
    let currentTestimonial = 0;
    const totalTestimonials = testimonialCards.length;
    
    // 初始化显示第一个感言
    updateTestimonialSlider();
    
    prevTestimonialBtn.addEventListener('click', function() {
        currentTestimonial = (currentTestimonial - 1 + totalTestimonials) % totalTestimonials;
        updateTestimonialSlider();
    });
    
    nextTestimonialBtn.addEventListener('click', function() {
        currentTestimonial = (currentTestimonial + 1) % totalTestimonials;
        updateTestimonialSlider();
    });
    
    // 点击圆点切换滑块
    testimonialDots.forEach((dot, index) => {
        dot.addEventListener('click', function() {
            currentTestimonial = index;
            updateTestimonialSlider();
        });
    });
    
    function updateTestimonialSlider() {
        testimonialCards.forEach((card, index) => {
            if (index === currentTestimonial) {
                card.classList.add('active');
            } else {
                card.classList.remove('active');
            }
        });
        
        testimonialDots.forEach((dot, index) => {
            if (index === currentTestimonial) {
                dot.classList.add('active');
            } else {
                dot.classList.remove('active');
            }
        });
    }
    
    // 自动轮播家属感言
    setInterval(function() {
        currentTestimonial = (currentTestimonial + 1) % totalTestimonials;
        updateTestimonialSlider();
    }, 5000);
    
    // 导航栏滚动效果
    const header = document.querySelector('header');
    
    window.addEventListener('scroll', function() {
        if (window.scrollY > 50) {
            header.style.backgroundColor = 'rgba(255, 255, 255, 0.95)';
            header.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.1)';
        } else {
            header.style.backgroundColor = 'var(--white)';
            header.style.boxShadow = 'var(--shadow-sm)';
        }
    });
    
    // FAQ 手风琴效果
    const faqQuestions = document.querySelectorAll('.faq-question');
    
    faqQuestions.forEach(question => {
        question.addEventListener('click', function() {
            // 关闭其他已打开的问题
            faqQuestions.forEach(item => {
                if (item !== question && item.classList.contains('active')) {
                    item.classList.remove('active');
                }
            });
            
            // 切换当前问题的状态
            this.classList.toggle('active');
        });
    });
    
    // 图库图片点击放大效果
    const galleryItems = document.querySelectorAll('.gallery-item');
    
    galleryItems.forEach(item => {
        item.addEventListener('click', function() {
            const img = this.querySelector('img');
            const caption = this.querySelector('.caption').textContent;
            
            // 创建模态框
            const modal = document.createElement('div');
            modal.className = 'gallery-modal';
            
            // 添加图片
            const modalImg = document.createElement('img');
            modalImg.src = img.src;
            modalImg.alt = img.alt;
            
            // 添加标题
            const modalCaption = document.createElement('p');
            modalCaption.textContent = caption;
            
            // 添加关闭按钮
            const closeBtn = document.createElement('button');
            closeBtn.innerHTML = '&times;';
            closeBtn.className = 'modal-close';
            
            // 组装模态框
            modal.appendChild(closeBtn);
            modal.appendChild(modalImg);
            modal.appendChild(modalCaption);
            
            // 添加到页面
            document.body.appendChild(modal);
            document.body.style.overflow = 'hidden'; // 防止背景滚动
            
            // 添加样式
            modal.style.position = 'fixed';
            modal.style.top = '0';
            modal.style.left = '0';
            modal.style.width = '100%';
            modal.style.height = '100%';
            modal.style.backgroundColor = 'rgba(0, 0, 0, 0.9)';
            modal.style.display = 'flex';
            modal.style.flexDirection = 'column';
            modal.style.alignItems = 'center';
            modal.style.justifyContent = 'center';
            modal.style.zIndex = '2000';
            modal.style.padding = '20px';
            
            modalImg.style.maxWidth = '90%';
            modalImg.style.maxHeight = '80%';
            modalImg.style.objectFit = 'contain';
            
            modalCaption.style.color = 'white';
            modalCaption.style.marginTop = '10px';
            modalCaption.style.fontSize = '1.2rem';
            
            closeBtn.style.position = 'absolute';
            closeBtn.style.top = '20px';
            closeBtn.style.right = '20px';
            closeBtn.style.backgroundColor = 'transparent';
            closeBtn.style.border = 'none';
            closeBtn.style.color = 'white';
            closeBtn.style.fontSize = '2rem';
            closeBtn.style.cursor = 'pointer';
            
            // 关闭模态框
            closeBtn.addEventListener('click', function() {
                document.body.removeChild(modal);
                document.body.style.overflow = '';
            });
            
            // 点击模态框背景也可关闭
            modal.addEventListener('click', function(e) {
                if (e.target === modal) {
                    document.body.removeChild(modal);
                    document.body.style.overflow = '';
                }
            });
        });
    });
    
    // 平滑滚动到锚点
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            if (this.getAttribute('href') === '#') return;
            
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            
            if (targetElement) {
                const headerHeight = header.offsetHeight;
                const targetPosition = targetElement.getBoundingClientRect().top + window.pageYOffset - headerHeight;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });
});