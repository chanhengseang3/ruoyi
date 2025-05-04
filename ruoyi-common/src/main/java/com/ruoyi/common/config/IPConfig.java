package com.ruoyi.common.config;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;

public class IPConfig {

    private static final String UNKNOWN = "未知";
    private static final Logger log = LoggerFactory.getLogger(IPConfig.class);

    public static String getIp(HttpServletRequest request) {
        String ipAddress;
        ipAddress = request.getHeader("x-forwarded-for");
        log.info("x-forwarded-for:{}", ipAddress);
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
            log.info("Proxy-Client-IP:{}", ipAddress);
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
            log.info("WL-Proxy-Client-IP:{}", ipAddress);
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            log.info("getRemoteAddr:{}", ipAddress);
            if (ipAddress.equals("127.0.0.1")) {
                //根据网卡取本机配置的IP
                InetAddress inet;
                try {
                    inet = InetAddress.getLocalHost();
                    ipAddress = inet.getHostAddress();
                    log.info("getLocalHost:{}", ipAddress);
                } catch (UnknownHostException e) {
                    log.info("Unable to get IP address", e);
                }
            }

        }

        log.info("Original IP:{}", ipAddress);

        //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if (ipAddress != null && ipAddress.length() > 15) { //"***.***.***.***".length() = 15
            if (ipAddress.indexOf(",") > 0) {
                ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
            }
        }

        return ipAddress;
    }

    public static String getAddressByIp(String ip) {
        try {
            var stopWatch = new StopWatch("Get Country from IP:" + ip);
            stopWatch.start("http request to IP138");
            URL url = new URL("https://api.ip138.com/ip/?ip=" + ip + "&datatype=jsonp&token=7d4a7771a18f25a3bebb982d63b924c0");
            URLConnection conn = url.openConnection();
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
            String line;
            StringBuilder result = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }
            reader.close();
            stopWatch.stop();
            stopWatch.start("parse result");
            JSONObject jsStr = JSONObject.parseObject(result.toString());
            JSONArray address = JSONObject.parseArray(jsStr.get("data").toString());
            stopWatch.stop();
            if (stopWatch.getTotalTimeSeconds() > 2) {
                log.warn(stopWatch.toString());
            }
            return address.get(0).toString();
        } catch (IOException e) {
            return UNKNOWN;
        }
    }
}
