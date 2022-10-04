package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class CalendarCluber {
    public CalendarCluber() {
    }

    private int clubCalendarApplyNum;
    private int clubCalendarNum;
    private User user;
    private String applyStatus;
    private Date applyDate;
}
