package com.ruoyi.web.controller.tool;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.system.service.ISysGoodsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.LinkedHashMap;
import java.util.Map;

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

    private final static Map<Integer, UserEntity> users = new LinkedHashMap<Integer, UserEntity>();

    {
        users.put(1, new UserEntity(1, "admin", "admin123", "15888888888"));
        users.put(2, new UserEntity(2, "ry", "admin123", "15666666666"));
    }

//    @ApiOperation("获取用户列表")
//    @GetMapping("/list")
//    public R<List<UserEntity>> userList()
//    {
//        List<UserEntity> userList = new ArrayList<UserEntity>(users.values());
//        return R.ok(userList);
//    }
//
//    @ApiOperation("获取用户详细")
//    @ApiImplicitParam(name = "userId", value = "用户ID", required = true, dataType = "int", paramType = "path", dataTypeClass = Integer.class)
//    @GetMapping("/{userId}")
//    public R<UserEntity> getUser(@PathVariable Integer userId)
//    {
//        if (!users.isEmpty() && users.containsKey(userId))
//        {
//            return R.ok(users.get(userId));
//        }
//        else
//        {
//            return R.fail("用户不存在");
//        }
//    }
//
//    @ApiOperation("新增用户")
//    @ApiImplicitParams({
//        @ApiImplicitParam(name = "userId", value = "用户id", dataType = "Integer", dataTypeClass = Integer.class),
//        @ApiImplicitParam(name = "username", value = "用户名称", dataType = "String", dataTypeClass = String.class),
//        @ApiImplicitParam(name = "password", value = "用户密码", dataType = "String", dataTypeClass = String.class),
//        @ApiImplicitParam(name = "mobile", value = "用户手机", dataType = "String", dataTypeClass = String.class)
//    })
//    @PostMapping("/save")
//    public R<String> save(UserEntity user)
//    {
//        if (StringUtils.isNull(user) || StringUtils.isNull(user.getUserId()))
//        {
//            return R.fail("用户ID不能为空");
//        }
//        users.put(user.getUserId(), user);
//        return R.ok();
//    }
//
//    @ApiOperation("更新用户")
//    @PutMapping("/update")
//    public R<String> update(@RequestBody UserEntity user)
//    {
//        if (StringUtils.isNull(user) || StringUtils.isNull(user.getUserId()))
//        {
//            return R.fail("用户ID不能为空");
//        }
//        if (users.isEmpty() || !users.containsKey(user.getUserId()))
//        {
//            return R.fail("用户不存在");
//        }
//        users.remove(user.getUserId());
//        users.put(user.getUserId(), user);
//        return R.ok();
//    }
//
//    @ApiOperation("删除用户信息")
//    @ApiImplicitParam(name = "userId", value = "用户ID", required = true, dataType = "int", paramType = "path", dataTypeClass = Integer.class)
//    @DeleteMapping("/{userId}")
//    public R<String> delete(@PathVariable Integer userId)
//    {
//        if (!users.isEmpty() && users.containsKey(userId))
//        {
//            users.remove(userId);
//            return R.ok();
//        }
//        else
//        {
//            return R.fail("用户不存在");
//        }
//    }


    /**
     * 根据当前访问的ip查看黑/白名单商品
     */
    @ApiOperation("根据当前访问的ip查看黑/白名单商品")
//    @RequiresPermissions("system:goods:details")
    @GetMapping("/listByCurrentIp/{goodsId}/{index}/{name}")

    public void listByCurrentIp(@PathVariable("goodsId") Long goodsId,
                                @PathVariable("index") int index,
                                @PathVariable("name") String name,
                                HttpServletRequest request,
                                HttpServletResponse response) {
        LOG.info("Country is:{}", request.getHeader("CF-IPCountry"));
        sysGoodsService.listByCurrentIp(goodsId, index, request, response);
    }
}

@ApiModel(value = "UserEntity", description = "用户实体")
class UserEntity {
    @ApiModelProperty("用户ID")
    private Integer userId;

    @ApiModelProperty("用户名称")
    private String username;

    @ApiModelProperty("用户密码")
    private String password;

    @ApiModelProperty("用户手机")
    private String mobile;

    public UserEntity() {

    }

    public UserEntity(Integer userId, String username, String password, String mobile) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.mobile = mobile;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
