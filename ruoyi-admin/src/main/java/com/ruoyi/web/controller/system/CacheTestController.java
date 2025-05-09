package com.ruoyi.web.controller.system;

import com.ruoyi.system.service.IpService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

/**
 * Cache Test Controller
 */
@Component
public class CacheTestController implements ApplicationListener<ApplicationReadyEvent> {

    private static final Logger log = LoggerFactory.getLogger(CacheTestController.class);

    @Autowired
    private IpService ipService;

    @Override
    public void onApplicationEvent(ApplicationReadyEvent event) {
        testCache();
    }

    public void testCache() {
        log.info("Starting cache test with 10 calls to the same method...");
        StringBuilder result = new StringBuilder();
        result.append("Cache Test Results:\n");

        // Then test the isWhiteIp method with a test IP
        result.append("\nTesting isWhiteIp method:\n");
        String testIp = "50.175.105.58"; // Google DNS IP for testing
        for (int i = 0; i < 10; i++) {
            boolean ipResult = ipService.isWhiteIp(testIp);
            result.append("Call ").append(i).append(" (IP: ").append(testIp).append("): ").append(ipResult).append("\n");
        }

        log.info("Cache test complete - check logs to see if caching worked");
        log.info(result.toString());
    }
}
