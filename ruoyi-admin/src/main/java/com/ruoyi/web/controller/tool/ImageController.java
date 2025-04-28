package com.ruoyi.web.controller.tool;

import com.ruoyi.system.service.ISysGoodsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.net.URI;

@RestController
@RequestMapping("kf")
public class ImageController {

    private static final Logger LOG = LoggerFactory.getLogger(ImageController.class);

    @Autowired
    private ISysGoodsService sysGoodsService;

    @GetMapping("/img/{name}")
    public ResponseEntity<String> listByCurrentIp(@PathVariable("name") String name,
                                                  HttpServletRequest request) {

        final var requestHeaderNames = request.getHeaderNames();
        requestHeaderNames.asIterator().forEachRemaining(hname -> {
            LOG.info("request header:{}, value:{}", hname, request.getHeader(hname));
        });

        final var white = "https://ae01.alicdn.com/kf/S1859037fa03a42b0b9f4f2fcadf59940d.jpg";
        final var black = "https://ae01.alicdn.com/kf/Sf3f9df40e70e42da9331e222c7aee89cS.png";

        final var isWhiteIP = sysGoodsService.isWhiteIp(request);
        LOG.info("IP is in whitelist:{}", isWhiteIP);

        HttpHeaders headers = new HttpHeaders();
        headers.setCacheControl(CacheControl.noCache());
        headers.setPragma("no-cache");

        if (isWhiteIP) {
            headers.setLocation(URI.create(white));
        } else {
            headers.setLocation(URI.create(black));
        }
        return new ResponseEntity<>(headers, HttpStatus.FOUND); // 302
    }
}
