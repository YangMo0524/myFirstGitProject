package com.ssm.pet.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ArtcleTO {
    private Integer artcleId;//文章ID
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date artcleReleaseDate;//文章发布时间
    private String artcleTitle;//文章题目
    private String artcleContent;//文章内容
    private String artcleSource;//文章来源
    private String artcleEditor;//文章编辑是谁？
    private Integer artcleReadNum;//文章浏览量
    private LabelTO label;//文章属于哪个专题
    private String cover;//文章封面
    private String review;

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }
    ///////////////////////////////////////////////////

    public ArtcleTO(String cover,Integer artcleId, Date artcleReleaseDate, String artcleTitle, String artcleContent, String artcleSource, String artcleEditor, Integer artcleReadNum, LabelTO label) {
        this.artcleId = artcleId;
        this.artcleReleaseDate = artcleReleaseDate;
        this.artcleTitle = artcleTitle;
        this.artcleContent = artcleContent;
        this.artcleSource = artcleSource;
        this.artcleEditor = artcleEditor;
        this.artcleReadNum = artcleReadNum;
        this.label = label;
        this.cover=cover;
    }

    public ArtcleTO() {
    }
    ////////////////////////////////////////////////////////


    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public Integer getArtcleId() {
        return artcleId;
    }

    public void setArtcleId(Integer artcleId) {
        this.artcleId = artcleId;
    }

    public Date getArtcleReleaseDate() {
        return artcleReleaseDate;
    }

    public void setArtcleReleaseDate(Date artcleReleaseDate) {
        this.artcleReleaseDate = artcleReleaseDate;
    }

    public String getArtcleTitle() {
        return artcleTitle;
    }

    public void setArtcleTitle(String artcleTitle) {
        this.artcleTitle = artcleTitle;
    }

    public String getArtcleContent() {
        return artcleContent;
    }

    public void setArtcleContent(String artcleContent) {
        this.artcleContent = artcleContent;
    }

    public String getArtcleSource() {
        return artcleSource;
    }

    public void setArtcleSource(String artcleSource) {
        this.artcleSource = artcleSource;
    }

    public String getArtcleEditor() {
        return artcleEditor;
    }

    public void setArtcleEditor(String artcleEditor) {
        this.artcleEditor = artcleEditor;
    }

    public Integer getArtcleReadNum() {
        return artcleReadNum;
    }

    public void setArtcleReadNum(Integer artcleReadNum) {
        this.artcleReadNum = artcleReadNum;
    }


    public LabelTO getLabel() {
        return label;
    }

    public void setLabel(LabelTO label) {
        this.label = label;
    }
}
