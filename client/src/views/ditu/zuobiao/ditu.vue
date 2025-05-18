<template>
  <div class="full-screen-div" :style="{ backgroundImage: `url('${bgImageUrl}')` }">
    <!-- 显示点击坐标 -->
    <p v-if="clickPosition" class="coordinates">
      点击坐标：X: {{ clickPosition.x }}, Y: {{ clickPosition.y }}
    </p>

    <!-- 默认显示的表单 -->
    <div v-if="newform" :style="{

      position: 'absolute',
      left: `${JSON.parse(newform.zuobiao)[0] - 100}px`,
      top: `${JSON.parse(newform.zuobiao)[1] - 150}px`,
      background: 'linear-gradient(145deg, #ffffff, #f0f0f0)', // 渐变背景
      padding: '15px 25px', // 增加内边距
      borderRadius: '12px', // 圆角
      boxShadow: '8px 8px 16px rgba(0, 0, 0, 0.2), -4px -4px 12px rgba(255, 255, 255, 0.5)', // 立体阴影
      cursor: 'pointer',
      width: '260px', // 稍微增加宽度
      textAlign: 'left',
      border: '1px solid rgba(0, 0, 0, 0.1)', // 更柔和的边框
      transform: 'translateZ(0)', // 启用硬件加速
      transition: 'transform 0.3s ease, box-shadow 0.3s ease', // 添加过渡效果
    }" @click.stop="() => { }" @mouseenter="hoverForm(true)" @mouseleave="hoverForm(false)">
      <p v-if="newform.leibie" style="font-weight: bold; margin-bottom: 10px;">{{ newform.leibie }}</p>
      <p v-if="newform.fuzeren">{{ newform.fuzeren }}</p>
      <p v-if="newform.zrenshu">{{ newform.zrenshu }}</p>
      <p v-if="newform.hzhiyuan">{{ newform.hzhiyuan }}</p>
      <p v-if="newform.zzhiyuan">{{ newform.zzhiyuan }}</p>
    </div>


    <!-- 弹窗表单 -->
    <el-dialog v-model="dialogVisible" :title="isEditMode ? '编辑坐标表单' : '新增坐标表单'" width="50%" @close="resetForm">
      <el-form :model="form" label-width="150px" @click.stop>
        <div v-if="form.kz1 != '3'">
          <el-form-item label="地址">
            <el-input v-model="form.leibie" @click.stop />
          </el-form-item>
          <!-- <el-form-item label="负责人">
            <el-input v-model="form.fuzeren" @click.stop />
          </el-form-item> -->
          <el-form-item label="人员信息数量">
            <editor v-model="form.zrenshu" :defaultConfig="editorConfig" style="height: 500px; overflow-y: hidden"
              @onCreated="onCreated" />
          </el-form-item>
          <el-form-item label="人员信息">
            <el-button type="primary" @click="addPerson">新增人员信息</el-button>
            <el-table :data="form.hzhiyuan" border style="width: 100%; margin-top: 10px;">
              <el-table-column label="姓名" prop="name">
                <template #default="scope">
                  <el-input v-model="scope.row.name" placeholder="请输入姓名" />
                </template>
              </el-table-column>
              <el-table-column label="数据" prop="数据">
                <template #default="scope">
                  <el-input v-model="scope.row.数据" placeholder="请输入数据" />
                </template>
              </el-table-column>
              <el-table-column label="操作">
                <template #default="scope">
                  <el-button type="danger" @click="removePerson(scope.$index)">删除</el-button>
                </template>
              </el-table-column>
            </el-table>
          </el-form-item>
        </div>
        <div v-else>
          <el-form-item label="摄像头名称">
            <el-input v-model="form.kz2" @click.stop />
          </el-form-item>
        </div>
        <el-form-item>

          <div class="mb-2 ml-4">
            <el-radio-group v-model="form.kz1">
              <el-radio value="1">蓝色地图标</el-radio>
              <el-radio value="2">红色地图标</el-radio>
              <el-radio value="3">监控图标</el-radio>
            </el-radio-group>
          </div>



        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false" @click.stop>取消</el-button>
        <el-button type="danger" @click="confirmDelete(form)" @click.stop>删除</el-button>
        <el-button type="primary" @click="submitForm" @click.stop>
          {{ isEditMode ? '保存' : '确认' }}
        </el-button>
      </template>
    </el-dialog>

    <!-- 显示所有坐标表单 -->
    <div v-for="item in zuobiaoList" :key="item.id" :style="{
      position: 'absolute',
      left: `${JSON.parse(item.zuobiao)[0] - 100}px`, // 表单居中
      top: `${JSON.parse(item.zuobiao)[1] - (formHeights[item.id] + 30 || 150)}px`, // 动态计算表单高度
      background: 'linear-gradient(145deg, #ffffff, #f0f0f0)', // 渐变背景
      padding: '15px 25px', // 增加内边距
      borderRadius: '12px', // 圆角
      boxShadow: '8px 8px 16px rgba(0, 0, 0, 0.2), -4px -4px 12px rgba(255, 255, 255, 0.5)', // 立体阴影
      cursor: 'pointer',
      width: '280px', // 稍微增加宽度
      maxHeight: '270px',
      overflowY: 'auto',  // 垂直滚动
      zIndex: '999',
      textAlign: 'left',
      border: '1px solid rgba(0, 0, 0, 0.1)', // 更柔和的边框
      transform: 'translateZ(0)', // 启用硬件加速
      transition: 'transform 0.3s ease, box-shadow 0.3s ease', // 添加过渡效果
      display: item.isCollapsed ? 'none' : 'block', // 根据折叠状态显示或隐藏
    }" class="form-container" :ref="el => setFormHeight(el, item.id)">
      <el-button type="text" icon="el-icon-close" style="position: absolute; top: 5px; right: 5px;"
        @click.stop="toggleForm(item)"></el-button>
      <div v-if="item.kz1 != '3'">
        <p style="text-align: center; font-weight: bold; margin-bottom: 10px;">{{ item.leibie }}</p>
        <!-- <p>负责人：{{ item.fuzeren }}</p> -->
        <p v-html="item.zrenshu"></p>
        <!-- <p>人员信息：</p> -->
      </div>
      <div v-else>
        <p>摄像头：{{ item.kz2 }}</p>
      </div>
      <ul style="padding-left: 0;">
        <template v-for="(person, index) in parseHzhiyuan(item.hzhiyuan)" :key="index">
          <li v-if="person.数据!=null&&person.数据!=''" style="margin: 5px 20px 5px 20px;">
            {{ person.name }}：{{ person.数据 }}
          </li>
          <p v-else style="font-weight: 700;">
            {{ person.name }}：
          </p>
        </template>
      </ul>
    </div>
    <div v-for="item in zuobiaoList" :key="item.id" :style="{
      position: 'absolute',
      left: `${JSON.parse(item.zuobiao)[0] - 20}px`, // 图标居中
      top: `${JSON.parse(item.zuobiao)[1] - 20}px`, // 图标就是坐标点
      cursor: 'pointer',
    }" @click.stop="toggleForm(item)">
      <el-icon v-if="item.kz1 == '1'" :size="40" color="#2873ff" class="map-icon">
        <LocationFilled /> <!-- 使用实心定位图标 -->
      </el-icon>
      <el-icon v-if="item.kz1 == '2'" :size="40" color="red" class="map-icon">
        <LocationFilled />
      </el-icon>
      <div class="camera-container" v-if="item.kz1 == '3'">
        <el-icon :size="40" color="red" class="map-icon">
          <el-icon color="#409EFF" :size="32">
            <VideoCameraFilled />
          </el-icon>
        </el-icon>
        <span style="font-weight: 900;" class="camera-label">{{ item.kz2 }}</span>
      </div>
    </div>
    <!-- 删除确认弹窗 -->
    <el-dialog v-model="deleteDialogVisible" title="确认删除" width="30%">
      <p>确定要删除该表单吗？</p>
      <template #footer>
        <el-button @click="deleteDialogVisible = false">取消</el-button>
        <el-button type="danger" @click="deleteForm">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { LocationFilled, VideoCameraFilled } from '@element-plus/icons-vue'; // 导入实心定位图标
