package com.project.club.dao;

import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;

import java.util.List;

public interface ClubCalendarDao {
    void addCalender(ClubCalendar calender);

    ClubCalendar getCalender(int clubCalenderNum);

    void addCalenderReview(ClubCalendarReview calenderReview);

    void updateCalenderReview(ClubCalendarReview calenderReview);

    void deleteCalenderReview(int calenderNum);

    List<ClubCalendarReview> listCalenderReview(int boardCategory);

    ClubCalendarReview getCalenderReview(int clubCalenderReviewNum);

    List<ClubCalendar> getListCalender(ClubCalendar calender);
}
