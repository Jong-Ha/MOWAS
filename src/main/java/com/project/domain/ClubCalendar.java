package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class ClubCalendar {
    private int clubCalenderNum;
    private int clubNum ;
    private Date regDate ;
    private String calenderTitle ;
    private String calenderText ;
    private String clubDate ;
    private String location ;
    private String noticeCheck ;
    private String noticeTime ;
    private String calendarApplyCheck ;
    private String applyAutoCheck ;
}