import { listZuobiao, addZuobiao, updateZuobiao, delZuobiao } from "@/api/ditu/zuobiao";
import { listBiaodan, getBiaodan, delBiaodan, addBiaodan, updateBiaodan } from "@/api/ditu/biaodan";
import { listTupian, getTupian, delTupian, addTupian, updateTupian } from "@/api/system/tupian";
const bgImageUrl = ref(''); // 存储后端返回的图片 URL
let pollingInterval = null;
// 存储点击坐标
const clickPosition = ref(null);

// 弹窗是否可见
const dialogVisible = ref(false);

// 是否为编辑模式
const isEditMode = ref(false);

// 当前编辑的表单 ID
const currentFormId = ref(null);

// 表单数据
const form = ref({
  zuobiao: '[0,0]', // 默认坐标
  leibie: '', // 类别
  zrenshu: '', // 总人数
  fuzeren: '', // 负责人
  hzhiyuan: [], // 人员信息
  status: '显示', // 状态
  userId: 0, // 用户 ID
  nickName: '', // 用户昵称
  kz1: '1',
  kz2: null,
  kz3: null,
});

// 默认显示的表单数据
const newform = ref(null);

// 坐标表单列表
const zuobiaoList = ref([]);

// 删除确认弹窗是否可见
const deleteDialogVisible = ref(false);

