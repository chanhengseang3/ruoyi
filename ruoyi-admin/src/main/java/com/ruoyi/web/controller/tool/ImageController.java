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

    @GetMapping("fw/{origin}")
    public ResponseEntity<String> forward(@PathVariable String origin,
                                          HttpServletRequest request) {

        var base64 = origin.replace(".jpg", "");
        byte[] decodedBytes = Base64.getDecoder().decode(base64);
        String decodedString = new String(decodedBytes, StandardCharsets.UTF_8);
        
        // Get scheme and host directly from the request
        String serverName = request.getServerName();

        final var newUri = "https://%s/kf/%s.jpg".formatted(serverName, decodedString);

        HttpHeaders headers = new HttpHeaders();
        headers.setCacheControl(CacheControl.noCache());
        headers.setPragma("no-cache");
        headers.setLocation(URI.create(newUri));

        return new ResponseEntity<>(headers, HttpStatus.FOUND); // 302
    }

    @GetMapping("{name}")
    public void listByCurrentIp(@PathVariable("name") String fileName,
                                HttpServletRequest request,
                                HttpServletResponse response) {

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        var name = fileName.replace(".jpg", "");

        final var list = name.split("\\+");
        if (list.length != 3) {
            throw new IllegalArgumentException("参数错误");
        }
        final var goodsId = Long.parseLong(list[0]);
        final var index = Integer.parseInt(list[1]);
        sysGoodsService.listByCurrentIp(goodsId, index, request, response);
    }
}