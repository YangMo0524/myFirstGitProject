package com.ssm.pet.service.serviceimpl;

import com.ssm.pet.dao.PetCategoryDAO;
import com.ssm.pet.pojo.PetInfoTO;
import com.ssm.pet.pojo.PetTO;
import com.ssm.pet.service.PetCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PetCategoryServiceImpl implements PetCategoryService {
    @Autowired
    private PetCategoryDAO petCategoryDAO;
    @Override
    public List<PetTO> getPetCategory(Integer petCategoryId) {
        return petCategoryDAO.getPetCategory(petCategoryId);
    }

    @Override
    public PetInfoTO getPetInfo(Integer petId) {
        return petCategoryDAO.getPetInfo(petId);
    }

    @Override
    public PetTO getPetDescription(Integer petId) {
        return petCategoryDAO.getPetDescription(petId);
    }

    @Override
    public List<PetTO> getPetCategories() {
        return petCategoryDAO.getPetCategories();
    }

}
