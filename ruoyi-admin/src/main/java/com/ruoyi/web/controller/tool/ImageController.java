package com.ruoyi.web.controller.tool;

import com.ruoyi.system.service.ISysGoodsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@Slf4j
@RestController
@RequestMapping("kf")
@RequiredArgsConstructor
public class ImageController {

    private final ISysGoodsService sysGoodsService;

    @GetMapping("{origin}")
    public ResponseEntity<String> forward(@PathVariable String origin,
                                          HttpServletRequest request) {
        String base64 = "";
        if(origin.endsWith(".jpg_640x640q90.jpg")) {
            base64 = origin.replace( ".jpg_640x640q90.jpg","");
        }else if (origin.endsWith(".jpg")) {
            base64 = origin.replace(".jpg", "");
        }
        byte[] decodedBytes;
        try {
            decodedBytes = Base64.getDecoder().decode(base64);
        } catch (Exception e) {
            throw new IllegalArgumentException("参数错误");
        }
        String decodedString = new String(decodedBytes, StandardCharsets.UTF_8);

        final var isWhiteIP = sysGoodsService.isWhiteIp(request);

        final var list = decodedString.split("\\+");
        if (list.length != 2) {
            throw new IllegalArgumentException("参数错误");
        }
        final var goodsId = Long.parseLong(list[0]);
        final var index = Integer.parseInt(list[1]);

        final var goods = sysGoodsService.selectSysGoodsByGoodsId(goodsId);

        final var white = getImgUri(goods.getWhiteImg(), index);
        final var black = getImgUri(goods.getBlackImg(), index);

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

    private String getImgUri(String uris, Integer index) {
        final var arr = uris.split(",");
        if (arr.length <= index) {
            throw new IllegalArgumentException("参数错误");
        }
        return arr[index];
    }
}