package com.ruoyi.web.controller.tool;

import com.ruoyi.system.service.ISysGoodsService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("kf")
@RequiredArgsConstructor
public class ImageController {

    private final ISysGoodsService sysGoodsService;

    @GetMapping("{name}")
    public void listByCurrentIp(@PathVariable("name") String name,
                                HttpServletRequest request,
                                HttpServletResponse response) {
        final var list = name.split("\\+");
        if(list.length != 3) {
            throw new IllegalArgumentException("参数错误");
        }
        final var goodsId = Long.parseLong(list[0]);
        final var index = Integer.parseInt(list[1]);
        sysGoodsService.listByCurrentIp(goodsId, index, request, response);
    }
}