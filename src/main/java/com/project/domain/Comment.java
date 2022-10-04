package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class Comment {
    private int commentNum;
    private String userId;
    private int clubNum;
    private int boardNum;
    private String boardCategory;
    private String commentCheck;
    private String commentText;
    private Date regDate;

}
