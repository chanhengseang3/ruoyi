package com.ruoyi.web.controller.tool;

import com.ruoyi.system.service.ISysGoodsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@Slf4j
@RestController
@RequestMapping("kf")
@RequiredArgsConstructor
public class ImageController {

    private final ISysGoodsService sysGoodsService;

    @GetMapping("{name}")
    public void listByCurrentIp(@PathVariable("name") String name,
                                HttpServletRequest request,
                                HttpServletResponse response) {
        var base64 = name.replace(".jpg", "");
        byte[] decodedBytes = Base64.getDecoder().decode(base64);
        String decodedString = new String(decodedBytes, StandardCharsets.UTF_8);
        log.debug(decodedString);

        final var list = decodedString.split("\\+");
        if(list.length != 3) {
            throw new IllegalArgumentException("参数错误");
        }
        final var goodsId = Long.parseLong(list[0]);
        final var index = Integer.parseInt(list[1]);
        sysGoodsService.listByCurrentIp(goodsId, index, request, response);
    }
}