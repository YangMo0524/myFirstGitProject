package com.ssm.pet.controller;

import com.github.pagehelper.PageInfo;
import com.ssm.pet.pojo.ArtcleTO;
import com.ssm.pet.pojo.LabelTO;
import com.ssm.pet.pojo.UserTO;
import com.ssm.pet.util.UserContants;
import org.apache.commons.io.FileUtils;
import com.ssm.pet.service.ArtcleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Artcle.html")
public class ArtcleController {

    @Autowired
    private ArtcleService artcleService;

    @Value("${FILE_URL}")
    private String FILE_URL;

    @RequestMapping(params = "act=list")
    public String getArtcle(Integer lableId,HttpServletRequest request,Integer pageNum) {
        if (pageNum == null) pageNum = 1;

        PageInfo<ArtcleTO> newArtcles = artcleService.getArtcleByDate(pageNum, lableId);

        List<ArtcleTO> hotArtcles = artcleService.getArtcleByClick(lableId);//该类型最热
        ArtcleTO thislable =hotArtcles.get(0);
        List<ArtcleTO> hotAllArtcles = artcleService.getAllArtcleByClick();//全部文章最热
        ArtcleTO firstArtcle = hotAllArtcles.get(0);//

        request.setAttribute("html",lableId);
        request.setAttribute("thislable",thislable);
        request.setAttribute("newArtcles", newArtcles);
        request.setAttribute("hotArtcles", hotArtcles);
        request.setAttribute("AllArtcles", hotAllArtcles);
        request.setAttribute("firstArtcle", firstArtcle);
        return "artcleList";
    }


    @RequestMapping(params = "act=info")
    public String info(Integer thisart,Integer labeltag,Integer label,Integer articleId, HttpServletRequest request){
        ArtcleTO artcle = artcleService.getArtcleById(articleId);//该片文章

        List<ArtcleTO> artclesByDate = artcleService.ArticleByDateForNextArt(label);
        List<ArtcleTO> hotArtcles = artcleService.getArtcleByClick(label);//该类型最热
        List<ArtcleTO> hotAllArtcles = artcleService.getAllArtcleByClick();//全网最热
        ArtcleTO firstArtcle = hotAllArtcles.get(0);//最热第一


        request.setAttribute("article",artcle);
        request.setAttribute("hotArtcles", hotArtcles);
        request.setAttribute("AllArtcles",hotAllArtcles);
        request.setAttribute("firstArtcle",firstArtcle);

        thisart-=1;

        if (labeltag==1){//该类型最新
            request.setAttribute("labeltag",labeltag);
            if (thisart-1>-1){
                ArtcleTO preart  = artclesByDate.get(thisart-1);
                request.setAttribute("perarticle",preart);
                request.setAttribute("prethisart",thisart);
            }
            if (thisart+1<artclesByDate.size()){
                ArtcleTO nextart = artclesByDate.get(thisart+1);
                request.setAttribute("nextarticle",nextart);
                request.setAttribute("nextthisart",thisart+2);
            }
        }
        if (labeltag==2){//该类型最热
            request.setAttribute("labeltag",labeltag);
            if (thisart-1>-1){
                ArtcleTO preart  = hotArtcles.get(thisart-1);
                request.setAttribute("perarticle",preart);
                request.setAttribute("prethisart",thisart);

            }
            if (thisart+1<hotArtcles.size()){
                ArtcleTO nextart = hotArtcles.get(thisart+1);
                request.setAttribute("nextarticle",nextart);
                request.setAttribute("nextthisart",thisart+2);
            }
        }
        if (labeltag==3){//全网最热
            request.setAttribute("labeltag",labeltag);
            if (thisart-1>-1){
                ArtcleTO preart  = hotAllArtcles.get(thisart-1);
                request.setAttribute("perarticle",preart);
                request.setAttribute("prethisart",thisart);
            }
            if (thisart+1<hotAllArtcles.size()){

                ArtcleTO nextart = hotAllArtcles.get(thisart+1);
                request.setAttribute("nextarticle",nextart);
                request.setAttribute("nextthisart",thisart+2);
            }
        }

        return "arctle";

    }

    @ResponseBody
    @RequestMapping(params = "act=getprtart")
    public ArtcleTO getpreart(@RequestParam Integer artcleId,@RequestParam String artcleReleaseDate,@RequestParam Integer artcleReadNum){
        Map<String,Object> param = new HashMap<>();
        param.put("artcleId",artcleId);
        param.put("artcleReleaseDate",artcleReleaseDate);
        param.put("artcleReadNum",artcleReadNum);
        ArtcleTO preart = artcleService.getPreArt(param);
        return preart;
    }

    @RequestMapping(params = "act=coverUpload")
    @ResponseBody
    public String coverUpload(@RequestParam(name = "cover", required = false) MultipartFile file1) {
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
    @RequestMapping(params = "act=addArtcle")
    public String addArtcle(HttpServletRequest request, HttpServletResponse response,LabelTO label, ArtcleTO artcle, HttpSession session) {
        //PrintWriter writer = response.getWriter();

        //1.参数验证
        if (StringUtils.isEmpty(artcle.getArtcleTitle()) || StringUtils.isEmpty(artcle.getArtcleContent()) || StringUtils.isEmpty(artcle.getArtcleSource())) {
            return "forward:/addArtcle.html";
        }
        if (label.getLabelId() == null || (label.getLabelId() < 1 && label.getLabelId() > 7)) {
            return "forward:/addArtcle.html";
        }
        //2.参数封装
        UserTO user = (UserTO) session.getAttribute(UserContants.USER_SESSION);
        artcle.setArtcleEditor("用户");
        artcle.setArtcleSource("用户" + user.getUserName()+"投稿");
        artcle.setLabel(label);
        Integer userId = user.getUserId();
        //3.进行文章插入
        artcleService.addOneArtcle(artcle, userId);
        //writer.print("alert('投稿成功，待管理员审批，点击确定返回主页')");
        //4.跳转回首页
        return "redirect:index.html";
    }

}


