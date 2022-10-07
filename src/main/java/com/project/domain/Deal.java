package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class Deal {
    private User user;
    private int dealBoardNum;
    private int boardCategory;
    private int dealStatus;
    private String dealTitle;
    private String dealText;
    private Date dealRegDate;
    private String productName;
    private int price;
    private String tag;
    private int viewCount;
    private String villCode;
    private String dealId;
    private int dealModeCheck;
    private int chatNum;
    private String review;
    private int reviewPt;
    private Date dealEndDate;
    private Date dealDate;
    private String dealLocation;
    List<File> files;

}
