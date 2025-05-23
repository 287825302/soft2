document.addEventListener('DOMContentLoaded', function() {
    // --- DOM Element References ---
    const deceasedPhoto = document.getElementById('deceasedPhoto');
    const deceasedName = document.getElementById('deceasedName');
    const deceasedDates = document.getElementById('deceasedDates');
    const deceasedDatesTo = document.getElementById('deceasedDatesTo');
    const changeDeceasedBtn = document.getElementById('changeDeceasedBtn');

    const sceneSelector = document.getElementById('sceneSelector');
    const memorialAltar = document.getElementById('memorialAltar');
    const musicSelector = document.getElementById('musicSelector');
    const backgroundMusic = document.getElementById('backgroundMusic');
    const playMusicBtn = document.getElementById('playMusicBtn');

    const actionBtns = document.querySelectorAll('.memorial-actions .action-btn');
    const animationEffectsContainer = document.querySelector('.memorial-altar-area .animation-effects');
    const incenseBurnerEl = document.getElementById('incenseBurner');
    const candleHolderLeftEl = document.getElementById('candleHolderLeft');
    const candleHolderRightEl = document.getElementById('candleHolderRight');
    const flowerVaseEl = document.getElementById('flowerVase');
    const wineCupEl = document.getElementById('wineCup');
    const offeringSpots = document.querySelectorAll('.offering-spot');


    const shopTabs = document.querySelectorAll('.shop-tabs .tab-btn');
    const shopPanels = document.querySelectorAll('.memorial-shop-cart .shop-panel');
    const addToCartBtns = document.querySelectorAll('.add-to-cart-btn');
    const cartCountEl = document.getElementById('cartCount');
    const cartItemsContainer = document.getElementById('cartItemsContainer');
    const cartTotalItemsEl = document.getElementById('cartTotalItems');
    const cartTotalPriceEl = document.getElementById('cartTotalPrice');
    const checkoutBtn = document.getElementById('checkoutBtn');

    const guestbookTextarea = document.getElementById('guestbookTextarea');
    const guestbookUser = document.getElementById('guestbookUser');
    const submitMessageBtn = document.getElementById('submitMessageBtn');
    const guestbookMessagesContainer = document.getElementById('guestbookMessages');

    const checkoutModal = document.getElementById('checkoutModal');
    const closeCheckoutModalBtn = document.getElementById('closeCheckoutModalBtn');
    const checkoutItemList = document.getElementById('checkoutItemList');
    const checkoutOrderTotal = document.getElementById('checkoutOrderTotal');
    const agreeToTermsCheckbox = document.getElementById('agreeToTerms');
    const paymentMethodRadios = document.querySelectorAll('input[name="paymentMethod"]');
    const confirmPaymentBtn = document.getElementById('confirmPaymentBtn');

    const paymentQRModal = document.getElementById('paymentQRModal');
    const closePaymentQRModalBtn = document.getElementById('closePaymentQRModalBtn');
    const paymentQRTitle = document.getElementById('paymentQRTitle');
    const paymentQRCodeImg = document.getElementById('paymentQRCodeImg');
    const paymentSuccessfulBtn = document.getElementById('paymentSuccessfulBtn');
    const cancelPaymentBtn = document.getElementById('cancelPaymentBtn');

    // --- 场景图片映射 ---
    const sceneImages = {
        'scene1': 'https://i.ibb.co/HdMqjGK/altar-scene1.jpg',
        'scene2': 'https://i.ibb.co/0yw3q9N/altar-scene2.jpg',
        'scene3': 'https://i.ibb.co/vw4Jz5j/altar-scene3.jpg'
    };
    
    // --- 音乐文件映射 ---
    const musicFiles = {
        'music1': 'https://assets.codepen.io/4358584/Anitek_-_Komorebi.mp3',
        'music2': 'https://assets.codepen.io/4358584/Moonlight_Sonata_-_First_Movement.mp3'
    };

    // --- 祭品图片映射 ---
    const altarItemImages = {
        incense: {
            0: 'https://i.ibb.co/tJyJRQs/incense-burner.png',
            1: 'https://i.ibb.co/jVSCfcH/incense-burner-1.png',
            2: 'https://i.ibb.co/Qc9Gd9g/incense-burner-2.png',
            3: 'https://i.ibb.co/TcMdpLf/incense-burner-3.png'
        },
        candleLeft: {
            off: 'https://i.ibb.co/1qpJYkr/candle-holder.png',
            on: 'https://i.ibb.co/WpHZFxj/candle-lit.png'
        },
        candleRight: {
            off: 'https://i.ibb.co/1qpJYkr/candle-holder.png',
            on: 'https://i.ibb.co/WpHZFxj/candle-lit.png'
        },
        flower: {
            0: 'https://i.ibb.co/xSgcgwL/flower-vase.png',
            1: 'https://i.ibb.co/5x2Qvzx/flower-vase-1.png',
            2: 'https://i.ibb.co/CvXRJRK/flower-vase-2.png',
            3: 'https://i.ibb.co/wgQs3hd/flower-vase-3.png'
        },
        wine: {
            0: 'https://i.ibb.co/ZJgVkzL/wine-cup.png',
            1: 'https://i.ibb.co/BZqRXLf/wine-cup-full.png'
        }
    };

    // --- State Variables ---
    let cart = [];
    let currentDeceased = {
        name: "先考 李明 府君",
        photo: "https://i.ibb.co/YZnGJkS/deceased-photo.jpg",
        birth: "1950年1月1日",
        death: "2020年12月31日"
    };
    let altarItemsPlaced = { // To track what's on the altar
        incense: 0,
        candleLeft: false,
        candleRight: false,
        flower: 0,
        wine: 0,
        offerings: {} // key: spotId, value: item object
    };


    // --- Initialization ---
    function initializePage() {
        updateDeceasedInfo();
        updateCartDisplay();
        loadGuestbookMessages();
        
        // 保存祭品区原始文本
        offeringSpots.forEach(spot => {
            spot.dataset.originalText = spot.textContent;
        });
        
        // 设置默认场景
        if(memorialAltar && sceneSelector.value) {
            memorialAltar.style.backgroundImage = `url('${sceneImages[sceneSelector.value]}')`;
        }
        
        // 添加模态框关闭功能
        setupModals();
    }

    // --- 模态框设置 ---
    function setupModals() {
        // 点击模态框外部关闭
        window.addEventListener('click', function(event) {
            if (event.target === checkoutModal) {
                checkoutModal.classList.remove('show');
                document.body.classList.remove('modal-open');
            }
            if (event.target === paymentQRModal) {
                paymentQRModal.classList.remove('show');
                document.body.classList.remove('modal-open');
            }
        });
    }

    // --- Deceased Info ---
    function updateDeceasedInfo() {
        deceasedPhoto.src = currentDeceased.photo;
        deceasedPhoto.alt = currentDeceased.name;
        deceasedName.textContent = currentDeceased.name;
        deceasedDates.textContent = `生于 ${currentDeceased.birth}`;
        deceasedDatesTo.textContent = `卒于 ${currentDeceased.death}`;
    }

    if (changeDeceasedBtn) {
        changeDeceasedBtn.addEventListener('click', () => {
            // Simulate changing deceased: In a real app, this would involve a selection UI
            const newName = prompt("请输入新的祭奠对象姓名：", currentDeceased.name);
            if (newName) {
                currentDeceased.name = newName;
                // 使用更真实的默认头像
                currentDeceased.photo = `https://i.ibb.co/Hn4C9rq/default-avatar.jpg`; 
                updateDeceasedInfo();
                showTemporaryMessage(`祭奠对象已更换为 ${newName}`, memorialAltar);
                resetAltar(); // Reset altar for new deceased
            }
        });
    }
    
    function resetAltar() {
        altarItemsPlaced = { incense: 0, candleLeft: false, candleRight: false, flower: 0, wine: 0, offerings: {} };
        // Clear visual elements from altar
        if(animationEffectsContainer) animationEffectsContainer.innerHTML = '';
        
        // 重置祭品区
        offeringSpots.forEach(spot => {
            spot.innerHTML = spot.dataset.originalText || `祭品区${Array.from(offeringSpots).indexOf(spot) + 1}`;
            spot.dataset.occupied = "false";
        });

        // 重置祭台物品图片
        if(incenseBurnerEl) incenseBurnerEl.querySelector('img').src = altarItemImages.incense[0];
        if(candleHolderLeftEl) candleHolderLeftEl.querySelector('img').src = altarItemImages.candleLeft.off;
        if(candleHolderRightEl) candleHolderRightEl.querySelector('img').src = altarItemImages.candleRight.off;
        if(flowerVaseEl) flowerVaseEl.querySelector('img').src = altarItemImages.flower[0];
        if(wineCupEl) wineCupEl.querySelector('img').src = altarItemImages.wine[0];
    }


    // --- Scene and Music ---
    if (sceneSelector && memorialAltar) {
        sceneSelector.addEventListener('change', function() {
            memorialAltar.style.backgroundImage = `url('${sceneImages[this.value]}')`;
            showTemporaryMessage(`场景已更换为 ${this.options[this.selectedIndex].text}`, memorialAltar);
        });
    }

    if (musicSelector && backgroundMusic && playMusicBtn) {
        musicSelector.addEventListener('change', function() {
            if (this.value === "none") {
                backgroundMusic.pause();
                backgroundMusic.src = "";
                playMusicBtn.innerHTML = '<i class="fas fa-play"></i> 播放';
            } else {
                backgroundMusic.src = musicFiles[this.value];
                if (playMusicBtn.innerHTML.includes('fa-pause')) { // If was playing, play new song
                    backgroundMusic.play();
                }
                showTemporaryMessage(`已选择音乐: ${this.options[this.selectedIndex].text}`, memorialAltar);
            }
        });

        playMusicBtn.addEventListener('click', function() {
            if (musicSelector.value === "none") {
                showTemporaryMessage("请先选择一首音乐", memorialAltar);
                return;
            }
            
            if (backgroundMusic.paused && backgroundMusic.src) {
                backgroundMusic.play();
                this.innerHTML = '<i class="fas fa-pause"></i> 暂停';
                showTemporaryMessage("音乐播放中", memorialAltar);
            } else {
                backgroundMusic.pause();
                this.innerHTML = '<i class="fas fa-play"></i> 播放';
                showTemporaryMessage("音乐已暂停", memorialAltar);
            }
        });
    }

    // --- Memorial Actions (Virtual) ---
    actionBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const action = this.dataset.action;
            performAltarAction(action);
        });
    });

    function performAltarAction(action) {
        if (!animationEffectsContainer) return;
        let message = "";
        
        switch(action) {
            case 'incense':
                if (altarItemsPlaced.incense < 3) { // Max 3 incense sticks
                    altarItemsPlaced.incense++;
                    
                    // 创建多个烟雾效果
                    for (let i = 0; i < 3; i++) {
                        setTimeout(() => {
                            const smoke = document.createElement('div');
                            smoke.className = 'smoke-effect';
                            smoke.style.left = `${45 + (Math.random()*10) - 5}%`; // Randomize position slightly
                            smoke.style.bottom = '60%'; // Adjust based on香炉位置
                            smoke.style.animationDelay = `${Math.random() * 0.5}s`;
                            animationEffectsContainer.appendChild(smoke);
                            setTimeout(() => smoke.remove(), 3000);
                        }, i * 300);
                    }
                    
                    message = `您为 ${currentDeceased.name} 上了一炷香。`;
                    if(incenseBurnerEl) incenseBurnerEl.querySelector('img').src = altarItemImages.incense[altarItemsPlaced.incense];
                } else {
                    message = "香已经上满了。";
                }
                break;
                
            case 'candle':
                if (!altarItemsPlaced.candleLeft) {
                    altarItemsPlaced.candleLeft = true;
                    const flameLeft = document.createElement('div');
                    flameLeft.className = 'candle-flame';
                    flameLeft.style.bottom = '75%'; // Adjust based on烛台位置
                    flameLeft.style.left = '20%';   // Adjust
                    animationEffectsContainer.appendChild(flameLeft);
                    message = `您为 ${currentDeceased.name} 点燃了左边的蜡烛。`;
                    if(candleHolderLeftEl) candleHolderLeftEl.querySelector('img').src = altarItemImages.candleLeft.on;

                } else if (!altarItemsPlaced.candleRight) {
                    altarItemsPlaced.candleRight = true;
                    const flameRight = document.createElement('div');
                    flameRight.className = 'candle-flame';
                    flameRight.style.bottom = '75%';
                    flameRight.style.right = '20%';
                    animationEffectsContainer.appendChild(flameRight);
                    message = `您为 ${currentDeceased.name} 点燃了右边的蜡烛。`;
                    if(candleHolderRightEl) candleHolderRightEl.querySelector('img').src = altarItemImages.candleRight.on;
                } else {
                    message = "蜡烛已经点亮。";
                }
                break;
                
            case 'flower': // This is a basic virtual action, real flowers are purchased
                if (altarItemsPlaced.flower < 3) {
                    altarItemsPlaced.flower++;
                    
                    // 创建花瓣飘落效果
                    const flowerColors = ['#ffaaaa', '#ffffaa', '#aaffaa', '#aaaaff', '#ffaaff'];
                    for (let i = 0; i < 8; i++) {
                        setTimeout(() => {
                            const petal = document.createElement('div');
                            petal.className = 'flower-effect';
                            petal.style.left = `${20 + Math.random()*60}%`;
                            petal.style.bottom = '40%';
                            petal.style.backgroundColor = flowerColors[Math.floor(Math.random() * flowerColors.length)];
                            petal.style.borderRadius = '50% 0 50% 0';
                            petal.style.transform = `rotate(${Math.random() * 360}deg)`;
                            animationEffectsContainer.appendChild(petal);
                            setTimeout(() => petal.remove(), 4000);
                        }, i * 200);
                    }
                    
                    message = `您向 ${currentDeceased.name} 敬献了鲜花。`;
                    if(flowerVaseEl) flowerVaseEl.querySelector('img').src = altarItemImages.flower[altarItemsPlaced.flower];
                } else {
                    message = "花瓶已经插满鲜花。";
                }
                break;
                
            case 'wine': // Enhanced virtual action
                if (altarItemsPlaced.wine === 0) {
                    altarItemsPlaced.wine = 1;
                    
                    // 创建倒酒效果
                    for (let i = 0; i < 5; i++) {
                        setTimeout(() => {
                            const wine = document.createElement('div');
                            wine.className = 'wine-effect';
                            wine.style.left = `${65 + (Math.random()*4) - 2}%`;
                            wine.style.top = '45%';
                            animationEffectsContainer.appendChild(wine);
                            setTimeout(() => wine.remove(), 2000);
                        }, i * 100);
                    }
                    
                    message = `您向 ${currentDeceased.name} 敬了一杯美酒。`;
                    if(wineCupEl) wineCupEl.querySelector('img').src = altarItemImages.wine[1];
                } else {
                    message = "酒杯已满，您可以再次点击重新倒酒。";
                    // 重置酒杯
                    altarItemsPlaced.wine = 0;
                    if(wineCupEl) wineCupEl.querySelector('img').src = altarItemImages.wine[0];
                }
                break;
                
            default:
                message = "未知的操作。";
        }
        
        showTemporaryMessage(message, memorialAltar);
    }
    
    function showTemporaryMessage(message, container) {
        // 移除可能存在的旧消息
        const oldMsg = container.querySelector('.temp-message');
        if (oldMsg) oldMsg.remove();
        
        const msgDiv = document.createElement('div');
        msgDiv.className = 'temp-message';
        msgDiv.textContent = message;
        
        container.appendChild(msgDiv);
        
        setTimeout(() => { msgDiv.style.opacity = '1'; }, 10); // Fade in
        setTimeout(() => {
            msgDiv.style.opacity = '0';
            setTimeout(() => { msgDiv.remove(); }, 500); // Remove after fade out
        }, 3000);
    }

    // --- Shop and Cart ---
    shopTabs.forEach(tab => {
        tab.addEventListener('click', function() {
            shopTabs.forEach(t => t.classList.remove('active'));
            shopPanels.forEach(p => p.classList.remove('active'));
            this.classList.add('active');
            document.getElementById(this.dataset.tab === 'cart' ? 'cartView' : `shop${this.dataset.tab.charAt(0).toUpperCase() + this.dataset.tab.slice(1)}`).classList.add('active');
        });
    });

    addToCartBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const itemEl = this.closest('.shop-item, .service-item');
            const item = {
                id: itemEl.dataset.id,
                name: itemEl.dataset.name,
                price: parseFloat(itemEl.dataset.price),
                type: itemEl.classList.contains('shop-item') ? 'item' : 'service',
                quantity: 1,
                img: itemEl.querySelector('img') ? itemEl.querySelector('img').src : ''
            };
            addItemToCart(item);
        });
    });

    function addItemToCart(item) {
        const existingItem = cart.find(cartItem => cartItem.id === item.id);
        if (existingItem) {
            existingItem.quantity++;
        } else {
            cart.push(item);
        }
        updateCartDisplay();
        showTemporaryMessage(`${item.name} 已加入购物车`, document.querySelector('.memorial-shop-cart'));
        
        // 自动切换到购物车标签
        setTimeout(() => {
            const cartTab = document.querySelector('.tab-btn[data-tab="cart"]');
            if (cartTab) cartTab.click();
        }, 300);
    }

    function updateCartDisplay() {
        cartItemsContainer.innerHTML = ''; // Clear previous items
        let totalItems = 0;
        let totalPrice = 0;

        if (cart.length === 0) {
            cartItemsContainer.innerHTML = '<p class="empty-cart-message">购物车是空的，快去选购祭品吧！</p>';
        } else {
            cart.forEach((item, index) => {
                const itemDiv = document.createElement('div');
                itemDiv.className = 'cart-item';
                itemDiv.innerHTML = `
                    <div class="cart-item-details">
                        <span class="cart-item-name">${item.name}</span>
                        <span class="cart-item-price">¥${item.price.toFixed(2)}</span>
                    </div>
                    <div class="cart-item-quantity">
                        <button class="quantity-change" data-index="${index}" data-change="-1">-</button>
                        <input type="number" value="${item.quantity}" min="1" data-index="${index}" class="quantity-input">
                        <button class="quantity-change" data-index="${index}" data-change="1">+</button>
                    </div>
                    <span>¥${(item.price * item.quantity).toFixed(2)}</span>
                    <button class="remove-cart-item-btn" data-index="${index}">&times;</button>
                `;
                cartItemsContainer.appendChild(itemDiv);
                totalItems += item.quantity;
                totalPrice += item.price * item.quantity;
            });
        }

        cartCountEl.textContent = `(${totalItems})`;
        cartTotalItemsEl.textContent = totalItems;
        cartTotalPriceEl.textContent = totalPrice.toFixed(2);
        checkoutBtn.disabled = cart.length === 0;

        // Add event listeners for new cart item controls
        cartItemsContainer.querySelectorAll('.quantity-change').forEach(btn => {
            btn.addEventListener('click', handleQuantityChange);
        });
        cartItemsContainer.querySelectorAll('.quantity-input').forEach(input => {
            input.addEventListener('change', handleQuantityInputChange);
        });
        cartItemsContainer.querySelectorAll('.remove-cart-item-btn').forEach(btn => {
            btn.addEventListener('click', handleRemoveItem);
        });
    }

    function handleQuantityChange(event) {
        const index = parseInt(event.target.dataset.index);
        const change = parseInt(event.target.dataset.change);
        cart[index].quantity += change;
        if (cart[index].quantity < 1) {
            cart[index].quantity = 1;
        }
        updateCartDisplay();
    }
    function handleQuantityInputChange(event) {
        const index = parseInt(event.target.dataset.index);
        let newQuantity = parseInt(event.target.value);
        if (isNaN(newQuantity) || newQuantity < 1) {
            newQuantity = 1;
            event.target.value = 1; // Correct input field if invalid
        }
        cart[index].quantity = newQuantity;
        updateCartDisplay();
    }
    function handleRemoveItem(event) {
        const index = parseInt(event.target.dataset.index);
        cart.splice(index, 1);
        updateCartDisplay();
    }
    
    // --- Guestbook ---
    function loadGuestbookMessages() {
        const messages = JSON.parse(localStorage.getItem('guestbookMessages')) || [];
        guestbookMessagesContainer.innerHTML = ''; // Clear
        if (messages.length === 0) {
            guestbookMessagesContainer.innerHTML = '<p class="empty-message">暂无留言，说点什么吧...</p>';
            return;
        }
        messages.forEach(msg => addMessageToDOM(msg));
    }

    function addMessageToDOM(message) {
        if (guestbookMessagesContainer.querySelector('.empty-message')) {
            guestbookMessagesContainer.innerHTML = ''; // Remove "empty" message
        }
        const entryDiv = document.createElement('div');
        entryDiv.className = 'guestbook-entry';
        entryDiv.innerHTML = `
            <p>${escapeHTML(message.text)}</p>
            <div class="guestbook-meta">
                <span class="user">${escapeHTML(message.user) || '匿名用户'}</span> - 
                <span class="timestamp">${new Date(message.timestamp).toLocaleString()}</span>
            </div>
        `;
        guestbookMessagesContainer.prepend(entryDiv); // Add new messages to the top
        
        // 添加淡入动画
        entryDiv.style.opacity = '0';
        entryDiv.style.transform = 'translateY(20px)';
        entryDiv.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
        setTimeout(() => {
            entryDiv.style.opacity = '1';
            entryDiv.style.transform = 'translateY(0)';
        }, 10);
    }
    
    function escapeHTML(str) {
        const div = document.createElement('div');
        div.appendChild(document.createTextNode(str));
        return div.innerHTML;
    }


    if (submitMessageBtn) {
        submitMessageBtn.addEventListener('click', function() {
            const text = guestbookTextarea.value.trim();
            const user = guestbookUser.value.trim() || "匿名用户";
            if (text) {
                const newMessage = { text, user, timestamp: new Date().toISOString() };
                let messages = JSON.parse(localStorage.getItem('guestbookMessages')) || [];
                messages.push(newMessage);
                localStorage.setItem('guestbookMessages', JSON.stringify(messages));
                addMessageToDOM(newMessage);
                guestbookTextarea.value = '';
                
                showTemporaryMessage("留言发表成功，感谢您的祝福", document.querySelector('.guestbook-section'));
            } else {
                showTemporaryMessage("请输入留言内容", document.querySelector('.guestbook-section'));
            }
        });
    }

    // --- Checkout Process ---
    if (checkoutBtn) {
        checkoutBtn.addEventListener('click', function() {
            if (cart.length > 0) {
                // Populate order details
                checkoutItemList.innerHTML = '';
                let orderTotal = 0;
                cart.forEach(item => {
                    const li = document.createElement('li');
                    li.innerHTML = `
                        <span class="item-name">${item.name} (x${item.quantity})</span>
                        <span class="item-price">¥${(item.price * item.quantity).toFixed(2)}</span>
                    `;
                    checkoutItemList.appendChild(li);
                    orderTotal += item.price * item.quantity;
                });
                checkoutOrderTotal.textContent = orderTotal.toFixed(2);
                
                // Reset agreement and payment button
                agreeToTermsCheckbox.checked = false;
                confirmPaymentBtn.disabled = true;
                
                checkoutModal.classList.add('show');
                document.body.classList.add('modal-open');
            }
        });
    }

    if (closeCheckoutModalBtn) {
        closeCheckoutModalBtn.addEventListener('click', () => {
            checkoutModal.classList.remove('show');
            document.body.classList.remove('modal-open');
        });
    }
    
    function checkCanConfirmPayment() {
        confirmPaymentBtn.disabled = !agreeToTermsCheckbox.checked;
    }

    if (agreeToTermsCheckbox) {
        agreeToTermsCheckbox.addEventListener('change', checkCanConfirmPayment);
    }
    
    if (confirmPaymentBtn) {
        confirmPaymentBtn.addEventListener('click', function() {
            const selectedPaymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
            paymentQRTitle.textContent = selectedPaymentMethod === 'alipay' ? '支付宝扫码支付' : '微信扫码支付';
            
            // 根据支付方式显示不同的二维码
            if (selectedPaymentMethod === 'alipay') {
                paymentQRCodeImg.src = 'https://i.ibb.co/QmVn1hZ/alipay-qr.png';
            } else {
                paymentQRCodeImg.src = 'https://i.ibb.co/jrjbmLN/wechat-pay-qr.png';
            }
            
            checkoutModal.classList.remove('show'); // Hide checkout modal first
            paymentQRModal.classList.add('show');
        });
    }

    if (closePaymentQRModalBtn) {
        closePaymentQRModalBtn.addEventListener('click', () => {
            paymentQRModal.classList.remove('show');
            document.body.classList.remove('modal-open');
        });
    }
    if (cancelPaymentBtn) {
        cancelPaymentBtn.addEventListener('click', () => {
            paymentQRModal.classList.remove('show');
            // Re-show checkout modal or just close everything
            checkoutModal.classList.add('show'); // Go back to order confirmation
        });
    }

    if (paymentSuccessfulBtn) {
        paymentSuccessfulBtn.addEventListener('click', function() {
            paymentQRModal.classList.remove('show');
            document.body.classList.remove('modal-open');
            
            // 显示支付成功提示
            const successMessage = document.createElement('div');
            successMessage.className = 'payment-success-message';
            successMessage.innerHTML = `
                <div style="position:fixed; top:0; left:0; right:0; bottom:0; background:rgba(0,0,0,0.7); z-index:9999; display:flex; align-items:center; justify-content:center;">
                    <div style="background:white; padding:30px; border-radius:10px; text-align:center; max-width:80%; box-shadow:0 5px 15px rgba(0,0,0,0.3);">
                        <i class="fas fa-check-circle" style="color:#28a745; font-size:48px; margin-bottom:15px;"></i>
                        <h3 style="margin-bottom:15px; color:#333;">支付成功！</h3>
                        <p style="margin-bottom:10px;">感谢您的惠顾。您购买的服务将会被安排。</p>
                        <p style="margin-bottom:20px;">购买的虚拟物品已在祭台生效。</p>
                        <button id="closeSuccessMsg" style="background:#007bff; color:white; border:none; padding:10px 20px; border-radius:5px; cursor:pointer;">确定</button>
                    </div>
                </div>
            `;
            document.body.appendChild(successMessage);
            
            document.getElementById('closeSuccessMsg').addEventListener('click', function() {
                successMessage.remove();
            });
            
            // Simulate applying purchased items/services
            cart.forEach(item => {
                if (item.type === 'item') { // If it's a placeable item
                    // Find a spot and place it
                    const availableSpot = Array.from(offeringSpots).find(spot => spot.dataset.occupied !== "true");
                    if (availableSpot) {
                        availableSpot.innerHTML = `<img src="${item.img}" alt="${item.name}" style="max-height: 70px;">`;
                        availableSpot.dataset.occupied = "true";
                        
                        // 添加放置动画
                        const img = availableSpot.querySelector('img');
                        img.style.opacity = '0';
                        img.style.transform = 'scale(0.5)';
                        img.style.transition = 'all 0.5s ease';
                        setTimeout(() => {
                            img.style.opacity = '1';
                            img.style.transform = 'scale(1)';
                        }, 10);
                    }
                } else if (item.type === 'service') {
                    console.log(`服务 "${item.name}" 已成功购买并记录。`);
                    // In a real app, this would trigger backend processing
                }
            });

            cart = []; // Clear cart
            updateCartDisplay();
        });
    }

    // Close modals with ESC key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            if (checkoutModal.classList.contains('show')) {
                checkoutModal.classList.remove('show');
                document.body.classList.remove('modal-open');
            }
            if (paymentQRModal.classList.contains('show')) {
                paymentQRModal.classList.remove('show');
                document.body.classList.remove('modal-open');
            }
            
            // 关闭可能存在的支付成功消息
            const successMsg = document.querySelector('.payment-success-message');
            if (successMsg) successMsg.remove();
        }
    });

    // --- Initialize ---
    initializePage();
});