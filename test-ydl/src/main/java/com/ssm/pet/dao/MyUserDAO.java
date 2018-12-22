package com.ssm.pet.dao;

import com.ssm.pet.pojo.*;

import java.util.List;
import java.util.Map;

public interface MyUserDAO {
    /**
     * 增加图片
     */
    void addImg(String url);

    /**
     * 增加用户与图片关系
     */
    void addUserImg(Map<String, Object> param);

    Integer getImgIdByUrl(String url);

    List<String> getAllMyImg(Integer userId);

    Integer getMyImgCount();

    void updateUserImg(UserInfoTO userInfoTO);

    String getUserImgByUid(Integer userId);

    void updateUserPassword(UserTO userTO);

    String getPasswordByUid(Integer uid);

    List<ArtcleTO> getMyArtcle(Map param);

    List<PetCommunicateTO> getMyComm(Integer uid);

    void updateMyComm(PetCommunicateTO comm);

    void delMyComm(Integer id);

    void delUserComm(Integer id);

    void updateMyArtcle(ArtcleTO artcle);

    void delMyArtcle(Integer id);

    void delUserArtcle(Integer id);
}
