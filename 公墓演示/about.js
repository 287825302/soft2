document.addEventListener('DOMContentLoaded', function() {
    // 3D全景卡片悬停效果
    const panoramicCard = document.querySelector('.panoramic-card');
    const cube = panoramicCard ? panoramicCard.querySelector('.cube') : null;
    
    if (panoramicCard && cube) {
        panoramicCard.addEventListener('mouseenter', function() {
            cube.style.animationPlayState = 'paused';
        });
        
        panoramicCard.addEventListener('mouseleave', function() {
            cube.style.animationPlayState = 'running';
        });
    }
    
    // 页面元素滚动加载动画
    const animatedElements = document.querySelectorAll('.scroll-animate');

    const observerOptions = {
        root: null, // relative to document viewport 
        rootMargin: '0px',
        threshold: 0.1 // 10% of item is visible
    };

    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('is-visible');
                observer.unobserve(entry.target); // Optional: stop observing once animated
            }
        });
    }, observerOptions);

    animatedElements.forEach(el => {
        observer.observe(el);
    });

    // 如果登录表单提交有特定于此页面的行为，可以放在这里
    // 例如，如果提交后不是简单跳转，而是有其他UI更新
    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
        loginForm.addEventListener('submit', function(e) {
            // 默认的跳转行为 action="dashboard.html" 会处理
            // 如果需要阻止默认行为并进行 AJAX 登录或特定处理，则取消下面的注释
            /*
            e.preventDefault();
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            
            console.log('Attempting login with:', username, password);
            // 实际应用中这里会进行 AJAX 请求
            // 假设登录成功:
            // window.location.href = this.action; 
            // 或者显示成功消息等
            */
        });
    }
});