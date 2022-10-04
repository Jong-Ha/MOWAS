package com.project.domain;

import java.util.Date;

public class User {
    private String userId;
    private String masterCheck;
    private String userStatus;
    private String password;
    private String userName;
    private int rrd;
    private String gender;
    private String email;
    private int phone;
    private String villCode;
    private String userImage;
    private Date lcd;
    private String loginCheck;
    private Date psd;
    private Date ped;
    private int ppt;
    private int reviewPt;

    public User() {
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getRrd() {
        return rrd;
    }

    public void setRrd(int rrd) {
        this.rrd = rrd;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getVillCode() {
        return villCode;
    }

    public void setVillCode(String villCode) {
        this.villCode = villCode;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public Date getLcd() {
        return lcd;
    }

    public void setLcd(Date lcd) {
        this.lcd = lcd;
    }

    public String getLoginCheck() {
        return loginCheck;
    }

    public void setLoginCheck(String loginCheck) {
        this.loginCheck = loginCheck;
    }

    public Date getPsd() {
        return psd;
    }

    public void setPsd(Date psd) {
        this.psd = psd;
    }

    public Date getPed() {
        return ped;
    }

    public void setPed(Date ped) {
        this.ped = ped;
    }

    public int getPpt() {
        return ppt;
    }

    public void setPpt(int ppt) {
        this.ppt = ppt;
    }

    public int getReviewPt() {
        return reviewPt;
    }

    public void setReviewPt(int reviewPt) {
        this.reviewPt = reviewPt;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", masterCheck='" + masterCheck + '\'' +
                ", userStatus='" + userStatus + '\'' +
                ", password='" + password + '\'' +
                ", userName='" + userName + '\'' +
                ", rrd=" + rrd +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", phone=" + phone +
                ", villCode='" + villCode + '\'' +
                ", userImage='" + userImage + '\'' +
                ", lcd=" + lcd +
                ", loginCheck='" + loginCheck + '\'' +
                ", psd=" + psd +
                ", ped=" + ped +
                ", ppt=" + ppt +
                ", reviewPt=" + reviewPt +
                '}';
    }
}
