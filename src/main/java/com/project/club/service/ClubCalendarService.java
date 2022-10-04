package com.project.club.service;

import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;

public interface ClubCalendarService {
    public void addCalender(ClubCalendar calender);

    public String getCalender(int clubNum);

    void addCalenderReview(ClubCalendarReview calendeReview);
}
