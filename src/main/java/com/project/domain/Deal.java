package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class Deal {
    private int dealBoardNum;
    private int dealStatus;
    private String userId;
    private String dealTitle;
    private String dealText;
    private Date dealRegDate;
    private String productCame;
    private int price;
    private String tag;
    private int viewCount;
    private String villCode;
    private String dealId;
    private int dealModeCheck;
    private int chatNum;
    private String review;
    private int reviewPt;
    private Date dealEndAate;
    private Date dealDate;
    private String dealLocation;
}
