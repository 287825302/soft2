package com.sxs.ditu.service;

import java.util.List;
import com.sxs.ditu.domain.YbBiaodan;

/**
 * 表单管理Service接口
 * 
 * @author sxs
 * @date 2025-03-23
 */
public interface IYbBiaodanService 
{
    /**
     * 查询表单管理
     * 
     * @param id 表单管理主键
     * @return 表单管理
     */
    public YbBiaodan selectYbBiaodanById(Long id);

    /**
     * 查询表单管理列表
     * 
     * @param ybBiaodan 表单管理
     * @return 表单管理集合
     */
    public List<YbBiaodan> selectYbBiaodanList(YbBiaodan ybBiaodan);

    /**
     * 新增表单管理
     * 
     * @param ybBiaodan 表单管理
     * @return 结果
     */
    public int insertYbBiaodan(YbBiaodan ybBiaodan);

    /**
     * 修改表单管理
     * 
     * @param ybBiaodan 表单管理
     * @return 结果
     */
    public int updateYbBiaodan(YbBiaodan ybBiaodan);

    /**
     * 批量删除表单管理
     * 
     * @param ids 需要删除的表单管理主键集合
     * @return 结果
     */
    public int deleteYbBiaodanByIds(Long[] ids);

    /**
     * 删除表单管理信息
     * 
     * @param id 表单管理主键
     * @return 结果
     */
    public int deleteYbBiaodanById(Long id);
}
