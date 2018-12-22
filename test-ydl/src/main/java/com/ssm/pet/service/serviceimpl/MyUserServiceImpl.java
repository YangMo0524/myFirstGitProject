package com.ssm.pet.service.serviceimpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.pet.dao.MyUserDAO;
import com.ssm.pet.pojo.ArtcleTO;
import com.ssm.pet.pojo.PetCommunicateTO;
import com.ssm.pet.pojo.UserInfoTO;
import com.ssm.pet.pojo.UserTO;
import com.ssm.pet.service.MyUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MyUserServiceImpl implements MyUserService {

    @Autowired
    private MyUserDAO myUserDAO;

    @Override
    public void addMyImg(String url,Integer uid) throws Exception {
        try{
            myUserDAO.addImg(url);
            Integer pmid= myUserDAO.getImgIdByUrl(url);
            Map<String,Object> param =new HashMap<>();
            param.put("uid",uid);
            param.put("pmid",pmid);
            myUserDAO.addUserImg(param);
        }catch(Exception e){
            e.printStackTrace();
            throw new Exception("上传失败");
        }
    }

    @Override
    public List<String> getAllMyImg(Integer userId) {
        return myUserDAO.getAllMyImg(userId);
    }

    @Override
    public Integer getMyImgCount() {
        return myUserDAO.getMyImgCount();
    }

    @Override
    public void updateUserImg(UserInfoTO userInfoTO) {
        myUserDAO.updateUserImg(userInfoTO);
    }

    @Override
    public String getUserImgByUid(Integer userId) {
        return myUserDAO.getUserImgByUid(userId);
    }

    @Override
    public void updateUserPassword(UserTO userTO) {

        myUserDAO.updateUserPassword(userTO);
    }

    @Override
    public String getPasswordByUid(Integer uid) {
        return myUserDAO.getPasswordByUid(uid);
    }

    @Override
    public PageInfo<ArtcleTO> getMyArtcle(Map param, Integer pageNum, Integer pageSize) {

        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<>(myUserDAO.getMyArtcle(param));
    }

    @Override
    public PageInfo<PetCommunicateTO> getMyComm(Integer uid,Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return new PageInfo<>(myUserDAO.getMyComm(uid));
    }

    @Override
    public void updateMyComm(PetCommunicateTO comm) {
        myUserDAO.updateMyComm(comm);
    }

    @Override
    public void delMyComm(Integer id) {
        myUserDAO.delMyComm(id);
        myUserDAO.delUserComm(id);
    }

    @Override
    public void updateMyArtcle(ArtcleTO artcle) {
        myUserDAO.updateMyArtcle(artcle);
    }

    @Override
    public void delMyArtcle(Integer id) {
        myUserDAO.delMyArtcle(id);
        myUserDAO.delUserArtcle(id);
    }

}
