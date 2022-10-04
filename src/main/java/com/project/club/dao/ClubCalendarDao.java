package com.project.club.dao;

import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;

public interface ClubCalendarDao {
   public void addCalender(ClubCalendar calender);

   public String getCalender(int clubNum);

    void addCalenderReview(ClubCalendarReview calendeReview);
}
