package com.ssm.pet.service;

import com.ssm.pet.pojo.UserTO;

public interface UserService {
    /**
     * 用户注册
     * @param user
     */
    void register(UserTO user);

    /**
     * 登录
     * @param user
     * @return
     */
    UserTO login(UserTO user);

    /**
     * ajax异步查询用户
     * @param user
     * @return
     */
    UserTO getUserByName(UserTO user);
}
