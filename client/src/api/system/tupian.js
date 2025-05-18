import request from '@/utils/request'

// 查询背景图片列表
export function listTupian(query) {
  return request({
    url: '/system/tupian/list',
    method: 'get',
    params: query
  })
}

// 查询背景图片详细
export function getTupian(id) {
  return request({
    url: '/system/tupian/' + id,
    method: 'get'
  })
}

// 新增背景图片
export function addTupian(data) {
  return request({
    url: '/system/tupian',
    method: 'post',
    data: data
  })
}

// 修改背景图片
export function updateTupian(data) {
  return request({
    url: '/system/tupian',
    method: 'put',
    data: data
  })
}

// 删除背景图片
export function delTupian(id) {
  return request({
    url: '/system/tupian/' + id,
    method: 'delete'
  })
}
