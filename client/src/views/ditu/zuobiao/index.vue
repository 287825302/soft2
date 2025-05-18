<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="140px">
      <el-form-item label="坐标数据" prop="zuobiao">
        <el-input v-model="queryParams.zuobiao" placeholder="请输入坐标数据" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="地点" prop="leibie">
        <el-input v-model="queryParams.leibie" placeholder="请输入地点" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="信息" prop="zrenshu">
        <el-input v-model="queryParams.zrenshu" placeholder="请输入信息" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <!-- <el-form-item label="负责人" prop="fuzeren">
        <el-input v-model="queryParams.fuzeren" placeholder="请输入负责人" clearable @keyup.enter="handleQuery" />
      </el-form-item> -->
      <!-- <el-form-item label="汇泉广场站支援人数" prop="hzhiyuan">
        <el-input v-model="queryParams.hzhiyuan" placeholder="请输入汇泉广场站支援人数" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="中山公园站支援人数" prop="zzhiyuan">
        <el-input v-model="queryParams.zzhiyuan" placeholder="请输入中山公园站支援人数" clearable @keyup.enter="handleQuery" />
      </el-form-item> -->
      <!-- <el-form-item label="显示状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择显示状态" clearable>
          <el-option v-for="dict in xianshistatus" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item> -->
      <el-form-item label="创建时间" style="width: 308px">
        <el-date-picker v-model="daterangeCreatedtime" type="daterange" value-format="YYYY-MM-DD" range-separator="To"
          start-placeholder="开始日期" end-placeholder="结束日期"></el-date-picker>
      </el-form-item>
      <!-- <el-form-item label="添加人id" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入添加人id"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="添加者" prop="nickName">
        <el-input
          v-model="queryParams.nickName"
          placeholder="请输入添加者"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item> -->
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport">导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="arr" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="坐标数据" align="center" prop="zuobiao" />
      <el-table-column label="地点" align="center" prop="leibie" />
      <!-- <el-table-column label="负责人" align="center" prop="fuzeren" /> -->
      <el-table-column label="信息" align="center" prop="zrenshu" width="300">
        <template #default="scope">
          <div v-html="scope.row.zrenshu">
          </div>
        </template>
      </el-table-column>
      <!-- <el-table-column label="人员信息" align="center" prop="hzhiyuan" width="250">
        <template #default="scope">
          <div v-if="scope.row.hzhiyuan" class="person-list">
            <div v-for="(person, index) in JSON.parse(scope.row.hzhiyuan)" :key="index">
              {{ person.name }}: {{ person.数据 }}
            </div>
          </div>
        </template>
      </el-table-column> -->
      <!-- <el-table-column label="显示状态" align="center" prop="status">
        <template #default="scope">
          <dict-tag :options="xianshistatus" :value="scope.row.status" />
        </template>
      </el-table-column> -->
      <el-table-column label="创建时间" align="center" prop="createdtime" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createdtime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="添加者" align="center" prop="nickName" /> -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize" @pagination="getList" />

    <!-- 添加或修改坐标数据对话框 -->
    <el-dialog :title="title" v-model="open" width="50%" append-to-body>
      <el-form ref="zuobiaoRef" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="坐标数据" prop="zuobiao">
          <el-input v-model="form.zuobiao" placeholder="请输入坐标数据" />
        </el-form-item>
        <el-form-item label="地点" prop="leibie">
          <el-input v-model="form.leibie" placeholder="请输入地点" />
        </el-form-item>
        <!-- <el-form-item label="负责人" prop="fuzeren">
          <el-input v-model="form.fuzeren" placeholder="请输入负责人" />
        </el-form-item> -->
        <!-- <el-form-item label="信息" prop="zrenshu">
          <el-input v-model="form.zrenshu" placeholder="请输入信息" />
        </el-form-item> -->
        <el-form-item label="信息">
          <editor v-model="form.zrenshu" :defaultConfig="editorConfig" style="height: 500px; overflow-y: hidden"
            @onCreated="onCreated" />
        </el-form-item>
        <!-- <el-form-item label="人员信息" prop="hzhiyuan">
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
        </el-form-item> -->
        <el-form-item label="图标">
          <el-radio-group v-model="form.kz1">
            <el-radio value="1">蓝色地图标</el-radio>
            <el-radio value="2">红色地图标</el-radio>
          </el-radio-group>
        </el-form-item>
        <!-- <el-form-item label="显示状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio v-for="dict in xianshistatus" :key="dict.value" :label="dict.value">{{ dict.label }}</el-radio>
          </el-radio-group>
        </el-form-item> -->

      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Zuobiao">
