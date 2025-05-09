package com.ruoyi.system.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.config.IPConfig;
import com.ruoyi.system.domain.SysCountry;
import com.ruoyi.system.mapper.SysCountryMapper;
import com.ruoyi.system.service.IpService;
import com.ruoyi.system.service.RestTemplateService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class IpUtils implements IpService {

    private static final String url = "http://v2.api.iphub.info/ip/";
    private static final Logger log = LoggerFactory.getLogger(IpUtils.class);

    @Value("${user.xkey}")
    private String xKey;

    @Autowired
    private SysCountryMapper countryMapper;

    @Override
    @Cacheable(value = "isWhiteIp", key = "#ip")
    public boolean isWhiteIp(String ip) {
        log.info("Cache MISS - Executing isWhiteIp method for IP: {}", ip);
        String getCountry = IPConfig.getAddressByIp(ip);
        log.info("IP is:{} Country is:{}", ip, getCountry);
        List<SysCountry> countries = countryMapper.selectSysCountryListByName(getCountry);
        if (!countries.isEmpty() && countries.get(0).getCountryType() == 0) {
            return !isVpn(ip);
        }
        return false;
    }

    private boolean isVpn(String ip) {
        final var header = Map.of("X-Key", xKey);
        log.debug("key is:{}", xKey);
        ResponseEntity<String> responseEntity = RestTemplateService.get(url + ip, header);
        if (responseEntity.getStatusCodeValue() == 200) {
            final var body = responseEntity.getBody();
            log.debug("body is:{}", body);
            final var json = JSONObject.parseObject(body);
            return json.getIntValue("block") == 1;
        }
        return false;
    }
}
