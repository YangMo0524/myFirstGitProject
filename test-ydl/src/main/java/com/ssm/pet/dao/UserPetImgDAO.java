package com.ssm.pet.dao;

import com.ssm.pet.pojo.UserPetImgTO;

import java.util.List;

public interface UserPetImgDAO {
    /**
     * 插入一条用户分享图片
     * @param newName
     */
    void insertOneUserPetImg(String newName);

    /**
     * 查询所有的用户分享图片
     * @return
     */
    List<UserPetImgTO> selectUserPetImgs();
}
