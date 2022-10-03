package com.project.club.dao;

import com.project.domain.ClubCalendar;

public interface ClubCalendarDao {
   public void addCalender(ClubCalendar calender);

   public String getCalender(int clubNum);
}
