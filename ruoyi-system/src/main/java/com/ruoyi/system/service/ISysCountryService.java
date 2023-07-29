package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysCountry;

/**
 * 国家Service接口
 * 
 * @author ruoyi
 * @date 2022-07-25
 */
public interface ISysCountryService 
{
    /**
     * 查询国家
     * 
     * @param countryId 国家主键
     * @return 国家
     */
    public SysCountry selectSysCountryByCountryId(Long countryId);

    /**
     * 查询国家列表
     * 
     * @param sysCountry 国家
     * @return 国家集合
     */
    public List<SysCountry> selectSysCountryList(SysCountry sysCountry);

    /**
     * 新增国家
     * 
     * @param sysCountry 国家
     * @return 结果
     */
    public int insertSysCountry(SysCountry sysCountry);

    /**
     * 修改国家
     * 
     * @param sysCountry 国家
     * @return 结果
     */
    public int updateSysCountry(SysCountry sysCountry);

    /**
     * 修改国家的黑白名单
     *
     * @param countryIds 需要删除的国家主键集合
     * @return 结果
     */
    public int updateSysCountryByCountryIds(String countryIds);

    /**
     * 批量删除国家
     * 
     * @param countryIds 需要删除的国家主键集合
     * @return 结果
     */
    public int deleteSysCountryByCountryIds(String countryIds);

    /**
     * 删除国家信息
     * 
     * @param countryId 国家主键
     * @return 结果
     */
    public int deleteSysCountryByCountryId(Long countryId);
}
