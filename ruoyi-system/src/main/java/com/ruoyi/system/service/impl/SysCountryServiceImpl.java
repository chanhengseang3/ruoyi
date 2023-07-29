package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysCountryMapper;
import com.ruoyi.system.domain.SysCountry;
import com.ruoyi.system.service.ISysCountryService;
import com.ruoyi.common.core.text.Convert;

/**
 * 国家Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-07-25
 */
@Service
public class SysCountryServiceImpl implements ISysCountryService 
{
    @Autowired
    private SysCountryMapper sysCountryMapper;

    /**
     * 查询国家
     * 
     * @param countryId 国家主键
     * @return 国家
     */
    @Override
    public SysCountry selectSysCountryByCountryId(Long countryId)
    {
        return sysCountryMapper.selectSysCountryByCountryId(countryId);
    }

    /**
     * 查询国家列表
     * 
     * @param sysCountry 国家
     * @return 国家
     */
    @Override
    public List<SysCountry> selectSysCountryList(SysCountry sysCountry)
    {
        return sysCountryMapper.selectSysCountryList(sysCountry);
    }

    /**
     * 新增国家
     * 
     * @param sysCountry 国家
     * @return 结果
     */
    @Override
    public int insertSysCountry(SysCountry sysCountry)
    {
        return sysCountryMapper.insertSysCountry(sysCountry);
    }

    /**
     * 修改国家
     * 
     * @param sysCountry 国家
     * @return 结果
     */
    @Override
    public int updateSysCountry(SysCountry sysCountry)
    {
        return sysCountryMapper.updateSysCountry(sysCountry);
    }

    /**
     * 修改国家的黑白名单
     *
     * @param countryIds 需要删除的国家主键
     * @return 结果
     */
    @Override
    public int updateSysCountryByCountryIds(String countryIds)
    {
        sysCountryMapper.updateCountry();
        return sysCountryMapper.updateSysCountryByCountryIds(Convert.toLongArray(countryIds));
    }

    /**
     * 批量删除国家
     * 
     * @param countryIds 需要删除的国家主键
     * @return 结果
     */
    @Override
    public int deleteSysCountryByCountryIds(String countryIds)
    {
        return sysCountryMapper.deleteSysCountryByCountryIds(Convert.toStrArray(countryIds));
    }

    /**
     * 删除国家信息
     * 
     * @param countryId 国家主键
     * @return 结果
     */
    @Override
    public int deleteSysCountryByCountryId(Long countryId)
    {
        return sysCountryMapper.deleteSysCountryByCountryId(countryId);
    }
}
