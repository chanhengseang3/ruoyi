package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.io.Serial;

/**
 * 商品对象 sys_goods
 *
 * @author ruoyi
 * @date 2022-07-25
 */
public class SysGoods extends BaseEntity {
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
     * 白名单商品图片
     */
    @Excel(name = "白名单商品图片")
    private String whiteImg;

    /**
     * 黑名单商品图片
     */
    @Excel(name = "黑名单商品图片")
    private String blackImg;

    /**
     * 是否删除（0否1是）
     */
    private String delFlag;

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setWhiteImg(String whiteImg) {
        this.whiteImg = whiteImg;
    }

    public String getWhiteImg() {
        return whiteImg;
    }

    public void setBlackImg(String blackImg) {
        this.blackImg = blackImg;
    }

    public String getBlackImg() {
        return blackImg;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getDelFlag() {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("goodsId", getGoodsId())
                .append("goodsName", getGoodsName())
                .append("whiteImg", getWhiteImg())
                .append("blackImg", getBlackImg())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("delFlag", getDelFlag())
                .toString();
    }
}
