package com.ssm.pet.dao;

import com.ssm.pet.pojo.ArtcleTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ArtcleDAO {

    List<ArtcleTO> getArtcleByDate(@Param("labelId") Integer labelId);

    List<ArtcleTO> getArtcleByClick(Integer lableId);

    List<ArtcleTO> getAllArtcleByClick();

    ArtcleTO getArtcleById(Integer articleId);

    void updateReadNum(Integer articleId);

    List<ArtcleTO> ByDateForNextArt(Integer label);

    ArtcleTO getPreArt(Map<String, Object> param);

    /**
     * 插入一篇文章
     * @param artcle
     */
    void insertOneArtcle(ArtcleTO artcle);

    /**
     * 插入一条用户文章映射
     * @param map
     */
    void insertOneArtcleUser(Map<String,Integer> map);
}
