package com.ssm.pet.service.serviceimpl;

import com.ssm.pet.dao.UserPetImgDAO;
import com.ssm.pet.pojo.UserPetImgTO;
import com.ssm.pet.service.UserPetImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserPetImgServiceImpl implements UserPetImgService{
    @Autowired
    private UserPetImgDAO userPetImgDAO;

    @Override
    public void addOneUserPetImg(String newName) {
        userPetImgDAO.insertOneUserPetImg(newName);
    }

    @Override
    public List<UserPetImgTO> getUserPetImgs() {
        return userPetImgDAO.selectUserPetImgs();
    }
}
