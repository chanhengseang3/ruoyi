package com.ruoyi.framework.config;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

/**
 * Spring Cache Configuration
 */
@Configuration
public class CacheConfig {

    /**
     * Configure a simple in-memory cache manager for Spring's @Cacheable annotations
     */
    @Bean
    public CacheManager cacheManager() {
        ConcurrentMapCacheManager cacheManager = new ConcurrentMapCacheManager();
        // Add the cache name used in @Cacheable annotations
        cacheManager.setCacheNames(List.of("isWhiteIp"));
        return cacheManager;
    }
}
