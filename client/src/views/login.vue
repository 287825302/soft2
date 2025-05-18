<script setup>
import { getCodeImg } from "@/api/login";
import Cookies from "js-cookie";
import { encrypt, decrypt } from "@/utils/jsencrypt";
import useUserStore from '@/store/modules/user'

const userStore = useUserStore()
const route = useRoute();
const router = useRouter();
const { proxy } = getCurrentInstance();

const loginForm = ref({
  username: "",
  password: "",
  rememberMe: false,
  code: "",
  uuid: ""
});

const loginRules = {
  username: [{ required: true, trigger: "blur", message: "请输入您的账号" }],
  password: [{ required: true, trigger: "blur", message: "请输入您的密码" }],
  code: [{ required: true, trigger: "change", message: "请输入验证码" }]
};

const codeUrl = ref("");
const loading = ref(false);
// 验证码开关
const captchaEnabled = ref(true);
// 注册开关
const register = ref(true);
const redirect = ref(undefined);

watch(route, (newRoute) => {
  redirect.value = newRoute.query && newRoute.query.redirect;
}, { immediate: true });

function handleLogin() {
  proxy.$refs.loginRef.validate(valid => {
    if (valid) {
      loading.value = true;
      // 勾选了需要记住密码设置在 cookie 中设置记住用户名和密码
      if (loginForm.value.rememberMe) {
        Cookies.set("username", loginForm.value.username, { expires: 30 });
        Cookies.set("password", encrypt(loginForm.value.password), { expires: 30 });
        Cookies.set("rememberMe", loginForm.value.rememberMe, { expires: 30 });
      } else {
        // 否则移除
        Cookies.remove("username");
        Cookies.remove("password");
        Cookies.remove("rememberMe");
      }
      // 调用action的登录方法
      userStore.login(loginForm.value).then(() => {
        const query = route.query;
        const otherQueryParams = Object.keys(query).reduce((acc, cur) => {
          if (cur !== "redirect") {
            acc[cur] = query[cur];
          }
          return acc;
        }, {});
        router.push({ path: redirect.value || "/", query: otherQueryParams });
      }).catch(() => {
        loading.value = false;
        // 重新获取验证码
        if (captchaEnabled.value) {
          getCode();
        }
      });
    }
  });
}

function getCode() {
  getCodeImg().then(res => {
    captchaEnabled.value = res.captchaEnabled === undefined ? true : res.captchaEnabled;
    if (captchaEnabled.value) {
      codeUrl.value = "data:image/gif;base64," + res.img;
      loginForm.value.uuid = res.uuid;
    }
  });
}

function getCookie() {
  const username = Cookies.get("username");
  const password = Cookies.get("password");
  const rememberMe = Cookies.get("rememberMe");
  loginForm.value = {
    username: username === undefined ? loginForm.value.username : username,
    password: password === undefined ? loginForm.value.password : decrypt(password),
    rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
  };
}

getCode();
getCookie();
</script>

