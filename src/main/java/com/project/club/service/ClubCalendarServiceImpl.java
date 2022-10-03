package com.project.club.service;

import com.project.club.dao.ClubCalendarDao;
import com.project.domain.ClubCalendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
}
