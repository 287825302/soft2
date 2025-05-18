package com.sxs.ditu.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sxs.ditu.mapper.YbZuobiaoMapper;
import com.sxs.ditu.domain.YbZuobiao;
import com.sxs.ditu.service.IYbZuobiaoService;

/**
 * 坐标数据Service业务层处理
 * 
 * @author sxs
 * @date 2025-03-23
 */
@Service
public class YbZuobiaoServiceImpl implements IYbZuobiaoService 
{
    @Autowired
    private YbZuobiaoMapper ybZuobiaoMapper;

    /**
     * 查询坐标数据
     * 
     * @param id 坐标数据主键
     * @return 坐标数据
     */
    @Override
    public YbZuobiao selectYbZuobiaoById(Long id)
    {
        return ybZuobiaoMapper.selectYbZuobiaoById(id);
    }

    /**
     * 查询坐标数据列表
     * 
     * @param ybZuobiao 坐标数据
     * @return 坐标数据
     */
    @Override
    public List<YbZuobiao> selectYbZuobiaoList(YbZuobiao ybZuobiao)
    {
        return ybZuobiaoMapper.selectYbZuobiaoList(ybZuobiao);
    }

    /**
     * 新增坐标数据
     * 
     * @param ybZuobiao 坐标数据
     * @return 结果
     */
    @Override
    public int insertYbZuobiao(YbZuobiao ybZuobiao)
    {
        return ybZuobiaoMapper.insertYbZuobiao(ybZuobiao);
    }

    /**
     * 修改坐标数据
     * 
     * @param ybZuobiao 坐标数据
     * @return 结果
     */
    @Override
    public int updateYbZuobiao(YbZuobiao ybZuobiao)
    {
        return ybZuobiaoMapper.updateYbZuobiao(ybZuobiao);
    }

    /**
     * 批量删除坐标数据
     * 
     * @param ids 需要删除的坐标数据主键
     * @return 结果
     */
    @Override
    public int deleteYbZuobiaoByIds(Long[] ids)
    {
        return ybZuobiaoMapper.deleteYbZuobiaoByIds(ids);
    }

    /**
     * 删除坐标数据信息
     * 
     * @param id 坐标数据主键
     * @return 结果
     */
    @Override
    public int deleteYbZuobiaoById(Long id)
    {
        return ybZuobiaoMapper.deleteYbZuobiaoById(id);
    }
}
