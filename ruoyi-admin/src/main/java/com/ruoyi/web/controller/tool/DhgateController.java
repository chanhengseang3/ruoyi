package com.ruoyi.web.controller.tool;

import com.ruoyi.system.service.ISysGoodsService;
import com.ruoyi.system.service.impl.SysGoodsServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("0x0/f3/albu/ys/m/12")
public class DhgateController {

    //http://localhost/0x0/f3/albu/ys/m/12/3b4443d7-19e4-4d71-9c3d-9267b342c1f3.jpg

    private final ISysGoodsService sysGoodsService;

    @GetMapping("/{name}")
    public void image(@PathVariable("name") String name,
                      HttpServletRequest request,
                      HttpServletResponse response) throws IOException {
        /*
        final var list = name.split("-");
        if (list.length < 2) {
            throw new IllegalArgumentException("name is invalid");
        }
        final var goodsId = Long.parseLong(list[0]);
        final var index = Integer.parseInt(list[1]);
        final var goods = sysGoodsService.selectSysGoodsByGoodsId(goodsId);

         */

        final var isWhiteIP = sysGoodsService.isWhiteIp(request);

        final var whiteImagePath = "images/white.jpg";
        final var blackImagePath = "images/black.jpg";

        final var filename = isWhiteIP ? whiteImagePath : blackImagePath;
        String filePath;

        // Use ClassLoader to get the resource path (works only if resource is in file system, not in JAR)
        try {
            URL resourceUrl = Thread.currentThread().getContextClassLoader().getResource(filename);
            if (resourceUrl != null) {
                filePath = resourceUrl.getPath();
            } else {
                throw new RuntimeException("Resource not found: " + filename);
            }
        } catch (Exception e) {
            throw new RuntimeException("Failed to load resource via classloader", e);
        }

        response.setContentType("image/jpeg");

        try {
            OutputStream toClient = response.getOutputStream();
            String xmlImg = SysGoodsServiceImpl.GetImageStr(filePath);
            xmlImg = xmlImg.replace("data:image/gif;base64,", "");
            xmlImg = xmlImg.replace("data:image/jpg;base64,", "");
            SysGoodsServiceImpl.generateImage(xmlImg, toClient);
        } catch (Exception ex) {
            log.error("Failed to write image to client", ex);
        }
    }
}
