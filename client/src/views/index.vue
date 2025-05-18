<template>
  <div>
    <div class="imagback">
      <div class="containerx">
        <h1 class="title">欢迎来到公墓信息管理系统</h1>
        <p class="description">我们致力于为您提供高质量的服务</p>
      </div>
    </div>
  </div>
</template>

<style>
.containerx {
  text-align: center;
  padding: 40px;
  background-color: rgba(240, 248, 255, 0.443); /* 半透明背景，文字可见 */
  border-radius: 8px;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
  position: relative; /* 为了确保子元素可以正确显示 */
   /*z-index: 1; 使得文字层在图片之上 */
}

.imagback {
  width: 100%;
  height: 100vh; /* 使背景图的高度填充整个视口 */
  /* background-image: url('https://hbimg.b0.upaiyun.com/901bc660543247cab8849de055e74b0c5a21edbe26ede-wezOCF_fw658'); */
  background-color: rgba(255, 255, 255, 0);
  background-size: cover; /* 背景图片完全覆盖容器 */
  background-position: center; /* 背景居中 */
  background-repeat: no-repeat; /* 防止图片重复 */
  position: relative; /* 确保背景图占满整个页面 */
  top: 0;
  left: 0;
  z-index: 0; /* 使背景图位于文字下方 */
}

.title {
  font-size: 24px;
  color: #333;
  margin-bottom: 16px;
}

.description {
  font-size: 16px;
  color: #666;
}
</style>
