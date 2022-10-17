package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class VilBoard {
    private int villBoardNum;
    //private User userId;
    private String userId;
    private String villCode;
    private String villTitle;
    private String villText;
    private String villTag;
    private Date regDate;
    private int viewCount;
    private int likeCount;
    private int boardCategory;
    private List<File> file;

}

