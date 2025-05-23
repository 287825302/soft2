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
    
    // 粒子背景
    if (typeof particlesJS !== 'undefined') {
        particlesJS('particles-js', {
            particles: {
                number: {
                    value: 80,
                    density: {
                        enable: true,
                        value_area: 800
                    }
                },
                color: {
                    value: '#ffffff'
                },
                shape: {
                    type: 'circle',
                    stroke: {
                        width: 0,
                        color: '#000000'
                    },
                    polygon: {
                        nb_sides: 5
                    }
                },
                opacity: {
                    value: 0.5,
                    random: false,
                    anim: {
                        enable: false,
                        speed: 1,
                        opacity_min: 0.1,
                        sync: false
                    }
                },
                size: {
                    value: 3,
                    random: true,
                    anim: {
                        enable: false,
                        speed: 40,
                        size_min: 0.1,
                        sync: false
                    }
                },
                line_linked: {
                    enable: true,
                    distance: 150,
                    color: '#ffffff',
                    opacity: 0.4,
                    width: 1
                },
                move: {
                    enable: true,
                    speed: 2,
                    direction: 'none',
                    random: false,
                    straight: false,
                    out_mode: 'out',
                    bounce: false,
                    attract: {
                        enable: false,
                        rotateX: 600,
                        rotateY: 1200
                    }
                }
            },
            interactivity: {
                detect_on: 'canvas',
                events: {
                    onhover: {
                        enable: true,
                        mode: 'grab'
                    },
                    onclick: {
                        enable: true,
                        mode: 'push'
                    },
                    resize: true
                },
                modes: {
                    grab: {
                        distance: 140,
                        line_linked: {
                            opacity: 1
                        }
                    },
                    bubble: {
                        distance: 400,
                        size: 40,
                        duration: 2,
                        opacity: 8,
                        speed: 3
                    },
                    repulse: {
                        distance: 200,
                        duration: 0.4
                    },
                    push: {
                        particles_nb: 4
                    },
                    remove: {
                        particles_nb: 2
                    }
                }
            },
            retina_detect: true
        });
    }
    
    // AI聊天功能
    const chatMessages = document.getElementById('chatMessages');
    const userMessage = document.getElementById('userMessage');
    const sendMessage = document.getElementById('sendMessage');
    const startChatBtn = document.getElementById('startChatBtn');
    const suggestionTags = document.querySelectorAll('.suggestion-tag');
    
    // 预设回复
    const aiResponses = {
        '园区地址': '红尔山公墓位于海南省三亚市吉阳区红尔山路88号，距离市区约15公里，驾车约30分钟可到达。',
        '办理流程': '办理墓地需准备：1. 逝者火化证明 2. 申请人身份证 3. 与逝者关系证明。可先电话预约，来园区后由专人全程指导办理。',
        '价格咨询': '我们提供多种类型墓位，价格从8000元至50000元不等，具体价格取决于位置、大小和材质。欢迎来园区实地考察或电话咨询详情。',
        '交通指南': '从三亚市区出发，可乘坐25路公交车至红尔山站下车，步行约10分钟；自驾车导航"三亚市红尔山公墓"即可。园区提供免费停车场。'
    };
    
    // 默认问题回答
    const defaultResponses = [
        '您好！关于这个问题，我建议您可以联系我们的客服热线0898-88XXXXXX获取更详细的信息。',
        '这是一个很好的问题。红尔山公墓提供全方位的服务，包括墓地选购、丧葬服务安排、骨灰安放等。您有具体想了解哪方面的内容吗？',
        '感谢您的咨询。根据您的问题，我们有专业的团队可以提供帮助。您可以在工作时间来园区咨询，或者预约我们的专业顾问上门服务。',
        '您提出的问题很重要。红尔山公墓严格遵守民政部门的相关规定，所有业务办理透明公开，价格明确，服务规范。'
    ];
    
    // 发送消息函数
    function sendUserMessage(message) {
        if (!message.trim()) return;
        
        // 添加用户消息
        const userMsgHTML = `
            <div class="message user">
                <div class="message-content">
                    <p>${message}</p>
                    <span class="message-time">刚刚</span>
                </div>
                <div class="message-avatar">
                    <img src="https://randomuser.me/api/portraits/men/1.jpg" alt="用户">
                </div>
            </div>
        `;
        chatMessages.insertAdjacentHTML('beforeend', userMsgHTML);
        
        // 清空输入框
        userMessage.value = '';
        
        // 滚动到底部
        chatMessages.scrollTop = chatMessages.scrollHeight;
        
        // 显示AI正在输入
        const typingHTML = `
            <div class="message assistant typing">
                <div class="message-avatar">
                    <img src="https://images.unsplash.com/photo-1531746790731-6c087fecd65a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80" alt="小安">
                </div>
                <div class="message-content">
                    <p><span class="typing-indicator"><span>.</span><span>.</span><span>.</span></span></p>
                </div>
            </div>
        `;
        chatMessages.insertAdjacentHTML('beforeend', typingHTML);
        chatMessages.scrollTop = chatMessages.scrollHeight;
        
        // 延迟回复，模拟AI思考
        setTimeout(() => {
            // 移除输入指示
            const typingMessage = document.querySelector('.typing');
            if (typingMessage) {
                typingMessage.remove();
            }
            
            // 获取回复
            let response = '';
            
            // 检查是否匹配预设问题
            for (const [key, value] of Object.entries(aiResponses)) {
                if (message.includes(key)) {
                    response = value;
                    break;
                }
            }
            
            // 如果没有匹配预设问题，随机选择一个默认回复
            if (!response) {
                const randomIndex = Math.floor(Math.random() * defaultResponses.length);
                response = defaultResponses[randomIndex];
            }
            
            // 添加AI回复
            const aiMsgHTML = `
                <div class="message assistant">
                    <div class="message-avatar">
                        <img src="https://images.unsplash.com/photo-1531746790731-6c087fecd65a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80" alt="小安">
                    </div>
                    <div class="message-content">
                        <p>${response}</p>
                        <span class="message-time">刚刚</span>
                    </div>
                </div>
            `;
            chatMessages.insertAdjacentHTML('beforeend', aiMsgHTML);
            
            // 滚动到底部
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }, 1500);
    }
    
    // 绑定发送按钮事件
    if (sendMessage) {
        sendMessage.addEventListener('click', function() {
            sendUserMessage(userMessage.value);
        });
    }
    
    // 绑定输入框回车事件
    if (userMessage) {
        userMessage.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                sendUserMessage(userMessage.value);
            }
        });
    }
    
    // 绑定开始聊天按钮
    if (startChatBtn) {
        startChatBtn.addEventListener('click', function(e) {
            e.preventDefault();
            // 滚动到聊天区域
            document.querySelector('.assistant-chat').scrollIntoView({ behavior: 'smooth' });
            // 聚焦输入框
            userMessage.focus();
        });
    }
    
    // 绑定建议标签点击事件
    suggestionTags.forEach(tag => {
        tag.addEventListener('click', function() {
            sendUserMessage(this.textContent);
        });
    });
    
    // 标签页切换功能
    const tabBtns = document.querySelectorAll('.tab-btn');
    const tabPanes = document.querySelectorAll('.tab-pane');
    
    tabBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            // 移除所有active类
            tabBtns.forEach(b => b.classList.remove('active'));
            tabPanes.forEach(p => p.classList.remove('active'));
            
            // 添加active类到当前元素
            this.classList.add('active');
            
            // 显示对应的内容
            const tabId = this.getAttribute('data-tab');
            document.getElementById(`${tabId}-tab`).classList.add('active');
        });
    });
    
    // FAQ折叠功能
    const faqItems = document.querySelectorAll('.faq-item');
    
    faqItems.forEach(item => {
        const question = item.querySelector('.faq-question');
        
        question.addEventListener('click', function() {
            // 关闭其他打开的FAQ
            faqItems.forEach(otherItem => {
                if (otherItem !== item && otherItem.classList.contains('active')) {
                    otherItem.classList.remove('active');
                    const icon = otherItem.querySelector('.toggle-icon i');
                    icon.className = 'fas fa-plus';
                }
            });
            
            // 切换当前FAQ状态
            item.classList.toggle('active');
            
            // 更改图标
            const icon = this.querySelector('.toggle-icon i');
            if (item.classList.contains('active')) {
                icon.className = 'fas fa-minus';
            } else {
                icon.className = 'fas fa-plus';
            }
        });
    });
    
    // 轮播图功能
    const feedbackTrack = document.getElementById('feedbackTrack');
    const dots = document.querySelectorAll('#sliderDots .dot');
    const prevBtn = document.getElementById('sliderPrev');
    const nextBtn = document.getElementById('sliderNext');
    
    if (feedbackTrack && dots.length > 0) {
        let currentSlide = 0;
        const slideCount = dots.length;
        
        // 更新轮播图位置
        const updateSlider = (index) => {
            feedbackTrack.style.transform = `translateX(-${index * 100}%)`;
            
            // 更新指示点
            dots.forEach((dot, i) => {
                dot.classList.toggle('active', i === index);
            });
            
            currentSlide = index;
        };
        
        // 初始化显示第一个
        updateSlider(0);
        
        // 点击下一个
        if (nextBtn) {
            nextBtn.addEventListener('click', () => {
                const newIndex = (currentSlide + 1) % slideCount;
                updateSlider(newIndex);
            });
        }
        
        // 点击上一个
        if (prevBtn) {
            prevBtn.addEventListener('click', () => {
                const newIndex = (currentSlide - 1 + slideCount) % slideCount;
                updateSlider(newIndex);
            });
        }
        
        // 点击指示点
        dots.forEach((dot, i) => {
            dot.addEventListener('click', () => {
                updateSlider(i);
            });
        });
        
        // 自动轮播
        setInterval(() => {
            const newIndex = (currentSlide + 1) % slideCount;
            updateSlider(newIndex);
        }, 6000);
    }
    
    // 视频预览功能
    const playButton = document.querySelector('.play-button');
    
    if (playButton) {
        playButton.addEventListener('click', function() {
            const previewContainer = document.querySelector('.preview-container');
            const previewImg = previewContainer.querySelector('img');
            const imgSrc = previewImg.src;
            
            // 创建模态框
            const modal = document.createElement('div');
            modal.classList.add('video-modal');
            modal.innerHTML = `
                <div class="video-modal-content">
                    <span class="video-close">&times;</span>
                    <iframe width="100%" height="100%" src="https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            `;
            
            // 添加样式
            const modalStyle = document.createElement('style');
            modalStyle.textContent = `
                .video-modal {
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
                
                .video-modal.show {
                    opacity: 1;
                }
                
                .video-modal-content {
                    width: 80%;
                    height: 80%;
                    position: relative;
                }
                
                .video-close {
                    position: absolute;
                    top: -40px;
                    right: 0;
                    color: white;
                    font-size: 30px;
                    cursor: pointer;
                }
            `;
            document.head.appendChild(modalStyle);
            
            // 添加到页面
            document.body.appendChild(modal);
            
            // 显示模态框
            setTimeout(() => {
                modal.classList.add('show');
            }, 10);
            
            // 关闭模态框
            const closeModal = modal.querySelector('.video-close');
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
    }
    
    // 添加打字效果样式
    const style = document.createElement('style');
    style.textContent = `
        .typing-indicator {
            display: inline-flex;
            align-items: center;
        }
        
        .typing-indicator span {
            width: 5px;
            height: 5px;
            margin: 0 1px;
            background-color: #999;
            border-radius: 50%;
            display: inline-block;
            animation: typing 1.4s infinite both;
        }
        
        .typing-indicator span:nth-child(2) {
            animation-delay: 0.2s;
        }
        
        .typing-indicator span:nth-child(3) {
            animation-delay: 0.4s;
        }
        
        @keyframes typing {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-5px);
            }
            100% {
                transform: translateY(0);
            }
        }
    `;
    document.head.appendChild(style);
});