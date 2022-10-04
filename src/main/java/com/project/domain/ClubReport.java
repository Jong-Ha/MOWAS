package com.project.domain;

import java.sql.Date;

public class ClubReport {
    private int clubReportNum;
    private int clubNum;
    private String reportId;
    private String adminId;
    private char crBasis;
    private Date reportDate;
    private String reportText;
    private Date processDate;
    private String reportResult;
    private char rereportApplyCheck;
    private Date rrportApplyDate;
    private String rereportText;
    private String rereportResult;

    public int getClubReportNum() {
        return clubReportNum;
    }

    public void setClubReportNum(int clubReportNum) {
        this.clubReportNum = clubReportNum;
    }

    public int getClubNum() {
        return clubNum;
    }

    public void setClubNum(int clubNum) {
        this.clubNum = clubNum;
    }

    public String getReportId() {
        return reportId;
    }

    public void setReportId(String reportId) {
        this.reportId = reportId;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public char getCrBasis() {
        return crBasis;
    }

    public void setCrBasis(char crBasis) {
        this.crBasis = crBasis;
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

    public Date getProcessDate() {
        return processDate;
    }

    public void setProcessDate(Date processDate) {
        this.processDate = processDate;
    }

    public String getReportResult() {
        return reportResult;
    }

    public void setReportResult(String reportResult) {
        this.reportResult = reportResult;
    }

    public char getRereportApplyCheck() {
        return rereportApplyCheck;
    }

    public void setRereportApplyCheck(char rereportApplyCheck) {
        this.rereportApplyCheck = rereportApplyCheck;
    }

    public Date getRrportApplyDate() {
        return rrportApplyDate;
    }

    public void setRrportApplyDate(Date rrportApplyDate) {
        this.rrportApplyDate = rrportApplyDate;
    }

    public String getRereportText() {
        return rereportText;
    }

    public void setRereportText(String rereportText) {
        this.rereportText = rereportText;
    }

    public String getRereportResult() {
        return rereportResult;
    }

    public void setRereportResult(String rereportResult) {
        this.rereportResult = rereportResult;
    }

    @Override
    public String toString() {
        return "ClubReport{" +
                "clubReportNum=" + clubReportNum +
                ", clubNum=" + clubNum +
                ", reportId='" + reportId + '\'' +
                ", adminId='" + adminId + '\'' +
                ", crBasis=" + crBasis +
                ", reportDate=" + reportDate +
                ", reportText='" + reportText + '\'' +
                ", processDate=" + processDate +
                ", reportResult='" + reportResult + '\'' +
                ", rereportApplyCheck=" + rereportApplyCheck +
                ", rrportApplyDate=" + rrportApplyDate +
                ", rereportText='" + rereportText + '\'' +
                ", rereportResult='" + rereportResult + '\'' +
                '}';
    }
}
