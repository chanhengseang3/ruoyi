package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysWhiteIpMapper;
import com.ruoyi.system.domain.SysWhiteIp;
import com.ruoyi.system.service.ISysWhiteIpService;
import com.ruoyi.common.core.text.Convert;

/**
 * ip白名单Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-07-25
 */
@Service
public class SysWhiteIpServiceImpl implements ISysWhiteIpService 
{
    @Autowired
    private SysWhiteIpMapper sysWhiteIpMapper;

    /**
     * 查询ip白名单
     * 
     * @param whiteIpId ip白名单主键
     * @return ip白名单
     */
    @Override
    public SysWhiteIp selectSysWhiteIpByWhiteIpId(Long whiteIpId)
    {
        return sysWhiteIpMapper.selectSysWhiteIpByWhiteIpId(whiteIpId);
    }

    /**
     * 查询ip白名单列表
     * 
     * @param sysWhiteIp ip白名单
     * @return ip白名单
     */
    @Override
    public List<SysWhiteIp> selectSysWhiteIpList(SysWhiteIp sysWhiteIp)
    {
        return sysWhiteIpMapper.selectSysWhiteIpList(sysWhiteIp);
    }

    /**
     * 新增ip白名单
     * 
     * @param sysWhiteIp ip白名单
     * @return 结果
     */
    @Override
    public int insertSysWhiteIp(SysWhiteIp sysWhiteIp)
    {
        return sysWhiteIpMapper.insertSysWhiteIp(sysWhiteIp);
    }

    /**
     * 修改ip白名单
     * 
     * @param sysWhiteIp ip白名单
     * @return 结果
     */
    @Override
    public int updateSysWhiteIp(SysWhiteIp sysWhiteIp)
    {
        return sysWhiteIpMapper.updateSysWhiteIp(sysWhiteIp);
    }

    /**
     * 批量删除ip白名单
     * 
     * @param whiteIpIds 需要删除的ip白名单主键
     * @return 结果
     */
    @Override
    public int deleteSysWhiteIpByWhiteIpIds(String whiteIpIds)
    {
        return sysWhiteIpMapper.deleteSysWhiteIpByWhiteIpIds(Convert.toStrArray(whiteIpIds));
    }

    /**
     * 删除ip白名单信息
     * 
     * @param whiteIpId ip白名单主键
     * @return 结果
     */
    @Override
    public int deleteSysWhiteIpByWhiteIpId(Long whiteIpId)
    {
        return sysWhiteIpMapper.deleteSysWhiteIpByWhiteIpId(whiteIpId);
    }
}
