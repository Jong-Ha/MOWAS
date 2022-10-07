package com.project.club.service;

import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;

import java.util.Map;

public interface ClubCalendarService {
    public void addCalender(ClubCalendar calender);

    public String getCalender(int clubNum);

    void addCalenderReview(ClubCalendarReview calenderReview);
    void addCalenderReviewShort(ClubCalendarReview calenderReview);

    void updateCalenderReview(ClubCalendarReview calenderReview);

    void deleteCalenderReview(int calenderNum);

    Map<String, Object> listCalenderReview(int boardCategory);

    ClubCalendarReview getCalenderReview(int clubCalenderReviewNum);
}
