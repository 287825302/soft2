package com.sxs.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sxs.system.mapper.YbTupianMapper;
import com.sxs.system.domain.YbTupian;
import com.sxs.system.service.IYbTupianService;

/**
 * 背景图片Service业务层处理
 * 
 * @author sxs
 * @date 2025-03-28
 */
@Service
public class YbTupianServiceImpl implements IYbTupianService 
{
    @Autowired
    private YbTupianMapper ybTupianMapper;

    /**
     * 查询背景图片
     * 
     * @param id 背景图片主键
     * @return 背景图片
     */
    @Override
    public YbTupian selectYbTupianById(Long id)
    {
        return ybTupianMapper.selectYbTupianById(id);
    }

    /**
     * 查询背景图片列表
     * 
     * @param ybTupian 背景图片
     * @return 背景图片
     */
    @Override
    public List<YbTupian> selectYbTupianList(YbTupian ybTupian)
    {
        return ybTupianMapper.selectYbTupianList(ybTupian);
    }

    /**
     * 新增背景图片
     * 
     * @param ybTupian 背景图片
     * @return 结果
     */
    @Override
    public int insertYbTupian(YbTupian ybTupian)
    {
        return ybTupianMapper.insertYbTupian(ybTupian);
    }

    /**
     * 修改背景图片
     * 
     * @param ybTupian 背景图片
     * @return 结果
     */
    @Override
    public int updateYbTupian(YbTupian ybTupian)
    {
        return ybTupianMapper.updateYbTupian(ybTupian);
    }

    /**
     * 批量删除背景图片
     * 
     * @param ids 需要删除的背景图片主键
     * @return 结果
     */
    @Override
    public int deleteYbTupianByIds(Long[] ids)
    {
        return ybTupianMapper.deleteYbTupianByIds(ids);
    }

    /**
     * 删除背景图片信息
     * 
     * @param id 背景图片主键
     * @return 结果
     */
    @Override
    public int deleteYbTupianById(Long id)
    {
        return ybTupianMapper.deleteYbTupianById(id);
    }
}
