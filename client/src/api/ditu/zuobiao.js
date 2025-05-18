import request from '@/utils/request'

// 查询坐标数据列表
export function listZuobiao(query) {
  return request({
    url: '/ditu/zuobiao/list',
    method: 'get',
    params: query
  })
}

// 查询坐标数据详细
export function getZuobiao(id) {
  return request({
    url: '/ditu/zuobiao/' + id,
    method: 'get'
  })
}

// 新增坐标数据
export function addZuobiao(data) {
  return request({
    url: '/ditu/zuobiao',
    method: 'post',
    data: data
  })
}

// 修改坐标数据
export function updateZuobiao(data) {
  return request({
    url: '/ditu/zuobiao',
    method: 'put',
    data: data
  })
}

// 删除坐标数据
export function delZuobiao(id) {
  return request({
    url: '/ditu/zuobiao/' + id,
    method: 'delete'
  })
}