import { listZuobiao, getZuobiao, delZuobiao, addZuobiao, updateZuobiao } from "@/api/ditu/zuobiao";
import { getUserProfile } from "@/api/system/user";

const { proxy } = getCurrentInstance();
const { xianshistatus } = proxy.useDict('xianshistatus');

const zuobiaoList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");
const daterangeCreatedtime = ref([]);

const data = reactive({
  form: {
    hzhiyuan: [], // 人员信息数据
  },
  queryParams: {
    pageNum: 1,
    pageSize: 9999,
    zuobiao: null,
    leibie: null,
    zrenshu: null,
    fuzeren: null,
    hzhiyuan: null,
    zzhiyuan: null,
    status: null,
    createdtime: null,
    userId: null,
    nickName: null,
  },
  rules: {
    // 校验规则
  }
});

const { queryParams, form, rules } = toRefs(data);
const arr = ref([])
/** 查询坐标数据列表 */
function getList() {
  loading.value = true;
  queryParams.value.params = {};
  if (null != daterangeCreatedtime && '' != daterangeCreatedtime) {
    queryParams.value.params["beginCreatedtime"] = daterangeCreatedtime.value[0];
    queryParams.value.params["endCreatedtime"] = daterangeCreatedtime.value[1];
  }
  getUserProfile().then(response => {
    let userId = response.data.userId;
    let nickName = response.data.nickName;
    listZuobiao(queryParams.value).then(response => {
      zuobiaoList.value = response.rows;
      console.log(zuobiaoList.value);
      arr.value = zuobiaoList.value.filter(item =>
        String(item.kz1) != '3'
      );

      console.log(arr.value);
      total.value = arr.value.length;
      loading.value = false;
    });
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    zuobiao: null,
    leibie: null,
    zrenshu: null,
    fuzeren: null,
    hzhiyuan: [], // 重置人员信息数据
    zzhiyuan: null,
    status: null,
    createdtime: null,
    userId: null,
    nickName: null,
    kz1: null,
    kz2: null,
    kz3: null
  };
  proxy.resetForm("zuobiaoRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  daterangeCreatedtime.value = [];
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}

/** 新增按钮操作 */
function handleAdd() {
  reset();
  open.value = true;
  form.value.kz1 = '1'
  title.value = "添加坐标数据";
}

/** 修改按钮操作 */
function handleUpdate(row) {
  reset();
  const _id = row.id || ids.value;
  getZuobiao(_id).then(response => {
    form.value = response.data;
    // 解析 hzhiyuan 字符串为数组
    if (form.value.hzhiyuan) {
      form.value.hzhiyuan = JSON.parse(form.value.hzhiyuan);
    } else {
      form.value.hzhiyuan = [];
    }
    open.value = true;
    title.value = "修改坐标数据";
  });
}

/** 新增人员信息 */
function addPerson() {
  form.value.hzhiyuan.push({ name: '', 数据: '' });
}

/** 删除人员信息 */
function removePerson(index) {
  form.value.hzhiyuan.splice(index, 1);
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["zuobiaoRef"].validate(valid => {
    if (valid) {
      // 将 hzhiyuan 转换为 JSON 字符串
      form.value.hzhiyuan = JSON.stringify(form.value.hzhiyuan);
      if (form.value.id != null) {
        updateZuobiao(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        getUserProfile().then(response => {
          let userId = response.data.userId;
          let nickName = response.data.nickName;
          form.value.userId = userId;
          form.value.nickName = nickName;
          addZuobiao(form.value).then(response => {
            proxy.$modal.msgSuccess("新增成功");
            open.value = false;
            getList();
          });
        });
      }
    }
  });
}

/** 删除按钮操作 */
function handleDelete(row) {
  const _ids = row.id || ids.value;
  proxy.$modal.confirm('是否确认删除坐标数据编号为"' + _ids + '"的数据项？').then(function () {
    return delZuobiao(_ids);
  }).then(() => {
    getList();
    proxy.$modal.msgSuccess("删除成功");
  }).catch(() => { });
}

/** 导出按钮操作 */
function handleExport() {
  proxy.download('ditu/zuobiao/export', {
    ...queryParams.value
  }, `zuobiao_${new Date().getTime()}.xlsx`);
}

getList();
</script>
<style scoped>
.person-list {
  max-height: 100px;
  /* 设置最大高度 */
  overflow-y: auto;
  /* 超出高度时显示垂直滚动条 */
  padding: 5px;
  /* 可选：添加内边距 */
  border: 1px solid #ebeef5;
  /* 可选：添加边框 */
  border-radius: 4px;
  /* 可选：添加圆角 */
}
</style>