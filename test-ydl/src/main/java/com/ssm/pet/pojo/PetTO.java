package com.ssm.pet.pojo;

public class PetTO {
    private Integer petId;//宠物Id
    private String petName;//宠物名称
    private String petDiscription;//宠物描述
    private String petImg;//宠物描述图片路径
    private Integer petCategoryId;//宠物类别名称

    @Override
    public String toString() {
        return "PetTO{" +
                "petId=" + petId +
                ", petName='" + petName + '\'' +
                ", petDiscription='" + petDiscription + '\'' +
                ", petImg='" + petImg + '\'' +
                ", petCategoryId=" + petCategoryId +
                '}';
    }

    public Integer getPetCategoryId() {
        return petCategoryId;
    }

    public void setPetCategoryId(Integer petCategoryId) {
        this.petCategoryId = petCategoryId;
    }
    ///////////////////////////

    public PetTO(Integer petId, String petName, String petDiscription, String petImg) {
        this.petId = petId;
        this.petName = petName;
        this.petDiscription = petDiscription;
        this.petImg = petImg;
    }

    public PetTO() {
    }
    ////////////////////////////////

    public Integer getPetId() {
        return petId;
    }

    public void setPetId(Integer petId) {
        this.petId = petId;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getPetDiscription() {
        return petDiscription;
    }

    public void setPetDiscription(String petDiscription) {
        this.petDiscription = petDiscription;
    }

    public String getPetImg() {
        return petImg;
    }

    public void setPetImg(String petImg) {
        this.petImg = petImg;
    }
}
