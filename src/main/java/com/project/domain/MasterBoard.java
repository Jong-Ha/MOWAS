package com.project.domain;

import java.sql.Date;

public class MasterBoard {
    private int masterBoardNo;
    private String adminId;
    private char mbCategory;
    private String mbTitle;
    private String mbText;
    private Date mbRegDate;

    public int getMasterBoardNo() {
        return masterBoardNo;
    }

    public void setMasterBoardNo(int masterBoardNo) {
        this.masterBoardNo = masterBoardNo;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public char getMbCategory() {
        return mbCategory;
    }

    public void setMbCategory(char mbCategory) {
        this.mbCategory = mbCategory;
    }

    public String getMbTitle() {
        return mbTitle;
    }

    public void setMbTitle(String mbTitle) {
        this.mbTitle = mbTitle;
    }

    public String getMbText() {
        return mbText;
    }

    public void setMbText(String mbText) {
        this.mbText = mbText;
    }

    public Date getMbRegDate() {
        return mbRegDate;
    }

    public void setMbRegDate(Date mbRegDate) {
        this.mbRegDate = mbRegDate;
    }

    @Override
    public String toString() {
        return "MasterBoard{" +
                "masterBoardNo=" + masterBoardNo +
                ", adminId='" + adminId + '\'' +
                ", mbCategory=" + mbCategory +
                ", mbTitle='" + mbTitle + '\'' +
                ", mbText='" + mbText + '\'' +
                ", mbRegDate=" + mbRegDate +
                '}';
    }
}
