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

    public void setInterList(String interList){
        switch (Integer.parseInt(interList)){
            case 1:
                this.interList = "독서";
                break;
            case 2:
                this.interList = "자동차";
                break;
            case 3:
                this.interList = "반려동물";
                break;
            case 4:
                this.interList = "공예";
                break;
            case 5:
                this.interList = "스포츠";
                break;
            case 6:
                this.interList = "댄스";
                break;
            case 7:
                this.interList = "여행";
                break;
            case 8:
                this.interList = "사진";
                break;
            case 9:
                this.interList = "육아";
                break;
            case 10:
                this.interList = "공연";
                break;
            case 11:
                this.interList = "음악";
                break;
            case 12:
                this.interList = "게임";
                break;
            case 13:
                this.interList = "그외";
                break;
        }
    }

}
