package com.project.club.service;

import com.project.domain.ClubCalendar;

public interface ClubCalendarService {
    public void addCalender(ClubCalendar calender);

    public String getCalender(int clubNum);
}
