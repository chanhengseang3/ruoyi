package com.ruoyi.system.service.impl;

import com.ruoyi.common.config.IPConfig;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.SysCountry;
import com.ruoyi.system.domain.SysGoods;
import com.ruoyi.system.domain.SysWhiteIp;
import com.ruoyi.system.mapper.SysCountryMapper;
import com.ruoyi.system.mapper.SysGoodsMapper;
import com.ruoyi.system.mapper.SysWhiteIpMapper;
import com.ruoyi.system.service.ISysGoodsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.WritableByteChannel;
import java.util.Base64;
import java.util.List;

/**
 * 商品Service业务层处理
 *
 * @author ruoyi
 * @date 2022-07-25
 */
@Service
public class SysGoodsServiceImpl implements ISysGoodsService {

    private static final Logger log = LoggerFactory.getLogger(SysGoodsServiceImpl.class);
    private static final Base64.Decoder decoder = Base64.getDecoder();

    @Autowired
    private SysGoodsMapper sysGoodsMapper;
    @Autowired
    private SysWhiteIpMapper ipMapper;
    @Autowired
    private SysCountryMapper countryMapper;

    /**
     * 查询商品
     *
     * @param goodsId 商品主键
     * @return 商品
     */
    @Override
    public SysGoods selectSysGoodsByGoodsId(Long goodsId) {
        return sysGoodsMapper.selectSysGoodsByGoodsId(goodsId);
    }

    /**
     * 查询商品列表
     *
     * @param sysGoods 商品
     * @return 商品
     */
    @Override
    public List<SysGoods> selectSysGoodsList(SysGoods sysGoods) {
        return sysGoodsMapper.selectSysGoodsList(sysGoods);
    }

    /**
     * 新增商品
     *
     * @param sysGoods 商品
     * @return 结果
     */
    @Override
    public int insertSysGoods(SysGoods sysGoods) {
        sysGoods.setCreateTime(DateUtils.getNowDate());
        return sysGoodsMapper.insertSysGoods(sysGoods);
    }

    /**
     * 修改商品
     *
     * @param sysGoods 商品
     * @return 结果
     */
    @Override
    public int updateSysGoods(SysGoods sysGoods) {
        sysGoods.setUpdateTime(DateUtils.getNowDate());
        return sysGoodsMapper.updateSysGoods(sysGoods);
    }

    /**
     * 批量删除商品
     *
     * @param goodsIds 需要删除的商品主键
     * @return 结果
     */
    @Override
    public int deleteSysGoodsByGoodsIds(String goodsIds) {
        return sysGoodsMapper.deleteSysGoodsByGoodsIds(Convert.toStrArray(goodsIds));
    }

    /**
     * 删除商品信息
     *
     * @param goodsId 商品主键
     * @return 结果
     */
    @Override
    public int deleteSysGoodsByGoodsId(Long goodsId) {
        return sysGoodsMapper.deleteSysGoodsByGoodsId(goodsId);
    }

    /**
     * 根据当前访问的ip查看黑/白名单商品
     * 如果IP的国家在黑名单内，但IP白名单有这个IP，以IP名单优先
     * 白名单=ip地址白名单>黑名单
     *
     * @return 结果
     */
    @Override
    public void listByCurrentIp(Long goodsId, int index, HttpServletRequest request, HttpServletResponse response) {
        boolean isWhite = false;
        //获取当前访问的ip
        String ip = IPConfig.getIp(request);

        SysWhiteIp sysWhiteIp = new SysWhiteIp();
        sysWhiteIp.setWhiteIpAdd(ip);
        List<SysWhiteIp> ips = ipMapper.selectSysWhiteIpList(sysWhiteIp);
        if (ips.size() > 0) {
            isWhite = true;
        } else {
            String getCountry = IPConfig.getAddressByIp(ip);
            List<SysCountry> countries = countryMapper.selectSysCountryListByName(getCountry);
            if (countries.size() > 0 && countries.get(0).getCountryType() == 0) {
                isWhite = true;
            }
        }

        SysGoods sysGoods = selectSysGoodsByGoodsId(goodsId);
        if (null == sysGoods) {
            throw new ServiceException("商品不存在！！！");
        }

        var stopWatch = new StopWatch("Read image and write into output stream");
        stopWatch.start("Read from disk");
        try {
            response.setContentType("image/jpeg");
            OutputStream toClient = response.getOutputStream();
            String xmlImg = GetImageStr(RuoYiConfig.getProfile() + (isWhite ? sysGoods.getWhiteImg().split(",")[index] : sysGoods.getBlackImg().split(",")[index]));
            xmlImg = xmlImg.replace("data:image/gif;base64,", "");
            xmlImg = xmlImg.replace("data:image/jpg;base64,", "");
            stopWatch.stop();
            stopWatch.start("Write to socket");
            generateImage(xmlImg, toClient);
        } catch (Exception ex) {
            log.error("fail to read/write image", ex);
        }
        stopWatch.stop();
        if (stopWatch.getTotalTimeSeconds() > 2) {
            log.warn(stopWatch.toString());
        }
    }

    public static boolean GenerateImage(String imgStr, OutputStream out) {
        if (imgStr == null) // 图像数据为空
            return false;
        var decoder = Base64.getDecoder();
        try {
            // Base64解码
            byte[] b = decoder.decode(imgStr);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {
                    b[i] += 256;
                }
            }

            out.write(b);
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    // use NIO
    public static boolean generateImage(String imgStr, OutputStream out) {
        if (imgStr == null) {
            return false;
        }
        try {
            byte[] decodedBytes = decoder.decode(imgStr);
            ByteBuffer buffer = ByteBuffer.wrap(decodedBytes);
            WritableByteChannel channel = Channels.newChannel(out);
            channel.write(buffer);
            channel.close(); // It's the caller's responsibility to close the OutputStream.
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    public static String GetImageStr(String imgFilePath) {
        // 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
        byte[] data = null;

        // 读取图片字节数组
        try {
            InputStream in = new FileInputStream(imgFilePath);
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (IOException e) {
            log.error("fail to ready image:{}", imgFilePath, e);
        }

        // 对字节数组Base64编码
        var encoder = Base64.getEncoder();
        return new String(encoder.encode(data));//返回字符串
    }


}
