package com.sxs.web.controller.system;

import com.sxs.common.annotation.Log;
import com.sxs.common.core.domain.entity.SysUser;
import com.sxs.common.enums.BusinessType;
import com.sxs.common.utils.SecurityUtils;
import com.sxs.system.service.ISysRoleService;
import com.sxs.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.sxs.common.core.controller.BaseController;
import com.sxs.common.core.domain.AjaxResult;
import com.sxs.common.core.domain.model.RegisterBody;
import com.sxs.common.utils.StringUtils;
import com.sxs.framework.web.service.SysRegisterService;
import com.sxs.system.service.ISysConfigService;

/**
 * 注册验证
 * 
 * @author sxs
 */
@RestController
public class SysRegisterController extends BaseController
{
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

//    @PostMapping("/register")
//    public AjaxResult register(@RequestBody RegisterBody user)
//    {
//        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser"))))
//        {
//            return error("当前系统没有开启注册功能！");
//        }
//        String msg = registerService.register(user);
//        return StringUtils.isEmpty(msg) ? success() : error(msg);
//    }
    @Autowired
    private ISysUserService userService;
    @Autowired
    private ISysRoleService roleService;
    /**
     * 新增用户
     */
    @Log(title = "用户注册", businessType = BusinessType.INSERT)
    @PostMapping("/register")
    public AjaxResult add(@Validated @RequestBody SysUser user)
    {
//        deptService.checkDeptDataScope(user.getDeptId());
//        roleService.checkRoleDataScope(user.getRoleIds());
        if (!userService.checkUserNameUnique(user))
        {
            return error("新增用户'" + user.getUserName() + "'失败，登录账号已存在");
        }
        else if (StringUtils.isNotEmpty(user.getPhonenumber()) && !userService.checkPhoneUnique(user))
        {
            return error("新增用户'" + user.getUserName() + "'失败，手机号码已存在");
        }
        else if (StringUtils.isNotEmpty(user.getEmail()) && !userService.checkEmailUnique(user))
        {
            return error("新增用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
//        user.setCreateBy(getUsername());
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        return toAjax(userService.insertUser(user));
    }
}
