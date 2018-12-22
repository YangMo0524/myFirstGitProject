package com.ssm.pet.service.serviceimpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.pet.dao.ArtcleDAO;
import com.ssm.pet.pojo.ArtcleTO;
import com.ssm.pet.service.ArtcleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ArtcleServiceImpl implements ArtcleService {
    @Autowired
    private ArtcleDAO artcleDAO;

    @Override
    public PageInfo<ArtcleTO> getArtcleByDate(Integer pageNum,Integer lableId) {
        PageHelper.startPage(pageNum,6);
        return new PageInfo<ArtcleTO>(artcleDAO.getArtcleByDate(lableId));
    }

    @Override
    public List<ArtcleTO> getArtcleByClick(Integer lableId) {
        System.out.println(lableId);
        return artcleDAO.getArtcleByClick(lableId);
    }

    @Override
    public List<ArtcleTO> getAllArtcleByClick() {
        return artcleDAO.getAllArtcleByClick();
    }

    @Override
    public ArtcleTO getArtcleById(Integer articleId) {
        artcleDAO.updateReadNum(articleId);
        return artcleDAO.getArtcleById(articleId);
    }

    @Override
    public List<ArtcleTO> ArticleByDateForNextArt(Integer label) {
        return artcleDAO.ByDateForNextArt(label);
    }

    @Override
    public ArtcleTO getPreArt(Map<String, Object> param) {
        ArtcleTO preart = artcleDAO.getPreArt(param);
        return preart;
    }

    @Override
    public void addOneArtcle(ArtcleTO artcle,Integer userId) {
        //1.插入一篇文章
        artcleDAO.insertOneArtcle(artcle);
        //2.插入一条文章作者映射
        Map<String,Integer> map = new HashMap<>();
        map.put("userId",userId);//参数封装
        map.put("artcleId",artcle.getArtcleId());//参数封装
        artcleDAO.insertOneArtcleUser(map);//插入
    }

}
