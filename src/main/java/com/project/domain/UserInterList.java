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
