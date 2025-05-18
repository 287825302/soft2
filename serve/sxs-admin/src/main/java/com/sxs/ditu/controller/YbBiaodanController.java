package com.sxs.ditu.controller;

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
import com.sxs.ditu.domain.YbBiaodan;
import com.sxs.ditu.service.IYbBiaodanService;
import com.sxs.common.utils.poi.ExcelUtil;
import com.sxs.common.core.page.TableDataInfo;

/**
 * 表单管理Controller
 * 
 * @author sxs
 * @date 2025-03-23
 */
@RestController
@RequestMapping("/ditu/biaodan")
public class YbBiaodanController extends BaseController
{
    @Autowired
    private IYbBiaodanService ybBiaodanService;

    /**
     * 查询表单管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(YbBiaodan ybBiaodan)
    {
        startPage();
        List<YbBiaodan> list = ybBiaodanService.selectYbBiaodanList(ybBiaodan);
        return getDataTable(list);
    }

    /**
     * 导出表单管理列表
     */
    @Log(title = "表单管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, YbBiaodan ybBiaodan)
    {
        List<YbBiaodan> list = ybBiaodanService.selectYbBiaodanList(ybBiaodan);
        ExcelUtil<YbBiaodan> util = new ExcelUtil<YbBiaodan>(YbBiaodan.class);
        util.exportExcel(response, list, "表单管理数据");
    }

    /**
     * 获取表单管理详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(ybBiaodanService.selectYbBiaodanById(id));
    }

    /**
     * 新增表单管理
     */
    @Log(title = "表单管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody YbBiaodan ybBiaodan)
    {
        return toAjax(ybBiaodanService.insertYbBiaodan(ybBiaodan));
    }

    /**
     * 修改表单管理
     */
    @Log(title = "表单管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody YbBiaodan ybBiaodan)
    {
        return toAjax(ybBiaodanService.updateYbBiaodan(ybBiaodan));
    }

    /**
     * 删除表单管理
     */
    @Log(title = "表单管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(ybBiaodanService.deleteYbBiaodanByIds(ids));
    }
}
