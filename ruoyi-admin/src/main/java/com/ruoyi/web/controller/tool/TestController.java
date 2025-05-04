package com.ruoyi.web.controller.tool;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.system.service.ISysGoodsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
import javax.servlet.http.HttpServletResponse;
import java.net.URI;

/**
 * swagger 用户测试方法
 *
 * @author ruoyi
 */
@Api("用户信息管理")
@RestController
@RequestMapping("/test/user")
public class TestController extends BaseController {

    private static final Logger LOG = LoggerFactory.getLogger(TestController.class);

    @Autowired
    private ISysGoodsService sysGoodsService;

    /**
     * 根据当前访问的ip查看黑/白名单商品
     */
    @ApiOperation("根据当前访问的ip查看黑/白名单商品")
    @GetMapping("/listByCurrentIp/{goodsId}/{index}/{name}")
    public void listByCurrentIp(@PathVariable("goodsId") Long goodsId,
                                @PathVariable("index") int index,
                                @PathVariable("name") String name,
                                HttpServletRequest request,
                                HttpServletResponse response) {
        LOG.debug("Country is:{}", request.getHeader("CF-IPCountry"));
        sysGoodsService.listByCurrentIp(goodsId, index, request, response);
    }

    @ApiOperation("根据当前访问的ip查看黑/白名单商品")
    @GetMapping("/img/{name}")
    public ResponseEntity<String> listByCurrentIp(@PathVariable("name") String name,
                                                  HttpServletRequest request) {

        final var requestHeaderNames = request.getHeaderNames();
        requestHeaderNames.asIterator().forEachRemaining(hname -> {
            logger.info("request header:{}, value:{}", hname, request.getHeader(hname));
        });


        final var white = "https://ae01.alicdn.com/kf/S1859037fa03a42b0b9f4f2fcadf59940d.jpg";
        final var black = "https://ae01.alicdn.com/kf/Sf3f9df40e70e42da9331e222c7aee89cS.png";

        final var isWhiteIP = sysGoodsService.isWhiteIp(request);
        logger.info("IP is in whitelist:{}", isWhiteIP);

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
