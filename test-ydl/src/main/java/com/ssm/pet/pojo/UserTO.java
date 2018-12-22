package com.ssm.pet.pojo;

public class UserTO {
    private Integer userId;//用户Id
    private String userName;//用户名
    private String userPassword;//用户密码
    //以下为新增属性
    private String userIcon;//用户头像
    private PetTO userFavoritePet;//用户最喜欢的宠物
    ///////////////////////////////////////////

    public UserTO(Integer userId, String userName, String userPassword, String userIcon, PetTO userFavoritePet) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userIcon = userIcon;
        this.userFavoritePet = userFavoritePet;
    }

    public UserTO(Integer userId, String userName, String userPassword) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
    }

    public UserTO() {
    }
    //////////////////////////////////////////////////

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserIcon() {
        return userIcon;
    }

    public void setUserIcon(String userIcon) {
        this.userIcon = userIcon;
    }

    public PetTO getUserFavoritePet() {
        return userFavoritePet;
    }

    public void setUserFavoritePet(PetTO userFavoritePet) {
        this.userFavoritePet = userFavoritePet;
    }
}
