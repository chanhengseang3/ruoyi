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
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

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

        // Use the helper method to read image bytes from classpath
        byte[] imageBytes;
        try {
            imageBytes = readResourceToBytes(filename);
        } catch (IOException e) {
            log.error("Failed to load image resource: {}", filename, e);
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        response.setContentType("image/jpeg");
        try (OutputStream toClient = response.getOutputStream()) {
            toClient.write(imageBytes);
            toClient.flush();
        } catch (Exception ex) {
            log.error("Failed to write image to client", ex);
        }
    }

    /**
     * Reads a file from the classpath as a byte array. This works in both development and production (JAR).
     * @param resourcePath the path to the resource inside src/main/resources (e.g. "images/white.jpg")
     * @return byte[] of the file contents
     * @throws IOException if the resource cannot be found or read
     */
    private byte[] readResourceToBytes(String resourcePath) throws IOException {
        try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream(resourcePath)) {
            if (inputStream == null) {
                throw new IOException("Resource not found: " + resourcePath);
            }
            return inputStream.readAllBytes();
        }
    }
}
