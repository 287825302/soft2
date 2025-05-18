package com.sxs.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sxs.common.annotation.Log;
import com.sxs.common.core.controller.BaseController;
import com.sxs.common.core.domain.AjaxResult;
import com.sxs.common.enums.BusinessType;
import com.sxs.system.domain.YbTupian;
import com.sxs.system.service.IYbTupianService;
import com.sxs.common.utils.poi.ExcelUtil;
import com.sxs.common.core.page.TableDataInfo;

/**
 * 背景图片Controller
 * 
 * @author sxs
 * @date 2025-03-28
 */
@RestController
@RequestMapping("/system/tupian")
public class YbTupianController extends BaseController
{
    @Autowired
    private IYbTupianService ybTupianService;

    /**
     * 查询背景图片列表
     */
    @GetMapping("/list")
    public TableDataInfo list(YbTupian ybTupian)
    {
        startPage();
        List<YbTupian> list = ybTupianService.selectYbTupianList(ybTupian);
        return getDataTable(list);
    }

    /**
     * 导出背景图片列表
     */
    @Log(title = "背景图片", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, YbTupian ybTupian)
    {
        List<YbTupian> list = ybTupianService.selectYbTupianList(ybTupian);
        ExcelUtil<YbTupian> util = new ExcelUtil<YbTupian>(YbTupian.class);
        util.exportExcel(response, list, "背景图片数据");
    }

    /**
     * 获取背景图片详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(ybTupianService.selectYbTupianById(id));
    }

    /**
     * 新增背景图片
     */
    @Log(title = "背景图片", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody YbTupian ybTupian)
    {
        return toAjax(ybTupianService.insertYbTupian(ybTupian));
    }

    /**
     * 修改背景图片
     */
    @Log(title = "背景图片", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody YbTupian ybTupian)
    {
        return toAjax(ybTupianService.updateYbTupian(ybTupian));
    }

    /**
     * 删除背景图片
     */
    @Log(title = "背景图片", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(ybTupianService.deleteYbTupianByIds(ids));
    }
}
