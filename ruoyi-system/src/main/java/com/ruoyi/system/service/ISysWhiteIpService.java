package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysWhiteIp;

/**
 * ip白名单Service接口
 * 
 * @author ruoyi
 * @date 2022-07-25
 */
public interface ISysWhiteIpService 
{
    /**
     * 查询ip白名单
     * 
     * @param whiteIpId ip白名单主键
     * @return ip白名单
     */
    public SysWhiteIp selectSysWhiteIpByWhiteIpId(Long whiteIpId);

    /**
     * 查询ip白名单列表
     * 
     * @param sysWhiteIp ip白名单
     * @return ip白名单集合
     */
    public List<SysWhiteIp> selectSysWhiteIpList(SysWhiteIp sysWhiteIp);

    /**
     * 新增ip白名单
     * 
     * @param sysWhiteIp ip白名单
     * @return 结果
     */
    public int insertSysWhiteIp(SysWhiteIp sysWhiteIp);

    /**
     * 修改ip白名单
     * 
     * @param sysWhiteIp ip白名单
     * @return 结果
     */
    public int updateSysWhiteIp(SysWhiteIp sysWhiteIp);

    /**
     * 批量删除ip白名单
     * 
     * @param whiteIpIds 需要删除的ip白名单主键集合
     * @return 结果
     */
    public int deleteSysWhiteIpByWhiteIpIds(String whiteIpIds);

    /**
     * 删除ip白名单信息
     * 
     * @param whiteIpId ip白名单主键
     * @return 结果
     */
    public int deleteSysWhiteIpByWhiteIpId(Long whiteIpId);
}
