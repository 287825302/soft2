package com.sxs.common.exception.user;

/**
 * 用户不存在异常类
 * 
 * @author sxs
 */
public class UserNotExistsException extends UserException
{
    private static final long serialVersionUID = 1L;

    public UserNotExistsException()
    {
        super("user.not.exists", null);
    }
}
