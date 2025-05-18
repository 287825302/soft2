import request from '@/utils/request'

// 查询表单管理列表
export function listBiaodan(query) {
  return request({
    url: '/ditu/biaodan/list',
    method: 'get',
    params: query
  })
}

// 查询表单管理详细
export function getBiaodan(id) {
  return request({
    url: '/ditu/biaodan/' + id,
    method: 'get'
  })
}

// 新增表单管理
export function addBiaodan(data) {
  return request({
    url: '/ditu/biaodan',
    method: 'post',
    data: data
  })
}

// 修改表单管理
export function updateBiaodan(data) {
  return request({
    url: '/ditu/biaodan',
    method: 'put',
    data: data
  })
}

// 删除表单管理
export function delBiaodan(id) {
  return request({
    url: '/ditu/biaodan/' + id,
    method: 'delete'
  })
}