// 当前要删除的表单
const currentDeleteItem = ref(null);

// 存储每个表单的高度
const formHeights = ref({});

// 动态设置表单高度
const setFormHeight = (el, id) => {
  if (el) {
    formHeights.value[id] = el.offsetHeight; // 获取表单的实际高度
  }
};

// 解析 hzhiyuan 字符串为 JSON 数组
const parseHzhiyuan = (hzhiyuan) => {
  try {
    return JSON.parse(hzhiyuan);
  } catch (error) {
    console.error("解析 hzhiyuan 失败", error);
    return [];
  }
};

// 处理点击事件
const handleClick = (event) => {
  // 如果弹窗已经打开，则不执行逻辑
  if (dialogVisible.value) return;

  // 获取点击位置的坐标
  clickPosition.value = {
    x: event.clientX,
    y: event.clientY,
  };

  // 更新表单中的坐标
  form.value.zuobiao = JSON.stringify([event.clientX, event.clientY]);

  // 显示弹窗
  dialogVisible.value = true;
  isEditMode.value = false; // 设置为新增模式
};

// 处理表单点击事件
const handleFormClick = (item) => {
  // 填充表单数据
  form.value = { ...item };
  // 解析 hzhiyuan 字符串为数组
  if (form.value.hzhiyuan) {
    form.value.hzhiyuan = parseHzhiyuan(form.value.hzhiyuan);
  } else {
    form.value.hzhiyuan = [];
  }
  currentFormId.value = item.id;
  isEditMode.value = true; // 设置为编辑模式
  dialogVisible.value = true; // 显示弹窗
};

// 新增人员信息
const addPerson = () => {
  form.value.hzhiyuan.push({ name: '', 数据: '' });
};

// 删除人员信息
const removePerson = (index) => {
  form.value.hzhiyuan.splice(index, 1);
};

// 提交表单
const submitForm = async () => {
  try {
    // 将 hzhiyuan 转换为 JSON 字符串
    form.value.hzhiyuan = JSON.stringify(form.value.hzhiyuan);
    if (isEditMode.value) {
      // 编辑模式：调用更新接口
      await updateZuobiao({ ...form.value, id: currentFormId.value });
    } else {
      // 新增模式：调用新增接口
      await addZuobiao(form.value);
    }
    dialogVisible.value = false; // 关闭弹窗
    loadZuobiaoList(); // 重新加载坐标表单列表
  } catch (error) {
    console.error("提交失败", error);
  }
};

// 确认删除
const confirmDelete = (item) => {
  currentDeleteItem.value = item;
  deleteDialogVisible.value = true;
};

// 删除表单
const deleteForm = async () => {
  try {
    await delZuobiao(currentDeleteItem.value.id); // 调用删除接口
    deleteDialogVisible.value = false; // 关闭确认弹窗
    dialogVisible.value = false;
    loadZuobiaoList(); // 重新加载坐标表单列表
  } catch (error) {
    console.error("删除失败", error);
  }
};

// 重置表单
const resetForm = () => {
  form.value = {
    zuobiao: '[0,0]',
    leibie: '',
    zrenshu: '',
    fuzeren: '',
    hzhiyuan: [],
    status: '显示',
    userId: 0,
    nickName: '',
    kz1: null,
    kz2: null,
    kz3: null,
  };
  currentFormId.value = null;
  isEditMode.value = false;
};
// 获取数据
const fetchData = async () => {
  const response = await listZuobiao({ pageNum: 1, pageSize: 9999 });
  return response.rows.map(item => ({
    ...item,
    isCollapsed: true, // 默认不折叠
  }));
};
// 定义一个函数，提取需要对比的字段
const getComparisonData = (data) => {
  return data.map(item => ({
    id: item.id,
    zuobiao: item.zuobiao,
    leibie: item.leibie,
    zrenshu: item.zrenshu,
    fuzeren: item.fuzeren,
    hzhiyuan: item.hzhiyuan,
    zzhiyuan: item.zzhiyuan,
    status: item.status,
    createdtime: item.createdtime,
    userId: item.userId,
    nickName: item.nickName,
    kz1: item.kz1,
    kz2: item.kz2,
    kz3: item.kz3,
    // 不包含 isCollapsed
    // 只保留需要对比的字段，排除 isCollapsed
  }));
};
// 初始化 + 启动轮询
const initAndPoll = async () => {
  zuobiaoList.value = await fetchData(); // 首次加载

  // 每 10 秒轮询一次（时间可调整）
  pollingInterval = setInterval(async () => {
    const newData = await fetchData();

    // 对比新旧数据（简单用 JSON.stringify，也可用 lodash.isEqual）
    if (
      JSON.stringify(getComparisonData(newData)) !==
      JSON.stringify(getComparisonData(zuobiaoList.value))
    ) {
      console.log('数据已更新！');
      // 更新数据
      zuobiaoList.value = newData;
      // 执行你的回调
      //  loadZuobiaoList()
    }
  }, 1000); // 10 秒
};

