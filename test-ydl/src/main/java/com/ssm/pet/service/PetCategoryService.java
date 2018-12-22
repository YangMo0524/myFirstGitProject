package com.ssm.pet.service;

import com.ssm.pet.pojo.PetInfoTO;
import com.ssm.pet.pojo.PetTO;

import java.util.List;

public interface PetCategoryService {
    List<PetTO> getPetCategory(Integer petCategoryId);
    PetInfoTO getPetInfo(Integer petId);
    PetTO getPetDescription(Integer petId);
    List<PetTO> getPetCategories();
}
