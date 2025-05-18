package com.sxs.ditu.mapper;

import java.util.List;
import com.sxs.ditu.domain.YbBiaodan;

/**
 * 表单管理Mapper接口
 * 
 * @author sxs
 * @date 2025-03-23
 */
public interface YbBiaodanMapper 
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
     * 删除表单管理
     * 
     * @param id 表单管理主键
     * @return 结果
     */
    public int deleteYbBiaodanById(Long id);

    /**
     * 批量删除表单管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteYbBiaodanByIds(Long[] ids);
}
