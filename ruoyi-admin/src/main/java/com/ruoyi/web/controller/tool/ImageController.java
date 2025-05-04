package com.ruoyi.web.controller.tool;

import com.ruoyi.system.service.ISysGoodsService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    private static final Logger LOG = LoggerFactory.getLogger(ImageController.class);

    private final ISysGoodsService sysGoodsService;

    @GetMapping("{name}")
    public void listByCurrentIp(@PathVariable("name") String name,
                                HttpServletRequest request,
                                HttpServletResponse response) {

        final long goodsId = 0L;
        final int index = 0;
        sysGoodsService.listByCurrentIp(goodsId, index, request, response);
    }
}
