package com.ruoyi.framework.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.concurrent.ConcurrentMapCache;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.annotation.Order;

import javax.annotation.PostConstruct;
import java.util.Arrays;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Spring Cache Configuration
 */
@Configuration
public class CacheConfig {
    private static final Logger log = LoggerFactory.getLogger(CacheConfig.class);

    @PostConstruct
    public void init() {
        log.info("Spring Cache Configuration initialized");
    }

    /**
     * Configure a simple in-memory cache manager for Spring's @Cacheable annotations
     * Using @Order to ensure this bean is initialized early in the application context
     */
    @Bean
    @Primary
    @Order(1)
    public CacheManager cacheManager() {
        log.info("Creating ConcurrentMapCacheManager with caches: isWhiteIp, testCache");
        ConcurrentMapCacheManager cacheManager = new ConcurrentMapCacheManager() {
            @Override
            protected Cache createConcurrentMapCache(final String name) {
                log.info("Creating cache: {}", name);
                return new ConcurrentMapCache(
                    name,
                    new ConcurrentHashMap<>(256),
                    true); // allowNullValues
            }
        };
        
        // Pre-initialize the caches we know we'll use
//        cacheManager.setCacheNames(Arrays.asList("isWhiteIp", "testCache"));
        log.info("Cache initialization complete");
        
        return cacheManager;
    }
}
