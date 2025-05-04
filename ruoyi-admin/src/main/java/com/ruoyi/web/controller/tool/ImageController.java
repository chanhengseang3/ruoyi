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

    @GetMapping("{goodsId}/{index}/{name}")
    public void listByCurrentIp(@PathVariable("name") String name,
                                @PathVariable("goodsId") Long goodsId,
                                @PathVariable("index") int index,
                                HttpServletRequest request,
                                HttpServletResponse response) {
        sysGoodsService.listByCurrentIp(goodsId, index, request, response);
    }
}