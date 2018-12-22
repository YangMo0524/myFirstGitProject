package com.ssm.pet.service;

import com.github.pagehelper.PageInfo;
import com.ssm.pet.pojo.ArtcleTO;

import java.util.List;
import java.util.Map;

public interface ArtcleService {

    PageInfo<ArtcleTO> getArtcleByDate(Integer pageNum, Integer lableId);

    List<ArtcleTO> getArtcleByClick(Integer lableId);

    List<ArtcleTO> getAllArtcleByClick();

    ArtcleTO getArtcleById(Integer articleId);

    List<ArtcleTO> ArticleByDateForNextArt(Integer label);

    ArtcleTO getPreArt(Map<String, Object> param);
    /**
     * 添加一篇文章
     * @param artcle
     */
    void addOneArtcle(ArtcleTO artcle,Integer userId);

}
