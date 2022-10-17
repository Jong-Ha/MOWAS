package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class ClubCalendarReview {
    private int clubCalenderReviewNum;
    private int clubCalenderNum;
    private int clubNum;
    private String userId;
    private String reviewRange;
    private String reviewTitle;
    private String reviewText;
    private Date regDate;
    private int viewCount;
    private int likeConunt;
    private Date updateDate;
    private int boardCategory;
    private Date clubDate;
    //파일을 담을 list파일
    private List<File> file;
}
