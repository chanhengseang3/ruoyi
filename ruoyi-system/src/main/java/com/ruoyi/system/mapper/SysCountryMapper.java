package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysCountry;

/**
 * 国家Mapper接口
 * 
 * @author ruoyi
 * @date 2022-07-25
 */
public interface SysCountryMapper 
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
     * @return 结果
     */
    public int updateCountry();
    /**
     * 修改国家
     * 
     * @param sysCountry 国家
     * @return 结果
     */
    public int updateSysCountry(SysCountry sysCountry);

    /**
     * 批量修改黑白名单
     *
     * @param countryIds 需要删除的数据主键集合
     * @return 结果
     */
    public int updateSysCountryByCountryIds(Long[] countryIds);

    /**
     * 删除国家
     * 
     * @param countryId 国家主键deleteSysCountryByCountryId
     * @return 结果
     */
    public int deleteSysCountryByCountryId(Long countryId);

    /**
     * 批量删除国家
     * 
     * @param countryIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysCountryByCountryIds(String[] countryIds);



    /**
     * 查询国家列表
     *
     * @return 国家集合
     */
    public List<SysCountry> selectSysCountryListByName(String countryName);
}
