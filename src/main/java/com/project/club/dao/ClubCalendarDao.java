package com.project.club.dao;

import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import com.project.domain.Deal;
import com.project.domain.File;

import java.util.List;
import java.util.Map;

public interface ClubCalendarDao {
    void addCalender(ClubCalendar calender);

    ClubCalendar getCalender(int clubCalenderNum);

    void addCalenderReview(ClubCalendarReview calenderReview);

    void updateCalenderReview(ClubCalendarReview calenderReview);

    void deleteCalenderReview(int calenderNum);

    List<ClubCalendarReview> listCalenderReview(Map<String, Object> map);

    ClubCalendarReview getCalenderReview(int clubCalenderReviewNum);

    List<ClubCalendar> getListCalender(ClubCalendar calender);

    void addFileUpload(Map<String, String> map);

    List<File> getListFile(int clubCalenderReviewNum, int boardCategory);

    void addDealCalender(Deal calender);

    List<ClubCalendar> getListCluberCalender(int calenderNum);

    void deleteFile(int boardNum);

    void updateClubCalender(ClubCalendar clubCalendar);

    void deleteClubCalender(int boardNum);

    void dealUpdateCalender(Deal deal);
}
