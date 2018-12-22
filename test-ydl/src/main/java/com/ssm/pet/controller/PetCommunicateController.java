package com.ssm.pet.controller;

import com.github.pagehelper.PageInfo;
import com.ssm.pet.pojo.PetCommunicateTO;
import com.ssm.pet.pojo.ReplyTO;
import com.ssm.pet.pojo.UserTO;
import com.ssm.pet.service.PetCommunicateService;
import com.ssm.pet.util.UserContants;
import com.ssm.pet.util.UserPetImgContants;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/communicate.html")
public class PetCommunicateController {
    @Autowired
    private PetCommunicateService petCommunicateService;

    @RequestMapping(params = "act=communite")
    public String communite(String info, String title, Integer pageNum, HttpSession session, HttpServletRequest request) {
       Integer count=petCommunicateService.getCount();
       request.setAttribute("count",count);
        UserTO userTO = (UserTO) session.getAttribute(UserContants.USER_SESSION);
        if (pageNum == null) {
            pageNum = 1;
        }
        if (info != null) {
            System.out.println("info" + info);
        }
        PageInfo<PetCommunicateTO> pageInfo = petCommunicateService.getPetCommunicate(info, title, pageNum);
        request.setAttribute("pageInfo", pageInfo);
        List<PetCommunicateTO> hot=petCommunicateService.getHot();
        request.setAttribute("hot",hot);
        request.setAttribute("html",22);
        return "communicate";
    }

    @RequestMapping(params = "act=add")
    public String add(String info, String title,HttpServletRequest request) {
        Integer count=petCommunicateService.getCount();
        request.setAttribute("count",count);
        PetCommunicateTO petCommunicateTO = new PetCommunicateTO();
        petCommunicateTO.setInfo(info);
        petCommunicateTO.setTitle(title);
        petCommunicateService.addPetCommunicate(petCommunicateTO);
        List<PetCommunicateTO> hot=petCommunicateService.getHot();
        request.setAttribute("hot",hot);
        return "redirect:communicate.html?act=communite";
    }
    //ajax文件上传
    @RequestMapping(params = "act=upload3.html")
    @ResponseBody
    public String upload(@RequestParam(name="file")MultipartFile file1,HttpServletRequest request){
        try {
            String fileName=file1.getOriginalFilename();
            String extName=fileName.substring(fileName.lastIndexOf("."));
            String newName=System.currentTimeMillis()+extName;
            FileUtils.copyInputStreamToFile(file1.getInputStream(),
                    new File("D:/petBlog/"+newName));
            return "{\"error\":0,\"url\":\"http://localhost:8080/petblog/image/"+newName+"\"}";
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"error\":1,\"url\":\"\"}";
        }

    }

    @RequestMapping(params = "act=edit")
    public String edit() {
        return "editor";
    }
    @RequestMapping(params = "act=new")
    public String newComm(HttpServletRequest request,Integer pageNum) {
        Integer count=petCommunicateService.getCount();
        request.setAttribute("count",count);
        if (pageNum == null) {
            pageNum = 1;
        }
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        String createDate=simpleDateFormat.format(date);
        System.out.println("======="+createDate);
        PageInfo<PetCommunicateTO> pageInfo=petCommunicateService.getPetCommunicate(createDate,pageNum);
       request.setAttribute("pageInfo",pageInfo);
       List<PetCommunicateTO> hot=petCommunicateService.getHot();
       request.setAttribute("hot",hot);
        return "communicate";
    }
    @RequestMapping(params = "act=images")
    public String getImages(HttpServletRequest request) {
        Integer count=petCommunicateService.getCount();
        request.setAttribute("count",count);
        List<PetCommunicateTO> list=petCommunicateService.getImages();
        request.setAttribute("list",list);
        List<PetCommunicateTO> hot=petCommunicateService.getHot();
        request.setAttribute("hot",hot);
        return "images";
    }
    @RequestMapping(params = "act=introduce")
    public String introduce(HttpServletRequest request) {
        Integer count=petCommunicateService.getCount();
        request.setAttribute("count",count);
        List<PetCommunicateTO> hot=petCommunicateService.getHot();
        request.setAttribute("hot",hot);
        return "introduce";
    }

    @RequestMapping(params = "act=info")
    public String info(HttpServletRequest request,Integer id) {
        Integer count=petCommunicateService.getCount();
        request.setAttribute("count",count);
        PetCommunicateTO petCommunicateTO=petCommunicateService.getInfo(id);
        List<ReplyTO> replyTO=petCommunicateService.getReply(id);
        request.setAttribute("id",id);
        request.setAttribute("info",petCommunicateTO);
        request.setAttribute("replyTOs",replyTO);
        List<PetCommunicateTO> hot=petCommunicateService.getHot();
        request.setAttribute("hot",hot);
        return "TitleInfo";
    }
    @RequestMapping(params = "act=addReply")
    public String addReply(String reply,Integer id,HttpServletRequest request) {
        Integer count=petCommunicateService.getCount();
        request.setAttribute("count",count);
        System.out.println(id);
        ReplyTO replyTO=new ReplyTO();
        replyTO.setReply(reply);
        replyTO.setReplyId(id);
        petCommunicateService.addReply(replyTO);
        petCommunicateService.updateReply(id);
        List<PetCommunicateTO> hot=petCommunicateService.getHot();
        request.setAttribute("hot",hot);
        return "redirect:communicate.html?act=info&id="+id;
    }

}