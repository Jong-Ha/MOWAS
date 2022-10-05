package com.project.domain;

import java.sql.Date;

public class CommunityReport {
    private int reportNo;
    private int boardNo;
    private String boardCategory;
    private String reportId;
    private String reportedId;
    private  String adminId;
    private char reportBasis;
    private Date reportDate;
    private String reportText;
    private int ppt;
    private Date pptDate;
    private String processResult;

    public int getReportNo() {
        return reportNo;
    }

    public void setReportNo(int reportNo) {
        this.reportNo = reportNo;
    }

    public int getBoardNo() {
        return boardNo;
    }

    public void setBoardNo(int boardNo) {
        this.boardNo = boardNo;
    }

    public String getBoardCategory() {
        return boardCategory;
    }

    public void setBoardCategory(String boardCategory) {
        this.boardCategory = boardCategory;
    }

    public String getReportId() {
        return reportId;
    }

    public void setReportId(String reportId) {
        this.reportId = reportId;
    }

    public String getReportedId() {
        return reportedId;
    }

    public void setReportedId(String reportedId) {
        this.reportedId = reportedId;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public char getReportBasis() {
        return reportBasis;
    }

    public void setReportBasis(char reportBasis) {
        this.reportBasis = reportBasis;
    }

    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    public String getReportText() {
        return reportText;
    }

    public void setReportText(String reportText) {
        this.reportText = reportText;
    }

    public int getPpt() {
        return ppt;
    }

    public void setPpt(int ppt) {
        this.ppt = ppt;
    }

    public Date getPptDate() {
        return pptDate;
    }

    public void setPptDate(Date pptDate) {
        this.pptDate = pptDate;
    }

    public String getProcessResult() {
        return processResult;
    }

    public void setProcessResult(String processResult) {
        this.processResult = processResult;
    }

    @Override
    public String toString() {
        return "CommunityReport{" +
                "reportNo=" + reportNo +
                ", boardNo=" + boardNo +
                ", boardCategory='" + boardCategory + '\'' +
                ", reportId='" + reportId + '\'' +
                ", reportedId='" + reportedId + '\'' +
                ", adminId='" + adminId + '\'' +
                ", reportBasis=" + reportBasis +
                ", reportDate=" + reportDate +
                ", reportText='" + reportText + '\'' +
                ", ppt=" + ppt +
                ", pptDate=" + pptDate +
                ", processResult='" + processResult + '\'' +
                '}';
    }
}

