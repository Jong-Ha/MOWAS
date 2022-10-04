package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class Club {

    public Club(){
    }

    private int clubNum;
    private String clubName;
    private String clubMasterId;
    private String clubText;
    private int currentCluber;
    private String interList;
    private String villCode;
    private Date clubCreateDate;
    private int clubChatNum;
    private String clubImage;
    private String gatherCheck;
    private String tag;
    private String clubDeleteCheck;
    private String likeCheck;

}
