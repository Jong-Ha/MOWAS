package com.project.club.service;

import com.project.club.dao.ClubCalendarDao;
import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("clubCalenderServiceImpl")
public class ClubCalendarServiceImpl implements ClubCalendarService {

    @Autowired
    @Qualifier("clubCalenderDaoImpl")
    private ClubCalendarDao clubCalendarDao;

    @Override
    public void addCalender(ClubCalendar calender) {
        clubCalendarDao.addCalender(calender);
    }

    @Override
    public String getCalender(int clubNum) {
        return clubCalendarDao.getCalender(clubNum);
    }

    @Override
    public void addCalenderReview(ClubCalendarReview calenderReview) {
        clubCalendarDao.addCalenderReview(calenderReview);
    }
    @Override
    public void updateCalenderReview(ClubCalendarReview calenderReview) {
        clubCalendarDao.updateCalenderReview(calenderReview);
    }
    @Override
    public void addCalenderReviewShort(ClubCalendarReview calenderReview) {
        clubCalendarDao.addCalenderReviewShort(calenderReview);
    }

    @Override
    public void updateCalenderReviewShort(ClubCalendarReview calenderReview) {
        clubCalendarDao.updateCalenderReviewShort(calenderReview);
    }


    @Override
    public void deleteCalenderReview(int calenderNum) {
        clubCalendarDao.deleteCalenderReview(calenderNum);
    }

    @Override
    public Map<String, Object> listCalenderReview(int boardCategory) {
        List<ClubCalendarReview> list =  clubCalendarDao.listCalenderReview(boardCategory);

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("list", list);

        return map;
    }

    @Override
    public ClubCalendarReview getCalenderReview(int clubCalenderReviewNum) {
        return clubCalendarDao.getCalenderReview(clubCalenderReviewNum);
    }

}
