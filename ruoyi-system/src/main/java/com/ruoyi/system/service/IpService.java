package com.ruoyi.system.service;

/**
 * IP Service interface for caching
 */
public interface IpService {
    
    /**
     * Check if the IP is in the white list
     *
     * @param ip the IP address to check
     * @return true if the IP is in the white list
     */
    boolean isWhiteIp(String ip);
}
