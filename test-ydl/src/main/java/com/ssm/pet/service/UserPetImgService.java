package com.ssm.pet.service;

import com.ssm.pet.pojo.UserPetImgTO;

import java.util.List;

public interface UserPetImgService {
    /**
     * 添加用户分享图片
     * @param newName
     */
    void addOneUserPetImg(String newName);

    /**
     * 得到所有的用户分享图片
     * @return
     */
    List<UserPetImgTO> getUserPetImgs();
}
