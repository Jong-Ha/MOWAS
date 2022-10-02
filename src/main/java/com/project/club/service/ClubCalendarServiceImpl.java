package com.project.club.service;

import com.project.club.dao.ClubCalendarDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("clubCalenderServiceImpl")
public class ClubCalendarServiceImpl implements ClubCalendarService {

    @Autowired
    @Qualifier("clubCalenderDaoImpl")
    private ClubCalendarDao clubCalendarDao;

}
