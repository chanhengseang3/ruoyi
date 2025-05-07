package com.ruoyi.common.core.domain.vo;

import com.ruoyi.common.annotation.Excel;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

/**
 * 商品对象 sys_goods
 *
 * @author ruoyi
 * @date 2022-07-25
 */
public class SysGoodsModel implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 商品ID
     */
    private Long goodsId;

    /**
     * 商品名称
     */
    @Excel(name = "商品名称")
    private String goodsName;

    /**
     * 白名单商品链接
     */
    @Excel(name = "白名单商品链接")
    private List<String> whiteUriLinks;

    /**
     * 黑名单商品链接
     */
    @Excel(name = "黑名单商品链接")
    private List<String> blackUriLinks;

    /**
     * 白名单商品链接(编辑用)
     */
    @Excel(name = "白名单商品链接")
    private List<String> whiteUriLinksEdit;

    /**
     * 黑名单商品链接(编辑用)
     */
    @Excel(name = "黑名单商品链接")
    private List<String> blackUriLinksEdit;

    public List<String> getWhiteUriLinksEdit() {
        return whiteUriLinksEdit;
    }

    public void setWhiteUriLinksEdit(List<String> whiteUriLinksEdit) {
        this.whiteUriLinksEdit = whiteUriLinksEdit;
    }

    public List<String> getBlackUriLinksEdit() {
        return blackUriLinksEdit;
    }

    public void setBlackUriLinksEdit(List<String> blackUriLinksEdit) {
        this.blackUriLinksEdit = blackUriLinksEdit;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public List<String> getWhiteUriLinks() {
        return whiteUriLinks;
    }

    public void setWhiteUriLinks(List<String> whiteUriLinks) {
        this.whiteUriLinks = whiteUriLinks;
    }

    public List<String> getBlackUriLinks() {
        return blackUriLinks;
    }

    public void setBlackUriLinks(List<String> blackUriLinks) {
        this.blackUriLinks = blackUriLinks;
    }
}
