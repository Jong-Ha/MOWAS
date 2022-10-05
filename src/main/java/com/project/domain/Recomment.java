package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@ToString
@Setter
public class Recomment {
    private int recommentNum;
    private int commentNum;
    private String userId;
    private String boardCategory;
    private String recommentText;
    private Date regDate;

}
