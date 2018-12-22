package com.ssm.pet.service;

import com.github.pagehelper.PageInfo;
import com.ssm.pet.pojo.PetCommunicateTO;
import com.ssm.pet.pojo.ReplyTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PetCommunicateService {
     PageInfo<PetCommunicateTO> getPetCommunicate(String info, String title, Integer pageNum);
     void addPetCommunicate(PetCommunicateTO petCommunicateTO);
     PageInfo<PetCommunicateTO> getPetCommunicate(String createDate, Integer pageNum);
     List<PetCommunicateTO> getImages();
     PetCommunicateTO getInfo(Integer id);
     List<ReplyTO> getReply(Integer id);
     void addReply(ReplyTO replyTO);
     void updateReply(@Param(value = "id") Integer id);
     List<PetCommunicateTO> getHot();
     int getCount();
}
