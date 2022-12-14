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

    private String findPwdUserId;

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

    private String psd;
    private String ped;
    private int ppt;
    private int reviewPt;

    private String loginType;

    public void loginStatusChk(){
        switch (Integer.parseInt(this.userStatus)){
            case 1:
                this.userStatus = "활동";
                break;
            case 2:
                this.userStatus = "활동정지";
                break;
            case 3:
                this.userStatus = "탈퇴";
                break;
            case 4:
                this.userStatus = "강퇴";
                break;
        }
    }

    public void loginTypeChk(){
        switch (Integer.parseInt(this.loginType)){
            case 1:
                this.loginType = "기본 회원가입";
                break;
            case 2:
                this.loginType = "카카오 로그인";
                break;
            case 3:
                this.loginType = "네이버 로그인";
                break;
        }
    }

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



    public String getPsd() {
        return psd;
    }

    public void setPsd(String psd) {
        this.psd = psd.split(" ")[0];
    }

    public String getPed() {
        return ped;
    }

    public void setPed(String ped) {
        this.ped = ped.split(" ")[0];
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

    public String getInterList() {
        return interList;
    }

    public void setInterList(String interList) {
        this.interList = interList;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }

    public String getFindPwdUserId() {
        return findPwdUserId;
    }

    public void setFindPwdUserId(String findPwdUserId) {
        this.findPwdUserId = findPwdUserId;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", findPwdUserId='" + findPwdUserId + '\'' +
                ", interList='" + interList + '\'' +
                ", masterCheck='" + masterCheck + '\'' +
                ", userStatus='" + userStatus + '\'' +
                ", password='" + password + '\'' +
                ", userName='" + userName + '\'' +
                ", rrd='" + rrd + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", villCode='" + villCode + '\'' +
                ", userImage='" + userImage + '\'' +
                ", psd='" + psd + '\'' +
                ", ped='" + ped + '\'' +
                ", ppt=" + ppt +
                ", reviewPt=" + reviewPt +
                ", loginType='" + loginType + '\'' +
                '}';
    }
}
