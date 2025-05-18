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
import com.sxs.ditu.domain.YbZuobiao;
import com.sxs.ditu.service.IYbZuobiaoService;
import com.sxs.common.utils.poi.ExcelUtil;
import com.sxs.common.core.page.TableDataInfo;

/**
 * 坐标数据Controller
 * 
 * @author sxs
 * @date 2025-03-23
 */
@RestController
@RequestMapping("/ditu/zuobiao")
public class YbZuobiaoController extends BaseController
{
    @Autowired
    private IYbZuobiaoService ybZuobiaoService;

    /**
     * 查询坐标数据列表
     */
    @GetMapping("/list")
    public TableDataInfo list(YbZuobiao ybZuobiao)
    {
        startPage();
        List<YbZuobiao> list = ybZuobiaoService.selectYbZuobiaoList(ybZuobiao);
        return getDataTable(list);
    }

    /**
     * 导出坐标数据列表
     */
    @Log(title = "坐标数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, YbZuobiao ybZuobiao)
    {
        List<YbZuobiao> list = ybZuobiaoService.selectYbZuobiaoList(ybZuobiao);
        ExcelUtil<YbZuobiao> util = new ExcelUtil<YbZuobiao>(YbZuobiao.class);
        util.exportExcel(response, list, "坐标数据数据");
    }

    /**
     * 获取坐标数据详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(ybZuobiaoService.selectYbZuobiaoById(id));
    }

    /**
     * 新增坐标数据
     */
    @Log(title = "坐标数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody YbZuobiao ybZuobiao)
    {
        return toAjax(ybZuobiaoService.insertYbZuobiao(ybZuobiao));
    }

    /**
     * 修改坐标数据
     */
    @Log(title = "坐标数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody YbZuobiao ybZuobiao)
    {
        return toAjax(ybZuobiaoService.updateYbZuobiao(ybZuobiao));
    }

    /**
     * 删除坐标数据
     */
    @Log(title = "坐标数据", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(ybZuobiaoService.deleteYbZuobiaoByIds(ids));
    }
}
