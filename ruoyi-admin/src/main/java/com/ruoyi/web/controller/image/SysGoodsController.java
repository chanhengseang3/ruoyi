package com.ruoyi.web.controller.image;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.vo.SysGoodsModel;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysGoods;
import com.ruoyi.system.service.ISysGoodsService;
import com.ruoyi.web.controller.common.CommonController;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品Controller
 *
 * @author ruoyi
 * @date 2022-07-25
 */
@Controller
@RequestMapping("/system/goods")
@Slf4j
@RequiredArgsConstructor
public class SysGoodsController extends BaseController {

    private static final String prefix = "system/goods";
    private static final String FILE_DELIMETER = ",";

    private final ISysGoodsService sysGoodsService;
    private final CommonController commonController;

    @RequiresPermissions("system:goods:view")
    @GetMapping()
    public String goods() {
        return prefix + "/goods";
    }

    /**
     * 查询商品列表
     */
    @RequiresPermissions("system:goods:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysGoods sysGoods) {
        startPage();
        List<SysGoods> list = sysGoodsService.selectSysGoodsList(sysGoods);
        return getDataTable(list);
    }

    /**
     * 导出商品列表
     */
    @RequiresPermissions("system:goods:export")
    @Log(title = "商品", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysGoods sysGoods) {
        List<SysGoods> list = sysGoodsService.selectSysGoodsList(sysGoods);
        ExcelUtil<SysGoods> util = new ExcelUtil<SysGoods>(SysGoods.class);
        return util.exportExcel(list, "商品数据");
    }

    /**
     * 查看商品
     */
    @RequiresPermissions("system:goods:details")
    @GetMapping("/details/{goodsId}")
    public String details(@PathVariable("goodsId") Long goodsId, ModelMap mmap) {
        SysGoods sysGoods = sysGoodsService.selectSysGoodsByGoodsId(goodsId);
        mmap.put("sysGoods", sysGoods);
        return prefix + "/details";
    }

    /**
     * 新增商品
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存商品
     */
    @RequiresPermissions("system:goods:add")
    @Log(title = "商品", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysGoodsModel model) {
        SysGoods sysGoods = new SysGoods();

        if (model.getWhiteUriLinks() == null || model.getWhiteUriLinks().isEmpty() || 
            model.getBlackUriLinks() == null || model.getBlackUriLinks().isEmpty()) {
            throw new ServiceException("请填写完整信息后再保存");
        }

        if (model.getWhiteUriLinks().size() != model.getBlackUriLinks().size()) {
            throw new ServiceException("黑白两个名单内的链接，需保证链接一一对应");
        }

        sysGoods.setGoodsName(model.getGoodsName());
        sysGoods.setWhiteImg(StringUtils.join(model.getWhiteUriLinks(), FILE_DELIMETER));
        sysGoods.setBlackImg(StringUtils.join(model.getBlackUriLinks(), FILE_DELIMETER));

        return toAjax(sysGoodsService.insertSysGoods(sysGoods));
    }

    /**
     * 修改商品
     */
    @RequiresPermissions("system:goods:edit")
    @GetMapping("/edit/{goodsId}")
    public String edit(@PathVariable("goodsId") Long goodsId, ModelMap mmap) {
        SysGoods sysGoods = sysGoodsService.selectSysGoodsByGoodsId(goodsId);
        mmap.put("sysGoods", sysGoods);
        return prefix + "/edit";
    }

    /**
     * 修改保存商品
     */
    @RequiresPermissions("system:goods:edit")
    @Log(title = "商品", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysGoodsModel model) {
        SysGoods sysGoods = new SysGoods();

        int whiteNum = (null == model.getWhiteUriLinks() ? 0 : model.getWhiteUriLinks().size()) + 
                      (null == model.getWhiteUriLinksEdit() ? 0 : model.getWhiteUriLinksEdit().size());
        int blackNum = (null == model.getBlackUriLinks() ? 0 : model.getBlackUriLinks().size()) + 
                      (null == model.getBlackUriLinksEdit() ? 0 : model.getBlackUriLinksEdit().size());

        if (whiteNum + blackNum == 0) {
            return error("请填写完整信息后再保存");
        }

        if (whiteNum != blackNum) {
            return error("黑白两个名单内的链接，需保证链接一一对应");
        }

        List<String> whiteArr = new ArrayList<>();
        List<String> blackArr = new ArrayList<>();

        if (model.getWhiteUriLinksEdit() != null && !model.getWhiteUriLinksEdit().isEmpty()) {
            whiteArr.addAll(model.getWhiteUriLinksEdit());
        }
        
        if (model.getBlackUriLinksEdit() != null && !model.getBlackUriLinksEdit().isEmpty()) {
            blackArr.addAll(model.getBlackUriLinksEdit());
        }

        if (model.getWhiteUriLinks() != null && !model.getWhiteUriLinks().isEmpty()) {
            whiteArr.addAll(model.getWhiteUriLinks());
        }
        
        if (model.getBlackUriLinks() != null && !model.getBlackUriLinks().isEmpty()) {
            blackArr.addAll(model.getBlackUriLinks());
        }

        sysGoods.setGoodsId(model.getGoodsId());
        sysGoods.setGoodsName(model.getGoodsName());
        sysGoods.setWhiteImg(StringUtils.join(whiteArr, FILE_DELIMETER));
        sysGoods.setBlackImg(StringUtils.join(blackArr, FILE_DELIMETER));
        return toAjax(sysGoodsService.updateSysGoods(sysGoods));
    }

    /**
     * 删除商品
     */
    @RequiresPermissions("system:goods:remove")
    @Log(title = "商品", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(sysGoodsService.deleteSysGoodsByGoodsIds(ids));
    }
}