// 页面卸载时清除轮询
onUnmounted(() => {
  if (pollingInterval) clearInterval(pollingInterval);
});
// 加载坐标表单列表
const loadZuobiaoList = async () => {
  const response = await listZuobiao({ pageNum: 1, pageSize: 9999 });
  zuobiaoList.value = response.rows.map(item => ({
    ...item,
    isCollapsed: true, // 默认不折叠
  }));
};

// 加载默认表单数据
const loadNewform = async () => {
  const response = await listBiaodan({ pageNum: 1, pageSize: 9999 });
  newform.value = response.rows[0];
};

// 切换表单的折叠状态
const toggleForm = (item) => {
  item.isCollapsed = !item.isCollapsed;
};

// 初始化
onMounted(() => {
  listTupian({ pageNum: 1, pageSize: 999 }).then(response => {
    bgImageUrl.value = import.meta.env.VITE_APP_BASE_API + response.rows[0].src

  });
  loadZuobiaoList(); // 加载坐标表单列表
  loadNewform(); // 加载默认表单数据

});
initAndPoll();
</script>

<style lang="css" scoped>
.full-screen-div {
  width: 100vw;
  height: 100vh;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  background-image: url('../../../assets/images/tu.png');
  cursor: pointer;
  position: relative;
}

.coordinates {
  position: fixed;
  top: 20px;
  left: 20px;
  background-color: rgba(0, 0, 0, 0.363);
  color: white;
  padding: 10px;
  border-radius: 5px;
  font-size: 16px;
}

/* 表单容器样式 */
.form-container {
  position: relative;
}

/* 表单小尾巴样式 */
.form-container::after {
  content: '';
  position: absolute;
  bottom: -10px;
  /* 调整位置 */
  left: 50%;
  transform: translateX(-50%);
  width: 0;
  height: 0;
  border-left: 10px solid transparent;
  border-right: 10px solid transparent;
  border-top: 10px solid rgba(255, 255, 255, 1);
  /* 与表单背景色一致 */
}

.map-icon {
  transition: transform 0.3s ease;
  /* 添加平滑过渡效果 */
}

.map-icon:hover {
  transform: scale(1.2);
  /* 鼠标悬停时放大 1.2 倍 */
}

/* 表单容器样式 */
.form-container {
  position: relative;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

/* 表单悬停效果 */
.form-container:hover {
  transform: scale(1.05);
  box-shadow: '12px 12px 24px rgba(0, 0, 0, 0.3), -6px -6px 16px rgba(255, 255, 255, 0.6)';
}

/* 地图图标样式 */
.map-icon {
  transition: transform 0.3s ease, filter 0.3s ease;
  filter: drop-shadow(4px 4px 8px rgba(0, 0, 0, 0.3));
  /* 立体阴影 */
  animation: breathe 2s infinite ease-in-out;
  /* 呼吸动画 */
}

/* 地图图标悬停效果 */
.map-icon:hover {
  transform: scale(1.2);
  filter: drop-shadow(6px 6px 12px rgba(0, 0, 0, 0.4));
  /* 更强的阴影 */
}

/* 呼吸动画 */
@keyframes breathe {
  0% {
    transform: scale(1);
  }

  50% {
    transform: scale(1.1);
  }

  100% {
    transform: scale(1);
  }
}

/* 外层容器（相对定位，不影响原有样式） */
.camera-container {
  position: relative;
  display: inline-block;
  /* 保持原有行内特性 */
}

/* 文字（绝对定位，严格居中在图标正下方） */
.camera-label {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  /* 水平居中 */
  top: 100%;
  /* 放在图标底部 */
  margin-top: 2px;
  /* 微调间距 */
  font-size: 12px;
  color: #333;
  white-space: nowrap;
  /* 防止文字换行 */
}

/* 隐藏默认滚动条（Chrome/Edge/Safari） */
div::-webkit-scrollbar {
  width: 1px;
  height: 0;
  background: transparent;
}


div::-webkit-scrollbar-thumb {
  background: rgba(0, 0, 0, 0.2);
  border-radius: 3px;
}
</style>