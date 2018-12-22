package com.ssm.pet.dao;

import com.ssm.pet.pojo.PetCommunicateTO;
import com.ssm.pet.pojo.ReplyTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PetCommunicateDAO {
    List<PetCommunicateTO> getPetCommunicateList(@Param(value = "info") String info, @Param(value = "title") String title);
    void addPetCommunicate(PetCommunicateTO petCommunicateTO);
    List<PetCommunicateTO> getPetCommunicate(@Param(value = "createDate") String createDate);
    List<PetCommunicateTO> getImages();
    PetCommunicateTO getInfo(@Param(value = "id") Integer id);
    List<ReplyTO> getReply(@Param(value = "id") Integer id);
    void addReply(ReplyTO replyTO);
    void updateReply(@Param(value = "id") Integer id);
    List<PetCommunicateTO> getHot();
    int getCount();
}
