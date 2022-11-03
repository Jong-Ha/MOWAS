package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserInterList {
    private int userInterListNum;
    private String userId;
    private String interList;



    public UserInterList() {
    }

    public static void parseInterList(String interList){
        switch (Integer.parseInt(interList)){
            case 1:
                interList = "독서";
                break;
            case 2:
                interList = "자동차";
                break;
            case 3:
                interList = "반려동물";
                break;
            case 4:
                interList = "공예";
                break;
            case 5:
                interList = "스포츠";
                break;
            case 6:
                interList = "댄스";
                break;
            case 7:
                interList = "여행";
                break;
            case 8:
                interList = "사진";
                break;
            case 9:
                interList = "육아";
                break;
            case 10:
                interList = "공연";
                break;
            case 11:
                interList = "음악";
                break;
            case 12:
                interList = "게임";
                break;
            case 13:
                interList = "그외";
                break;
        }
    }

    public int getUserInterListNum() {
        return userInterListNum;
    }

    public void setUserInterListNum(int userInterListNum) {
        this.userInterListNum = userInterListNum;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getInterList() {
        return interList;
    }

    public void setInterList(String interList) {
        this.interList = interList;
    }


}
