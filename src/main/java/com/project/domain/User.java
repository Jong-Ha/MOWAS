package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString

public class User {
    private String userId;
    private String interList;

    private String masterCheck;
    private String userStatus;
    private String password;
    private String userName;
    private String rrd;
    private String gender;
    private String email;
    private String phone;
    private String villCode;
    private String userImage;
    private String lcd;
    private String loginCheck;
    private String psd;
    private String ped;
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

    public String getMasterCheck() {
        return masterCheck;
    }

    public void setMasterCheck(String masterCheck) {
        this.masterCheck = masterCheck;
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

    public String getRrd() {
        return rrd;
    }

    public void setRrd(String rrd) {
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
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

    public String getLcd() {
        return lcd;
    }

    public void setLcd(String lcd) {
        this.lcd = lcd;
    }

    public String getLoginCheck() {
        return loginCheck;
    }

    public void setLoginCheck(String loginCheck) {
        this.loginCheck = loginCheck;
    }

    public String getPsd() {
        return psd;
    }

    public void setPsd(String psd) {
        this.psd = psd;
    }

    public String getPed() {
        return ped;
    }

    public void setPed(String ped) {
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
