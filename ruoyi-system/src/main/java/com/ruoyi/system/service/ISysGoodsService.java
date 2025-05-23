package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysGoods;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 商品Service接口
 *
 * @author ruoyi
 * @date 2022-07-25
 */
public interface ISysGoodsService {
    /**
     * 查询商品
     *
     * @param goodsId 商品主键
     * @return 商品
     */
    SysGoods selectSysGoodsByGoodsId(Long goodsId);

    /**
     * 查询商品列表
     *
     * @param sysGoods 商品
     * @return 商品集合
     */
    List<SysGoods> selectSysGoodsList(SysGoods sysGoods);

    /**
     * 新增商品
     *
     * @param sysGoods 商品
     * @return 结果
     */
    int insertSysGoods(SysGoods sysGoods);

    /**
     * 修改商品
     *
     * @param sysGoods 商品
     * @return 结果
     */
    int updateSysGoods(SysGoods sysGoods);

    /**
     * 批量删除商品
     *
     * @param goodsIds 需要删除的商品主键集合
     * @return 结果
     */
    int deleteSysGoodsByGoodsIds(String goodsIds);

    /**
     * 根据当前访问的ip查看黑/白名单商品
     *
     */
    void listByCurrentIp(Long goodsId, int index, HttpServletRequest request, HttpServletResponse response);

    boolean isWhiteIp(HttpServletRequest request);

    ResponseEntity<byte[]> listByCurrentIp(Long goodsId, int index, HttpServletRequest request);
}
