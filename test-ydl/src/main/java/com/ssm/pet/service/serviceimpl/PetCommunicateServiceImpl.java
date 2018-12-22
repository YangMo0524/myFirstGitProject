package com.ssm.pet.service.serviceimpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.pet.dao.PetCommunicateDAO;
import com.ssm.pet.pojo.PetCommunicateTO;
import com.ssm.pet.pojo.ReplyTO;
import com.ssm.pet.service.PetCommunicateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PetCommunicateServiceImpl implements PetCommunicateService{
    @Autowired
    private PetCommunicateDAO petCommunicateDAO;
    @Override
    public PageInfo<PetCommunicateTO> getPetCommunicate(String info,String title,Integer pageNum) {
        /*PetCommunicateTO petCommunicateTO=new PetCommunicateTO();
        petCommunicateTO.setInfo(info);*/
        PageHelper.startPage(pageNum,6,"create_date desc");
        return new PageInfo<>(petCommunicateDAO.getPetCommunicateList(info,title),5);
    }

    @Override
    public void addPetCommunicate(PetCommunicateTO petCommunicateTO) {
        petCommunicateDAO.addPetCommunicate(petCommunicateTO);
    }

    @Override
    public PageInfo<PetCommunicateTO> getPetCommunicate(String createDate,Integer pageNum) {
        PageHelper.startPage(pageNum,6,"create_date desc");
        return new PageInfo<>(petCommunicateDAO.getPetCommunicate(createDate),5);
    }

    @Override
    public List<PetCommunicateTO> getImages() {
        return petCommunicateDAO.getImages();
    }

    @Override
    public PetCommunicateTO getInfo(Integer id) {
        return petCommunicateDAO.getInfo(id);
    }

    @Override
    public List<ReplyTO> getReply(Integer id) {
        return petCommunicateDAO.getReply(id);
    }

    @Override
    public void addReply(ReplyTO replyTO) {
        petCommunicateDAO.addReply(replyTO);
    }

    @Override
    public void updateReply(Integer id) {
        petCommunicateDAO.updateReply(id);
    }

    @Override
    public List<PetCommunicateTO> getHot() {
        return petCommunicateDAO.getHot();
    }

    @Override
    public int getCount() {
        return petCommunicateDAO.getCount();
    }

}
