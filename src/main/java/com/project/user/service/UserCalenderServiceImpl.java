package com.project.user.service;

import com.project.user.dao.UserCalenderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("userCalenderServiceImpl")
public class UserCalenderServiceImpl implements UserCalenderService{

    @Autowired
    @Qualifier("userCalenderDaoImpl")
    private UserCalenderDao calenderDao;

}
