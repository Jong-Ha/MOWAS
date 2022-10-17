package com.project.club.dao;

import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import com.project.domain.File;

import java.util.List;
import java.util.Map;

public interface ClubCalendarDao {
    void addCalender(ClubCalendar calender);

    ClubCalendar getCalender(int clubCalenderNum);

    void addCalenderReview(ClubCalendarReview calenderReview);

    void updateCalenderReview(ClubCalendarReview calenderReview);

    void deleteCalenderReview(int calenderNum);

    List<ClubCalendarReview> listCalenderReview(int boardCategory);

    ClubCalendarReview getCalenderReview(int clubCalenderReviewNum);

    List<ClubCalendar> getListCalender(ClubCalendar calender);

    void addFileUpload(Map<String, String> map);

    List<File> getListFile(int clubCalenderReviewNum, int boardCategory);
}
