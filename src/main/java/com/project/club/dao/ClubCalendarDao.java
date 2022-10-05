package com.project.club.dao;

import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;

import java.util.List;
import java.util.Map;

public interface ClubCalendarDao {
   public void addCalender(ClubCalendar calender);

   public String getCalender(int clubNum);

    void addCalenderReview(ClubCalendarReview calenderReview);

    void addCalenderReviewShort(ClubCalendarReview calenderReview);

    void updateCalenderReview(ClubCalendarReview calenderReview);

    void updateCalenderReviewShort(ClubCalendarReview calenderReview);

    void deleteCalenderReview(int calenderNum);

    List<ClubCalendarReview> listCalenderReview(int boardCategory);

    ClubCalendarReview getCalenderReview(int clubCalenderReviewNum);
}
