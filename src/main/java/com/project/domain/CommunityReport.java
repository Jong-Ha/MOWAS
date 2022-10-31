package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class CommunityReport {
    private int reportNo;
    private int boardNo;
    private String boardCategory;
    private String reportId;
    private String reportedId;
    private String adminId;
    private String reportBasis;
    private Date reportDate;
    private String reportText;
    private int ppt;
    private Date pptDate;
    private String processResult;
    List<File> files;
}

