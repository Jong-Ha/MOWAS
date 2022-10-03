package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class ClubCalendarReview {
    private int clubCalenderReviewNum;
    private int clubCalenderNum;
    private int clubNum;
    private User userId;
    private String reviewRange;
    private String reviewTitle;
    private String reviewText;
    private Date regDate;
    private int viewCount;
    private int likeConunt;
    private Date updateDate;
    private int boardCategory;
}
