package com.ruoyi.web.controller.image;

import java.util.List;

import com.sun.jna.platform.unix.solaris.LibKstat;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysCountry;
import com.ruoyi.system.service.ISysCountryService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 国家Controller
 * 
 * @author ruoyi
 * @date 2022-07-25
 */
@Controller
@RequestMapping("/system/country")
public class SysCountryController extends BaseController
{
    private String prefix = "system/country";

    @Autowired
    private ISysCountryService sysCountryService;

    @RequiresPermissions("system:country:view")
    @GetMapping()
    public String country()
    {
        return prefix + "/country";
    }

    /**
     * 查询国家列表
     */
    @RequiresPermissions("system:country:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysCountry sysCountry)
    {
        List<SysCountry> list = sysCountryService.selectSysCountryList(sysCountry);
        return getDataTable(list);
    }

    /**
     * 导出国家列表
     */
    @RequiresPermissions("system:country:export")
    @Log(title = "国家", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysCountry sysCountry)
    {
        List<SysCountry> list = sysCountryService.selectSysCountryList(sysCountry);
        ExcelUtil<SysCountry> util = new ExcelUtil<SysCountry>(SysCountry.class);
        return util.exportExcel(list, "国家数据");
    }

    /**
     * 新增国家
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存国家
     */
    @RequiresPermissions("system:country:add")
    @Log(title = "国家", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysCountry sysCountry)
    {
        return toAjax(sysCountryService.insertSysCountry(sysCountry));
    }

    /**
     * 修改国家
     */
    @RequiresPermissions("system:country:edit")
    @GetMapping("/edit/{countryId}")
    public String edit(@PathVariable("countryId") Long countryId, ModelMap mmap)
    {
        SysCountry sysCountry = sysCountryService.selectSysCountryByCountryId(countryId);
        mmap.put("sysCountry", sysCountry);
        return prefix + "/edit";
    }

    /**
     * 修改保存国家
     */
    @RequiresPermissions("system:country:edit")
    @Log(title = "国家", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysCountry sysCountry)
    {
        return toAjax(sysCountryService.updateSysCountry(sysCountry));
    }


    /**
     * 修改国家的黑名单
     */
    @RequiresPermissions("system:country:edit")
    @Log(title = "国家", businessType = BusinessType.UPDATE)
    @PostMapping( "/editIp")
    @ResponseBody
    public AjaxResult editIp(String ids)
    {
        return toAjax(sysCountryService.updateSysCountryByCountryIds(ids));
}

    /**
     * 删除国家
     */
    @RequiresPermissions("system:country:remove")
    @Log(title = "国家", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(sysCountryService.deleteSysCountryByCountryIds(ids));
    }
}
