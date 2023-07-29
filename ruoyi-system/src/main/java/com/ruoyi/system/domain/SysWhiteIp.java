package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * ip白名单对象 sys_white_ip
 * 
 * @author ruoyi
 * @date 2022-07-25
 */
public class SysWhiteIp extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long whiteIpId;

    /** 白名单ip地址 */
    @Excel(name = "白名单ip地址")
    private String whiteIpAdd;

    public void setWhiteIpId(Long whiteIpId) 
    {
        this.whiteIpId = whiteIpId;
    }

    public Long getWhiteIpId() 
    {
        return whiteIpId;
    }
    public void setWhiteIpAdd(String whiteIpAdd) 
    {
        this.whiteIpAdd = whiteIpAdd;
    }

    public String getWhiteIpAdd() 
    {
        return whiteIpAdd;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("whiteIpId", getWhiteIpId())
            .append("whiteIpAdd", getWhiteIpAdd())
            .toString();
    }
}
