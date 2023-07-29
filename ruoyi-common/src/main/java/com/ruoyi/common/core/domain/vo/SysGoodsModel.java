package com.ruoyi.common.core.domain.vo;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 商品对象 sys_goods
 * 
 * @author ruoyi
 * @date 2022-07-25
 */
public class SysGoodsModel
{
    private static final long serialVersionUID = 1L;

    /** 商品ID */
    private Long goodsId;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String goodsName;

    /** 白名单商品图片 */
    @Excel(name = "白名单商品图片")
    private List<MultipartFile> whiteImg;

    /** 黑名单商品图片 */
    @Excel(name = "黑名单商品图片")
    private List<MultipartFile> blackImg;
    /** 白名单商品图片 */
    @Excel(name = "白名单商品图片")
    private List<String> whiteImgEdit;

    /** 黑名单商品图片 */
    @Excel(name = "黑名单商品图片")
    private List<String> blackImgEdit;

    public List<String> getWhiteImgEdit() {
        return whiteImgEdit;
    }

    public void setWhiteImgEdit(List<String> whiteImgEdit) {
        this.whiteImgEdit = whiteImgEdit;
    }

    public List<String> getBlackImgEdit() {
        return blackImgEdit;
    }

    public void setBlackImgEdit(List<String> blackImgEdit) {
        this.blackImgEdit = blackImgEdit;
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

    public List<MultipartFile> getWhiteImg() {
        return whiteImg;
    }

    public void setWhiteImg(List<MultipartFile> whiteImg) {
        this.whiteImg = whiteImg;
    }

    public List<MultipartFile> getBlackImg() {
        return blackImg;
    }

    public void setBlackImg(List<MultipartFile> blackImg) {
        this.blackImg = blackImg;
    }
}
