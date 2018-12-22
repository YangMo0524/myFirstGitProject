package com.ssm.pet.controller;

import com.ssm.pet.pojo.UserTO;
import com.ssm.pet.service.UserService;
import com.ssm.pet.util.MD5;
import com.ssm.pet.util.UserContants;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("user.html")
public class UserController {
    @Value("${FILE_URL}")
    private String FILE_URL;

    @Autowired
    private UserService userService;

    @RequestMapping(params = "act=iconUpload")
    @ResponseBody
    public String upload1(@RequestParam(name = "icon", required = false) MultipartFile file1) {
        try {
            String fileName = file1.getOriginalFilename();
            String extName = fileName.substring(fileName.lastIndexOf("."));
            String newName = System.currentTimeMillis() + extName;

            FileUtils.copyInputStreamToFile(file1.getInputStream(),
                    new File(FILE_URL + newName));
            return "{\"error\":0,\"url\":\"http://localhost:8080/pet/image/" + newName + "\"}";
        } catch (IOException e) {
            e.printStackTrace();
            return "{\"error\":1,\"url\":\"\"}";
        }
    }

    @RequestMapping(params = "act=register")
    public String register(UserTO user, Model model) {
        //1.判断是否非空
        if (StringUtils.isEmpty(user.getUserName()) || StringUtils.isEmpty(user.getUserPassword())) {
            return "forward:register.html";
        }
        //2.查询用户名是否已经存在
        UserTO userTO = userService.getUserByName(user);
        if (userTO != null) {
            return "forward:register.html";
        }
        //3.开始注册
        user.setUserPassword(MD5.toMD5(user.getUserPassword() + UserContants.SALT_VALUE));
        userService.register(user);
        return "forward:login.html";
    }

    @RequestMapping(params = "act=login")
    public String login(UserTO user, Model model, HttpSession session) {
        //1.非空验证
        if (StringUtils.isEmpty(user.getUserName()) || StringUtils.isEmpty(user.getUserPassword())) {
            return "forward:login.html";
        }
        //2.开始登录
        UserTO returnUser = userService.login(user);
        if (returnUser == null) {
            model.addAttribute("message", "用户名不存在");
            model.addAttribute("userName", user.getUserName());
            return "forward:login.html";
        } else {
            if (!(MD5.toMD5(user.getUserPassword() + UserContants.SALT_VALUE)).equals(returnUser.getUserPassword())) {
                model.addAttribute("message", "用户名或者密码错误");
                model.addAttribute("userName", user.getUserName());
                return "forward:login.html";
            }
            session.setAttribute(UserContants.USER_SESSION, returnUser);
        }
        return "redirect:index.html";
    }
}
