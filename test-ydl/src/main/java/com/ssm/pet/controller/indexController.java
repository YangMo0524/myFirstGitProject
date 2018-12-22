package com.ssm.pet.controller;

import com.ssm.pet.pojo.ArtcleTO;
import com.ssm.pet.pojo.PetTO;
import com.ssm.pet.pojo.UserPetImgTO;
import com.ssm.pet.pojo.UserTO;
import com.ssm.pet.service.ArtcleService;
import com.ssm.pet.service.PetCategoryService;
import com.ssm.pet.service.UserPetImgService;
import com.ssm.pet.util.UserContants;
import com.ssm.pet.util.UserPetImgContants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
public class indexController {

    @Autowired
    private UserPetImgService userPetImgService;

    @Autowired
    private ArtcleService artcleService;

    @Autowired
    private PetCategoryService petCategoryService;

    @RequestMapping("index.html")
    public String index(Model model) {
        //宠物百科
        Integer petCategoryId=1;
        List<PetTO> petCategory = petCategoryService.getPetCategory(petCategoryId);
        model.addAttribute("petCategory",petCategory);
        //System.out.println(petCategory);

       //养宠知识 列表
        List<ArtcleTO> threadartcle  = artcleService.getAllArtcleByClick();

        //宠友晒图
        List<UserPetImgTO> imgTOList = userPetImgService.getUserPetImgs();//查询得到图片集合
        List<UserPetImgTO> imgs = new ArrayList<>();//定义一个新的集合，封装随机六张图
        int length = imgTOList.size();//定义一个变量长度

        for (int i = 0; i < UserPetImgContants.COUNT; i++) {
            int randomNum = new Random().nextInt(length);
            imgs.add(imgTOList.get(randomNum));
            imgTOList.remove(imgTOList.get(randomNum));
            length = length - 1;
        }

        model.addAttribute("html",0);
        model.addAttribute("threadartcle",threadartcle);
        model.addAttribute("imgs", imgs);

        return "index";
    }
    @RequestMapping("register.html")
    public String goRegister() {
        return "register";
    }

    @RequestMapping("login.html")
    public String goLogin() {
        return "login";
    }

    @RequestMapping("logout.html")
    public String logout(HttpSession session, Model model) {
        UserTO user = (UserTO) session.getAttribute(UserContants.USER_SESSION);
        model.addAttribute("userName", user.getUserName());
        session.invalidate();
        return "forward:login.html";
    }

    @RequestMapping("addArtcle.html")
    public String addArtcle(Model model) {
        model.addAttribute("html",7);
        return "userAddArctle";
    }
}
