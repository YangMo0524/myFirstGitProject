package com.ssm.pet.dao;

import com.ssm.pet.pojo.UserTO;

public interface UserDAO {
    /**
     * 插入一个用户
     * @param user
     */
    void insertOneUser(UserTO user);

    /**
     * 查询用户通过用户名
     * @param user
     * @return
     */
    UserTO selectUserByUserName(UserTO user);
}
