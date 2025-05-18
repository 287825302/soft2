package com.sxs.ditu.mapper;

import java.util.List;
import com.sxs.ditu.domain.YbZuobiao;

/**
 * 坐标数据Mapper接口
 * 
 * @author sxs
 * @date 2025-03-23
 */
public interface YbZuobiaoMapper 
{
    /**
     * 查询坐标数据
     * 
     * @param id 坐标数据主键
     * @return 坐标数据
     */
    public YbZuobiao selectYbZuobiaoById(Long id);

    /**
     * 查询坐标数据列表
     * 
     * @param ybZuobiao 坐标数据
     * @return 坐标数据集合
     */
    public List<YbZuobiao> selectYbZuobiaoList(YbZuobiao ybZuobiao);

    /**
     * 新增坐标数据
     * 
     * @param ybZuobiao 坐标数据
     * @return 结果
     */
    public int insertYbZuobiao(YbZuobiao ybZuobiao);

    /**
     * 修改坐标数据
     * 
     * @param ybZuobiao 坐标数据
     * @return 结果
     */
    public int updateYbZuobiao(YbZuobiao ybZuobiao);

    /**
     * 删除坐标数据
     * 
     * @param id 坐标数据主键
     * @return 结果
     */
    public int deleteYbZuobiaoById(Long id);

    /**
     * 批量删除坐标数据
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteYbZuobiaoByIds(Long[] ids);
}
