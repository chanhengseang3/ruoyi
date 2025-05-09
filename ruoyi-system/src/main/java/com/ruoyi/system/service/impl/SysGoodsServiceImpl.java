package com.ruoyi.system.service.impl;

import com.alibaba.fastjson.JSONObject;
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
import com.ruoyi.system.service.RestTemplateService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;
import java.util.Map;

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

    private static final String url = "http://v2.api.iphub.info/ip/";

    @Autowired
    private SysGoodsMapper sysGoodsMapper;
    @Autowired
    private SysWhiteIpMapper ipMapper;
    @Autowired
    private SysCountryMapper countryMapper;

    @Value("${user.xkey}")
    private String xKey;

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

    @Override
    public void listByCurrentIp(Long goodsId, int index, HttpServletRequest request, HttpServletResponse response) {

        SysGoods sysGoods = selectSysGoodsByGoodsId(goodsId);
        if (null == sysGoods) {
            throw new ServiceException("商品不存在！！！");
        }

        final var isWhite = isWhiteIp(request);

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
        if (stopWatch.getTotalTimeSeconds() > 5) {
            log.warn(stopWatch.toString());
        }
    }

    public boolean isWhiteIp(HttpServletRequest request) {
        boolean isWhite = false;
        //获取当前访问的ip
        String ip = IPConfig.getIp(request);

        SysWhiteIp sysWhiteIp = new SysWhiteIp();
        sysWhiteIp.setWhiteIpAdd(ip);
        List<SysWhiteIp> ips = ipMapper.selectSysWhiteIpList(sysWhiteIp);
        if (!ips.isEmpty()) {
            isWhite = true;
        } else {
            String getCountry = IPConfig.getAddressByIp(ip);
            log.info("IP is:{} Country is:{}", ip, getCountry);
            List<SysCountry> countries = countryMapper.selectSysCountryListByName(getCountry);
            if (!countries.isEmpty() && countries.get(0).getCountryType() == 0) {
                isWhite = !isVpn(ip);
            }
        }

        return isWhite;
    }

    private boolean isVpn(String ip) {
        final var header = Map.of("X-Key", xKey);
        ResponseEntity<String> responseEntity = RestTemplateService.get(url + ip, header);
        if (responseEntity.getStatusCodeValue() == 200) {
            final var body = responseEntity.getBody();
            final var json = JSONObject.parseObject(body);
            return json.getIntValue("block") == 1;
        }
        return false;
    }

    @Override
    public ResponseEntity<byte[]> listByCurrentIp(Long goodsId, int index, HttpServletRequest request) {
        boolean isWhite = false;
        //获取当前访问的ip
        String ip = IPConfig.getIp(request);

        SysWhiteIp sysWhiteIp = new SysWhiteIp();
        sysWhiteIp.setWhiteIpAdd(ip);
        List<SysWhiteIp> ips = ipMapper.selectSysWhiteIpList(sysWhiteIp);
        if (!ips.isEmpty()) {
            isWhite = true;
        } else {
            String getCountry = IPConfig.getAddressByIp(ip);
            List<SysCountry> countries = countryMapper.selectSysCountryListByName(getCountry);
            if (!countries.isEmpty() && countries.get(0).getCountryType() == 0) {
                isWhite = true;
            }
        }

        SysGoods sysGoods = selectSysGoodsByGoodsId(goodsId);
        if (null == sysGoods) {
            throw new ServiceException("商品不存在！！！");
        }

        var stopWatch = new StopWatch("Read image and write into output stream");
        stopWatch.start("Read from disk no decrypt");
        try {
            String path = RuoYiConfig.getProfile() + (isWhite ? sysGoods.getWhiteImg().split(",")[index] : sysGoods.getBlackImg().split(",")[index]);
            Path filePath = Paths.get(path);
            var mimeType = Files.probeContentType(filePath);
            MediaType contentType = MediaType.IMAGE_JPEG;
            if (mimeType.contains("gif")) {
                contentType = MediaType.IMAGE_GIF;
            }
            var files = Files.readAllBytes(filePath);
            stopWatch.stop();
            if (stopWatch.getTotalTimeSeconds() > 5) {
                log.warn(stopWatch.toString());
            }
            return ResponseEntity
                    .ok()
                    .contentType(contentType)
                    .body(files);
        } catch (Exception ex) {
            log.error("fail to read/write image", ex);
            throw new RuntimeException("cannot read image");
        }
    }

    // use NIO
    public static void generateImage(String imgStr, OutputStream out) {
        if (imgStr == null) {
            return;
        }
        try {
            byte[] decodedBytes = decoder.decode(imgStr);
            ByteBuffer buffer = ByteBuffer.wrap(decodedBytes);
            WritableByteChannel channel = Channels.newChannel(out);
            channel.write(buffer);
            channel.close(); // It's the caller's responsibility to close the OutputStream.
        } catch (IOException e) {
            log.info("IO error", e);
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
