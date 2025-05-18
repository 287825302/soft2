package com.sxs.system.mapper;

import java.util.List;
import com.sxs.system.domain.YbTupian;

/**
 * 背景图片Mapper接口
 * 
 * @author sxs
 * @date 2025-03-28
 */
public interface YbTupianMapper 
{
    /**
     * 查询背景图片
     * 
     * @param id 背景图片主键
     * @return 背景图片
     */
    public YbTupian selectYbTupianById(Long id);

    /**
     * 查询背景图片列表
     * 
     * @param ybTupian 背景图片
     * @return 背景图片集合
     */
    public List<YbTupian> selectYbTupianList(YbTupian ybTupian);

    /**
     * 新增背景图片
     * 
     * @param ybTupian 背景图片
     * @return 结果
     */
    public int insertYbTupian(YbTupian ybTupian);

    /**
     * 修改背景图片
     * 
     * @param ybTupian 背景图片
     * @return 结果
     */
    public int updateYbTupian(YbTupian ybTupian);

    /**
     * 删除背景图片
     * 
     * @param id 背景图片主键
     * @return 结果
     */
    public int deleteYbTupianById(Long id);

    /**
     * 批量删除背景图片
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteYbTupianByIds(Long[] ids);
}
