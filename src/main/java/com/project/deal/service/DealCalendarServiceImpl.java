package com.project.deal.service;

import com.project.deal.dao.DealCalendarDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("dealCalenderServiceImpl")
public class DealCalendarServiceImpl implements DealCalendarService{

    @Autowired
    @Qualifier("dealCalenderDaoImpl")
    private DealCalendarDao calenderDao;
}
