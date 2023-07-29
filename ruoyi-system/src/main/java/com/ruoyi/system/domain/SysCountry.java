package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 国家对象 sys_country
 * 
 * @author ruoyi
 * @date 2022-07-25
 */
public class SysCountry extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long countryId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String countryName;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String countryLetter;

    /** 名单类型（0-白名单 1-黑名单） */
    @Excel(name = "名单类型", readConverterExp = "0=-白名单,1=-黑名单")
    private Integer countryType;

    public void setCountryId(Long countryId) 
    {
        this.countryId = countryId;
    }

    public Long getCountryId() 
    {
        return countryId;
    }
    public void setCountryName(String countryName) 
    {
        this.countryName = countryName;
    }

    public String getCountryName() 
    {
        return countryName;
    }
    public void setCountryLetter(String countryLetter) 
    {
        this.countryLetter = countryLetter;
    }

    public String getCountryLetter() 
    {
        return countryLetter;
    }
    public void setCountryType(Integer countryType) 
    {
        this.countryType = countryType;
    }

    public Integer getCountryType() 
    {
        return countryType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("countryId", getCountryId())
            .append("countryName", getCountryName())
            .append("countryLetter", getCountryLetter())
            .append("countryType", getCountryType())
            .toString();
    }
}
