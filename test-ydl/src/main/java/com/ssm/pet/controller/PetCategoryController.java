package com.ssm.pet.controller;

import com.ssm.pet.pojo.ArtcleTO;
import com.ssm.pet.pojo.PetInfoTO;
import com.ssm.pet.pojo.PetTO;
import com.ssm.pet.service.ArtcleService;
import com.ssm.pet.service.PetCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PetCategoryController {
    @Autowired
    private PetCategoryService petCategoryService;

    @Autowired
    private ArtcleService artcleService;

    @RequestMapping("/petcategory.html")
    @ResponseBody
    public List<PetTO> getCategoryById(Integer petCategoryId){
        if (petCategoryId==null){
            petCategoryId=1;
        }
        List<PetTO> petCategory = petCategoryService.getPetCategory(petCategoryId);
        //model.addAttribute("petCategory",petCategory);
        return petCategory;
    }
    @RequestMapping("/petinfo.html")
    public String getInfo(Integer petId,HttpServletRequest request){
        List<ArtcleTO> hotAllArtcles = artcleService.getAllArtcleByClick();//全部文章最热
        ArtcleTO firstArtcle = hotAllArtcles.get(0);//
        PetInfoTO petInfo = petCategoryService.getPetInfo(petId);
        PetTO petDescription = petCategoryService.getPetDescription(petId);

        request.setAttribute("petDescription",petDescription);
        request.setAttribute("petInfo",petInfo);

        request.setAttribute("AllArtcles", hotAllArtcles);
        request.setAttribute("firstArtcle", firstArtcle);
        return "petinfo";

    }
    @RequestMapping("/petcategories.html")
    public String getCategorys(  HttpServletRequest request){
        List<PetTO> petCategories = petCategoryService.getPetCategories();
        //System.out.println(petCategories);
        request.setAttribute("petCategories",petCategories);
        request.setAttribute("html",99);
        return "encyclopedia";
    }


}
