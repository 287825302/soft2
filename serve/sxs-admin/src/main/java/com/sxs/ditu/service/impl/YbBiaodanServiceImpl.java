package com.sxs.ditu.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sxs.ditu.mapper.YbBiaodanMapper;
import com.sxs.ditu.domain.YbBiaodan;
import com.sxs.ditu.service.IYbBiaodanService;

/**
 * 表单管理Service业务层处理
 * 
 * @author sxs
 * @date 2025-03-23
 */
@Service
public class YbBiaodanServiceImpl implements IYbBiaodanService 
{
    @Autowired
    private YbBiaodanMapper ybBiaodanMapper;

    /**
     * 查询表单管理
     * 
     * @param id 表单管理主键
     * @return 表单管理
     */
    @Override
    public YbBiaodan selectYbBiaodanById(Long id)
    {
        return ybBiaodanMapper.selectYbBiaodanById(id);
    }

    /**
     * 查询表单管理列表
     * 
     * @param ybBiaodan 表单管理
     * @return 表单管理
     */
    @Override
    public List<YbBiaodan> selectYbBiaodanList(YbBiaodan ybBiaodan)
    {
        return ybBiaodanMapper.selectYbBiaodanList(ybBiaodan);
    }

    /**
     * 新增表单管理
     * 
     * @param ybBiaodan 表单管理
     * @return 结果
     */
    @Override
    public int insertYbBiaodan(YbBiaodan ybBiaodan)
    {
        return ybBiaodanMapper.insertYbBiaodan(ybBiaodan);
    }

    /**
     * 修改表单管理
     * 
     * @param ybBiaodan 表单管理
     * @return 结果
     */
    @Override
    public int updateYbBiaodan(YbBiaodan ybBiaodan)
    {
        return ybBiaodanMapper.updateYbBiaodan(ybBiaodan);
    }

    /**
     * 批量删除表单管理
     * 
     * @param ids 需要删除的表单管理主键
     * @return 结果
     */
    @Override
    public int deleteYbBiaodanByIds(Long[] ids)
    {
        return ybBiaodanMapper.deleteYbBiaodanByIds(ids);
    }

    /**
     * 删除表单管理信息
     * 
     * @param id 表单管理主键
     * @return 结果
     */
    @Override
    public int deleteYbBiaodanById(Long id)
    {
        return ybBiaodanMapper.deleteYbBiaodanById(id);
    }
}
