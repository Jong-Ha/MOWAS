package com.project.club.service;

import com.project.club.dao.ClubCalendarDao;
import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
    public ClubCalendar getCalender(int clubCalenderNum) {
        return clubCalendarDao.getCalender(clubCalenderNum);
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

    @Override
    public List<Map<String, Object>> getListCalender(ClubCalendar calender) {

        List<ClubCalendar> list = clubCalendarDao.getListCalender(calender);


        Map<String,Object> map = null;
        List<Map<String, Object>> list2 = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            map = new HashMap<>();



            map.put("id", list.get(i).getClubCalenderNum());
            map.put("start", list.get(i).getClubDate());
            map.put("title", list.get(i).getCalenderTitle());
            map.put("allDay", "ture");

            list2.add(map);
        }
        System.out.println("map 덮어 쓰기 " + map);
        return list2;
    }


}
