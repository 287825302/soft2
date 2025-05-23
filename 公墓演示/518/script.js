document.addEventListener('DOMContentLoaded', () => {
    const areas = document.querySelectorAll('.overlay-area');
    const selectedAreaElement = document.getElementById('selected-area');
    const randomNumbersElement = document.getElementById('random-numbers');

    // 模态框元素
    const villageModal = document.getElementById('village-modal');
    const villageButtons = document.querySelectorAll('.village-btn');
    const agreementModal = document.getElementById('agreement-modal');
    const errorModal = document.getElementById('error-modal');
    const agreeCheckbox = document.getElementById('agree-checkbox');
    const confirmButton = document.getElementById('confirm-button');
    const cancelButton = document.getElementById('cancel-button');
    const errorConfirmButton = document.getElementById('error-confirm-button');
    const errorMessage = document.getElementById('error-message');

    const toast = document.getElementById('toast');
    const toastMessage = toast.querySelector('.message');
    const toastCloseBtn = toast.querySelector('.close-btn');

    const thanksModal = document.getElementById('thanks-modal');
    const countdownElement = document.getElementById('countdown');
    let countdownInterval;

    let selectedArea = null;
    let selectedVillage = '';

    // 区域配置
    const areaConfig = {
        'A': { rows: 10, cols: 10, village: 'haipo', name: 'A区' },
        'A-1': { rows: 8, cols: 8, village: 'haipo', name: 'A-1区' },
        'A-2': { rows: 5, cols: 5, village: 'haipo', name: 'A-2区' },
        'B': { rows: 12, cols: 12, village: 'yanglan', name: 'B区' },
        'C': { rows: 8, cols: 10, village: 'maling', name: 'C区' },
        'C-1': { rows: 6, cols: 8, village: 'maling', name: 'C-1区' },
        'D': { rows: 5, cols: 10, village: 'miaolin', name: 'D区' },
        'E': { rows: 0, cols: 0, village: 'none', name: '未规划区' }
    };

    // 页面加载时显示村庄选择模态框
    showVillageModal();

    // 为村庄按钮添加点击事件
    villageButtons.forEach(button => {
        button.addEventListener('click', () => {
            selectedVillage = button.getAttribute('data-village');
            const villageName = button.textContent;
            selectedAreaElement.textContent = `已选择: ${villageName}`;
            hideVillageModal();
            highlightVillageAreas(selectedVillage);

            // 显示提示卡片
            showToast(`您当前选择的村庄是: ${villageName}`);
        });
    });

    // 高亮显示所选村庄的区域
    function highlightVillageAreas(village) {
        areas.forEach(area => {
            const areaVillage = area.getAttribute('data-village');
            // 移除所有区域的高亮类
            area.classList.remove('highlight');

            if (areaVillage === village) {
                // 添加高亮类到匹配的区域
                area.classList.add('highlight');
                area.style.opacity = '1';
            } else {
                area.style.opacity = '0.3';
            }
        });
    }

    // 显示村庄选择模态框
    function showVillageModal() {
        villageModal.style.display = 'flex';
    }

    // 隐藏村庄选择模态框
    function hideVillageModal() {
        villageModal.style.display = 'none';
    }

    // 为每个区域添加点击事件
    areas.forEach(area => {
        area.addEventListener('click', () => {
            if (!selectedVillage) {
                showVillageModal();
                return;
            }

            const areaVillage = area.getAttribute('data-village');
            const areaName = area.getAttribute('data-area');

            if (areaVillage === 'none') {
                showError('该区域暂未规划，请选择其他区域');
                return;
            }

            if (areaVillage !== selectedVillage) {
                showError(`该区域属于${getVillageName(areaVillage)}，如有需要请联系工作人员`);
                return;
            }

            selectedArea = areaName;
            showAgreementModal();
        });
    });

    // 显示协议模态框
    function showAgreementModal() {
        agreementModal.style.display = 'flex';
        agreeCheckbox.checked = false;
        confirmButton.disabled = true;
    }

    // 显示错误提示模态框
    function showError(message) {
        errorMessage.textContent = message;
        errorModal.style.display = 'flex';
    }

    // 隐藏协议模态框
    function hideAgreementModal() {
        agreementModal.style.display = 'none';
        selectedArea = null;
    }

    // 隐藏错误提示模态框
    function hideErrorModal() {
        errorModal.style.display = 'none';
    }

    // 获取村庄名称
    function getVillageName(villageCode) {
        const villageNames = {
            'haipo': '海坡村',
            'yanglan': '羊栏村',
            'maling': '马岭村',
            'miaolin': '妙林村',
            'none': '未规划区域'
        };
        return villageNames[villageCode] || '未知区域';
    }

    // 监听复选框变化
    agreeCheckbox.addEventListener('change', () => {
        confirmButton.disabled = !agreeCheckbox.checked;
    });

    // 确认按钮点击事件
    confirmButton.addEventListener('click', () => {
        if (selectedArea && agreeCheckbox.checked) {
            const areaInfo = areaConfig[selectedArea];
            selectedAreaElement.textContent = `已选择: ${getVillageName(selectedVillage)} - ${areaInfo.name}`;
            const numbers = generateRandomNumbers(selectedArea);
            displayRandomNumbers(numbers);
            hideAgreementModal();
        }
    });

    // 取消按钮点击事件
    cancelButton.addEventListener('click', hideAgreementModal);

    // 错误确认按钮点击事件
    errorConfirmButton.addEventListener('click', hideErrorModal);

    // 点击模态框外部关闭（仅限错误提示和协议模态框）
    agreementModal.addEventListener('click', (e) => {
        if (e.target === agreementModal) {
            hideAgreementModal();
        }
    });

    errorModal.addEventListener('click', (e) => {
        if (e.target === errorModal) {
            hideErrorModal();
        }
    });

    // 生成随机数函数
    function generateRandomNumbers(area) {
        const config = areaConfig[area];
        if (!config || config.rows === 0 || config.cols === 0) {
            return [];
        }

        const numbers = new Set();
        while (numbers.size < Math.min(10, config.rows * config.cols)) {
            const row = Math.floor(Math.random() * config.rows) + 1;
            const col = Math.floor(Math.random() * config.cols) + 1;
            numbers.add(`${row}-${col}`);
        }
        return Array.from(numbers);
    }

    // 显示随机数函数
    function displayRandomNumbers(numbers) {
        if (numbers.length === 0) {
            randomNumbersElement.innerHTML = '<div class="number-item">该区域暂无可选位置</div>';
            return;
        }

        randomNumbersElement.innerHTML = numbers
            .map((num, index) => `<div class="number-item" data-position="${num}">位置${index + 1}: ${num}</div>`)
            .join('');

        // 为每个位置项添加点击事件
        const numberItems = randomNumbersElement.querySelectorAll('.number-item');
        numberItems.forEach(item => {
            item.addEventListener('click', () => {
                // 移除其他项的选中状态
                numberItems.forEach(i => i.classList.remove('selected'));
                // 添加当前项的选中状态
                item.classList.add('selected');

                // 显示感谢弹窗
                setTimeout(() => {
                    showThanksModal();
                }, 500);
            });
        });
    }

    // 显示提示卡片函数
    function showToast(message, duration = 3000) {
        toastMessage.textContent = message;
        toast.classList.add('show');

        // 自动关闭
        setTimeout(() => {
            hideToast();
        }, duration);
    }

    // 隐藏提示卡片函数
    function hideToast() {
        toast.classList.remove('show');
    }

    // 关闭按钮点击事件
    toastCloseBtn.addEventListener('click', hideToast);

    // 显示感谢弹窗
    function showThanksModal() {
        thanksModal.style.display = 'flex';
        thanksModal.classList.add('prevent-click');
        startCountdown();
    }

    // 隐藏感谢弹窗
    function hideThanksModal() {
        thanksModal.style.display = 'none';
        thanksModal.classList.remove('prevent-click');
    }

    // 开始倒计时
    function startCountdown() {
        let timeLeft = 30;
        countdownElement.textContent = timeLeft;

        countdownInterval = setInterval(() => {
            timeLeft--;
            countdownElement.textContent = timeLeft;

            if (timeLeft <= 0) {
                clearInterval(countdownInterval);
                resetSystem();
            }
        }, 1000);
    }

    // 重置系统
    function resetSystem() {
        // 隐藏感谢弹窗
        hideThanksModal();

        // 清除选择结果
        selectedArea = null;
        selectedVillage = '';
        selectedAreaElement.textContent = '请先选择您所在的村庄';
        randomNumbersElement.innerHTML = '';

        // 重置区域显示
        areas.forEach(area => {
            area.classList.remove('highlight');
            area.style.opacity = '1';
        });

        // 显示村庄选择模态框
        showVillageModal();
    }
}); 