package com.ssm.pet.pojo;

public class PetCategoryTO {
    private Integer petCategoryId;//宠物分类ID
    private String petCategoryName;//宠物分类名称
    ////////////////////////////////////

    public PetCategoryTO(Integer petCategoryId, String petCategoryName) {
        this.petCategoryId = petCategoryId;
        this.petCategoryName = petCategoryName;
    }

    public PetCategoryTO() {
    }
    //////////////////////////////////////

    public Integer getPetCategoryId() {
        return petCategoryId;
    }

    public void setPetCategoryId(Integer petCategoryId) {
        this.petCategoryId = petCategoryId;
    }

    public String getPetCategoryName() {
        return petCategoryName;
    }

    public void setPetCategoryName(String petCategoryName) {
        this.petCategoryName = petCategoryName;
    }
}
