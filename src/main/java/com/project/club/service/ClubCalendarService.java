package com.project.club.service;

import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import com.project.domain.Deal;

import java.util.List;
import java.util.Map;

public interface ClubCalendarService {
    public void addCalender(ClubCalendar calender);

    public ClubCalendar getCalender(int clubCalenderNum);

    void addCalenderReview(ClubCalendarReview calenderReview);

    void updateCalenderReview(ClubCalendarReview calenderReview);

    void deleteCalenderReview(int calenderNum);

    Map<String, Object> listCalenderReview(int boardCategory);

    ClubCalendarReview getCalenderReview(int clubCalenderReviewNum);

    List<Map<String, Object>> getListCalender(ClubCalendar calender);

    void addFileUpload(Map<String, String> map);

    void addDealCalender(Deal calender);

    List<Map<String, Object>> getListCluberCalender(int CalenderNum);

    void deleteFile(int boardNum);

    void updateClubCalender(ClubCalendar clubCalendar);

    void deleteClubCalender(int boardNum);

    void dealUpdateCalender(Deal deal);
}
