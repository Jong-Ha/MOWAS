package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class ClubReport {
    private int clubReportNo;
    private int clubNum;
    private Club club;
    private String reportId;
    private String adminId;
    private char crBasis;
    private Date reportDate;
    private String reportText;
    private Date processDate;
    private String reportResult;
    private char rereportApplyCheck;
    private Date rereportApplyDate;
    private String rereportText;
    private String rereportResult;
    List<File> files;
}
