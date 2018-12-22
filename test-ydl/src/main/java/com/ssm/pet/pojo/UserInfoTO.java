package com.ssm.pet.pojo;

public class UserInfoTO {
    private Integer userId;
    private String userImg;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public UserInfoTO(Integer userId, String userImg) {

        this.userId = userId;
        this.userImg = userImg;
    }

    public UserInfoTO() {

    }
}
