package com.ssm.pet.pojo;

public class PetInfoTO {
    private Integer petInfoId;
    private String petInfoContent;
    private Integer feedingGrade;
    private String alias;
    private String origin;
    private String petShape;
    private Integer petId;

    public Integer getPetInfoId() {
        return petInfoId;
    }

    public void setPetInfoId(Integer petInfoId) {
        this.petInfoId = petInfoId;
    }

    public String getPetInfoContent() {
        return petInfoContent;
    }

    public void setPetInfoContent(String petInfoContent) {
        this.petInfoContent = petInfoContent;
    }

    public Integer getFeedingGrade() {
        return feedingGrade;
    }

    public void setFeedingGrade(Integer feedingGrade) {
        this.feedingGrade = feedingGrade;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getPetShape() {
        return petShape;
    }

    public void setPetShape(String petShape) {
        this.petShape = petShape;
    }

    public Integer getPetId() {
        return petId;
    }

    public void setPetId(Integer petId) {
        this.petId = petId;
    }
}
