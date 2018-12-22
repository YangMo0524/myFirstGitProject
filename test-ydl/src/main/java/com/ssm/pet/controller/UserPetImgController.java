package com.ssm.pet.controller;

import com.ssm.pet.pojo.UserPetImgTO;
import com.ssm.pet.service.UserPetImgService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("userPetImg.html")
public class UserPetImgController {
    @Value("${FILE_URL}")
    private String FILE_URL;

    @Autowired
    private UserPetImgService userPetImgService;

   /* @RequestMapping("fileLoad.html")
    public String upload2(@RequestParam(name = "file") MultipartFile file1, Model model) {
        try {
            String fileName = file1.getOriginalFilename();
            String extName = fileName.substring(fileName.lastIndexOf("."));
            String newName = System.currentTimeMillis() + extName;

            FileUtils.copyInputStreamToFile(file1.getInputStream(),
                    new File(FILE_URL + newName));
            model.addAttribute("message", "成功");
            userPetImgService.addOneUserPetImg(newName);//添加用户分享图片
            model.addAttribute("newName", newName);
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("message", "失败");
        }
        return "/add";
    }*/

    @RequestMapping(params = "act=getImages")
    public String getImages(Model model){
        List<UserPetImgTO> imgs = userPetImgService.getUserPetImgs();
        model.addAttribute("imgs", imgs);
        return "moreImages";
    }
}
