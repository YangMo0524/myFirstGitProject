package com.ssm.pet.service;

import com.github.pagehelper.PageInfo;
import com.ssm.pet.pojo.*;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface MyUserService {
    /**
     * 用户增加图片
     */
    void addMyImg(String url, Integer uid) throws Exception;

    List<String> getAllMyImg(Integer userId);

    Integer getMyImgCount();

    void updateUserImg(UserInfoTO userInfoTO);

    String getUserImgByUid(Integer userId);

    void updateUserPassword(UserTO userTO);

    String getPasswordByUid(Integer uid);

    PageInfo<ArtcleTO> getMyArtcle(Map param, Integer pageNum, Integer pageSize);

    PageInfo<PetCommunicateTO> getMyComm(Integer uid, Integer pageNum, Integer pageSize);

    void updateMyComm(PetCommunicateTO comm);

    void delMyComm(Integer id);

    void updateMyArtcle(ArtcleTO artcle);

    void delMyArtcle(Integer id);
}
