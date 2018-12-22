package com.ssm.pet.pojo;

public class UserPetImgTO {
    private Integer petImgId;//用户分享图片Id
    private String petImgUrl;//用户分享图片路径
    //////////////////////////////////////////

    public UserPetImgTO(Integer petImgId, String petImgUrl) {
        this.petImgId = petImgId;
        this.petImgUrl = petImgUrl;
    }

    public UserPetImgTO() {
    }
    ////////////////////////////////////////////

    public Integer getPetImgId() {
        return petImgId;
    }

    public void setPetImgId(Integer petImgId) {
        this.petImgId = petImgId;
    }

    public String getPetImgUrl() {
        return petImgUrl;
    }

    public void setPetImgUrl(String petImgUrl) {
        this.petImgUrl = petImgUrl;
    }
}