<template>
  <div class="login">
    <div class="login-background"></div> <!-- 左边背景区域 -->
    <div class="login-form-wrapper">
      <el-form ref="loginRef" :model="loginForm" :rules="loginRules" class="login-form">
        <h3 class="title">公墓信息管理系统</h3>
        <el-form-item prop="username">
          <el-input v-model="loginForm.username" type="text" size="large" auto-complete="off" placeholder="账号">
            <template #prefix><svg-icon icon-class="user" class="el-input__icon input-icon" /></template>
          </el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input v-model="loginForm.password" type="password" size="large" auto-complete="off" placeholder="密码"
            @keyup.enter="handleLogin">
            <template #prefix><svg-icon icon-class="password" class="el-input__icon input-icon" /></template>
          </el-input>
        </el-form-item>
        <el-form-item prop="code" v-if="captchaEnabled">
          <el-input v-model="loginForm.code" size="large" auto-complete="off" placeholder="验证码" style="width: 63%"
            @keyup.enter="handleLogin">
            <template #prefix><svg-icon icon-class="validCode" class="el-input__icon input-icon" /></template>
          </el-input>
          <div class="login-code">
            <img :src="codeUrl" @click="getCode" class="login-code-img" />
          </div>
        </el-form-item>
        <el-checkbox v-model="loginForm.rememberMe" style="margin:0px 0px 25px 0px;">记住密码</el-checkbox>
        <el-form-item style="width:100%;">
          <el-button :loading="loading" size="large" type="primary" style="width:100%;" @click.prevent="handleLogin">
            <span v-if="!loading">登 录</span>
            <span v-else>登 录 中...</span>
          </el-button>
          <div style="float: right;" v-if="register">
            <router-link class="link-type" :to="'/register'">立即注册</router-link>
          </div>
        </el-form-item>
      </el-form>
    </div>
    <div class="el-login-footer">
      <span></span>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.login {
  display: flex;
  height: 100vh;
  position: relative;
  background-image: url("https://b0.bdstatic.com/ugc/zpSdC1IoBeQOVMsn0BMeUgcbcce0bdbdb4c710f5747844698be6c3.jpg");
  background-size: cover;
  background-position: center;
}

.login-background {
  width: 50%;
  height: 100%;
}

.login-form-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 65%;
  background-color: rgba(255, 255, 255, 0.203);
  /* 半透明背景 */
  padding: 20px;
  flex-direction: column;
  /* 保证内容上下居中 */
}

.title {
  margin: 0px auto 30px auto;
  text-align: center;
  color: #ffffff;
}

.login-form {
  border-radius: 12px;
  /* 圆角增加立体感 */
  border: 2px solid rgba(255, 255, 255, 0.3);
  /* 边框颜色稍微透明，能更好配合磨砂效果 */
  width: 400px;
  padding: 40px;
  /* 背景和磨砂效果 */
  background: rgba(255, 255, 255, 0.3);
  /* 半透明白色背景 */
  backdrop-filter: blur(10px);
  /* 添加磨砂玻璃效果 */
  -webkit-backdrop-filter: blur(10px);
  /* 为 Safari 添加兼容性 */
  /* 添加阴影来模拟立体感 */
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);

  /* 阴影增强立体感 */
  /* 处理输入框样式 */
  .el-input {
    height: 40px;

    input {
      height: 40px;
    }
  }

  .input-icon {
    height: 39px;
    width: 14px;
    margin-left: 0px;
  }

  /* 添加鼠标悬停时的动态效果 */
  transition: transform 0.3s ease,
  box-shadow 0.3s ease;
  /* 设置过渡效果 */
}

.login-form:hover {
  transform: translateY(-10px);
  /* 鼠标悬停时框体上移 */
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
  /* 增强阴影效果，模拟浮动效果 */
}

.login-code {
  width: 33%;
  height: 40px;
  float: right;

  img {
    cursor: pointer;
    vertical-align: middle;
  }
}

.el-login-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
}

.login-code-img {
  height: 40px;
  padding-left: 12px;
}

/* Mobile responsive */
@media (max-width: 768px) {
  .login {
    position: absolute;
    width: 100%;
    height: 100%;
    flex-direction: column;
    justify-content: center;
  }

  .login-background {
    width: 0%;
    height: 0%;
  }

  .login-form-wrapper {
    width: 100%;
    padding: 20px;
    // background-color: rgba(255, 255, 255, 0.4); /* Make the form a bit more visible */
    flex-direction: column;
    justify-content: center;
  }

  .login-form {
    width: 90%;
    /* Take up most of the screen */
    padding: 20px;
  }

  .title {
    font-size: 24px;
    /* Reduce font size on mobile */
    color: #333;
  }

  .login-code {
    width: 100%;
    height: auto;
    float: none;
    margin-top: 20px;
  }

  .el-login-footer {
    font-size: 10px;
    bottom: 10px;
  }
}
</style>
