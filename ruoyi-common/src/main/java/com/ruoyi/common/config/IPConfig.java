package com.ruoyi.common.config;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.*;

public class IPConfig {

    private static final String LOCAL_IP = "127.0.0.1";

    private static final String UNKNOWN = "未知";

    private static final Logger log = LoggerFactory.getLogger(IPConfig.class);

    public static String getIpAddr(HttpServletRequest request) {
        String agent = request.getHeader("user-agent");
        return agent;
    }

    public static String getIp(HttpServletRequest request) {
        String ipAddress = null;

        ipAddress = request.getHeader("x-forwarded-for");
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            if (ipAddress.equals("127.0.0.1")) {
                //根据网卡取本机配置的IP
                InetAddress inet = null;
                try {
                    inet = InetAddress.getLocalHost();
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
                ipAddress = inet.getHostAddress();
            }

        }


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
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
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

    public static void main(String[] args) {
        String ip = "58.16.180.3";
        String address = getAddressByIp(ip);
        System.out.println(address);
    }
}
