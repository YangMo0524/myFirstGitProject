package com.ssm.pet.controller;

import com.github.pagehelper.PageInfo;
import com.ssm.pet.dao.MyUserDAO;
import com.ssm.pet.pojo.*;
import com.ssm.pet.service.MyUserService;
import com.ssm.pet.util.MD5;
import com.ssm.pet.util.UserContants;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MyUserController {

    @Autowired
    private MyUserService myUserService;

    @RequestMapping("go_myPetHouse.html")
    public String goMyPetHome(Model model, Integer uid ){
        String url = myUserService.getUserImgByUid(uid);
        model.addAttribute("url",url);
        return "myPetHouse";
    }

    @RequestMapping("go_updateUserImg.html")
    public String goUpdateUserImg(){
        return "updateUserImg";
    }

    @RequestMapping("go_updateUserPassword.html")
    public String goUpdateUserPassword(){
        return "updateUserPassword";
    }

    @RequestMapping("go_myImg.html")
    public String goMyImg(HttpServletRequest request, HttpSession session){
        UserTO user= (UserTO)session.getAttribute("USER_SESSION");
        System.out.println(user.getUserId()+"-----------------------------");
        List<String> myImgs= myUserService.getAllMyImg(user.getUserId());
        request.setAttribute("myImgs",myImgs);
        return "myImg";
    }
    @RequestMapping("go_myArtcle.html")
    public String goMyAcrtle(){
        return "myArtcle";
    }

    @RequestMapping("go_myComm.html")
    public String goMyComm(){
        return "myComm";
    }

    @RequestMapping("myArtcle.html")
    @ResponseBody
    public TableData myArtcle(ArtcleTO artcle,Integer uid,@RequestParam(name="page") Integer pageNum,@RequestParam(name = "limit") Integer pageSize){
        if (pageNum==null){
            pageNum=1;
        }
        if (pageSize==null||pageSize>30||pageSize<0){
            pageSize=5;
        }
        TableData data=new TableData();
        Map<String,Object> param=new HashMap<>();
        param.put("artcle",artcle);
        param.put("uid",uid);
        PageInfo<ArtcleTO> artcles=myUserService.getMyArtcle(param,pageNum,pageSize);
        data.setCode(0);
        data.setCount(artcles.getTotal());
        data.setData(artcles.getList());
        return data;
    }


    @RequestMapping("myComm.html")
    @ResponseBody
    public TableData myComm(Integer uid,@RequestParam(name = "page") Integer pageNum,@RequestParam(name = "limit") Integer pageSize){
        if(pageNum==null){
            pageNum=1;
        }
        if(pageSize==null||pageSize<0||pageSize>30){
            pageSize=5;
        }
        TableData data=new TableData();
        PageInfo<PetCommunicateTO> comms=myUserService.getMyComm(uid,pageNum,pageSize);
        data.setCode(0);
        data.setCount(comms.getTotal());
        data.setData(comms.getList());
        return data;
    }

    @RequestMapping("updateMyArtcle.html")
    @ResponseBody
    public boolean updateMyArtcle(ArtcleTO artcle){
       try {
           myUserService.updateMyArtcle(artcle);
       }catch (Exception e){
           e.printStackTrace();
           return false;
       }
        return true;
    }

    @RequestMapping("delMyArtcle.html")
    @ResponseBody
    public boolean delMyArtcle(Integer artcleId){
        try {
            myUserService.delMyArtcle(artcleId);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @RequestMapping("updateMyComm.html")
    @ResponseBody
    public boolean updateMyComm(PetCommunicateTO comm){
        try {
            myUserService.updateMyComm(comm);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @RequestMapping("delMyComm.html")
    @ResponseBody
    public boolean delMyComm(Integer commId){
        try {
            myUserService.delMyComm(commId);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @RequestMapping("updateUserImg.html")
    @ResponseBody
    public String updateUserImg(@RequestParam(name = "file") MultipartFile file1,Integer uid){
        try {
            String fileName = file1.getOriginalFilename();
            String extName = fileName.substring(fileName.lastIndexOf("."));
            String newName = System.currentTimeMillis() + extName;

            FileUtils.copyInputStreamToFile(file1.getInputStream(),
                    new File("D:/petimages/" + newName));
            String url="http://localhost:8080/pet/image/"+newName;
            UserInfoTO userInfoTO=new UserInfoTO();
            userInfoTO.setUserId(uid);
            userInfoTO.setUserImg(newName);
            myUserService.updateUserImg(userInfoTO);

            return url;
        } catch (IOException e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping("updateUserPassword.html")
    public String updateUserPassword(Model model,HttpServletRequest request,String oldpassword,String newpassword,String repassword,Integer uid){
        oldpassword= MD5.toMD5(oldpassword + UserContants.SALT_VALUE);

        if(oldpassword==null){

            request.setAttribute("msg","当前密码不能为空");
            return "redirect:go_myPetHouse.html?uid="+uid;
        }
        if(!oldpassword.equals(myUserService.getPasswordByUid(uid)) ){
            request.setAttribute("msg"," 当前密码错误");

            return "redirect:go_myPetHouse.html?uid="+uid;
        }
        if (newpassword==null){

            request.setAttribute("msg","新密码不能为空");
            return "redirect:go_myPetHouse.html?uid="+uid;
        }
        if (repassword==null){

            request.setAttribute("msg","重复密码不能为空");
            return "redirect:go_myPetHouse.html?uid="+uid;
        }
        if (!newpassword.equals(repassword)){

            request.setAttribute("msg","两次密码不一致");
            return "redirect:go_myPetHouse.html?uid="+uid;
        }
        newpassword = MD5.toMD5(newpassword+ UserContants.SALT_VALUE);

        UserTO userTO=new UserTO();
        userTO.setUserId(uid);
        userTO.setUserPassword(newpassword);
        myUserService.updateUserPassword(userTO);
        String url = myUserService.getUserImgByUid(uid);
        model.addAttribute("url",url);
        return "login";
    }

    @RequestMapping("upload.html")
    @ResponseBody
    public Map upload1(@RequestParam(name = "file") MultipartFile file1,Integer uid) {
        try {
            String fileName = file1.getOriginalFilename();
            String extName = fileName.substring(fileName.lastIndexOf("."));
            String newName = System.currentTimeMillis() + extName;

            FileUtils.copyInputStreamToFile(file1.getInputStream(),
                    new File("D:/petimages/" + newName));
            //return "{\"error\":0,\"url\":\"http://localhost:8080/pet/image/"+ newName + "\"}";
            String url=newName;
            myUserService.addMyImg(url,uid);
            Map<String,Object> imgMap=new HashMap<>();
            imgMap.put("url",url);
            Integer imgCount=myUserService.getMyImgCount();
            imgMap.put("imgCount",imgCount);
            return imgMap;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }catch (Exception ex){
            return null;
        }
    }
}
