package com.ruoyi.web.controller.image;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysWhiteIp;
import com.ruoyi.system.service.ISysWhiteIpService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * ip白名单Controller
 * 
 * @author ruoyi
 * @date 2022-07-25
 */
@Controller
@RequestMapping("/system/ip")
public class SysWhiteIpController extends BaseController
{
    private final String prefix = "system/ip";

    @Autowired
    private ISysWhiteIpService sysWhiteIpService;

    @RequiresPermissions("system:ip:view")
    @GetMapping()
    public String ip()
    {
        return prefix + "/ip";
    }

    /**
     * 查询ip白名单列表
     */
    @RequiresPermissions("system:ip:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysWhiteIp sysWhiteIp)
    {
        startPage();
        List<SysWhiteIp> list = sysWhiteIpService.selectSysWhiteIpList(sysWhiteIp);
        return getDataTable(list);
    }

    /**
     * 导出ip白名单列表
     */
    @RequiresPermissions("system:ip:export")
    @Log(title = "ip白名单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysWhiteIp sysWhiteIp)
    {
        List<SysWhiteIp> list = sysWhiteIpService.selectSysWhiteIpList(sysWhiteIp);
        ExcelUtil<SysWhiteIp> util = new ExcelUtil<SysWhiteIp>(SysWhiteIp.class);
        return util.exportExcel(list, "ip白名单数据");
    }

    /**
     * 新增ip白名单
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存ip白名单
     */
    @RequiresPermissions("system:ip:add")
    @Log(title = "ip白名单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysWhiteIp sysWhiteIp)
    {
        return toAjax(sysWhiteIpService.insertSysWhiteIp(sysWhiteIp));
    }

    /**
     * 修改ip白名单
     */
    @RequiresPermissions("system:ip:edit")
    @GetMapping("/edit/{whiteIpId}")
    public String edit(@PathVariable("whiteIpId") Long whiteIpId, ModelMap mmap)
    {
        SysWhiteIp sysWhiteIp = sysWhiteIpService.selectSysWhiteIpByWhiteIpId(whiteIpId);
        mmap.put("sysWhiteIp", sysWhiteIp);
        return prefix + "/edit";
    }

    /**
     * 修改保存ip白名单
     */
    @RequiresPermissions("system:ip:edit")
    @Log(title = "ip白名单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysWhiteIp sysWhiteIp)
    {
        return toAjax(sysWhiteIpService.updateSysWhiteIp(sysWhiteIp));
    }

    /**
     * 删除ip白名单
     */
    @RequiresPermissions("system:ip:remove")
    @Log(title = "ip白名单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(sysWhiteIpService.deleteSysWhiteIpByWhiteIpIds(ids));
    }
}
