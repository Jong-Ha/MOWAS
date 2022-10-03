package com.project.community.service;

import com.project.community.dao.CommunityDao;
import com.project.domain.ClubCalendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    @Qualifier("communityDaoImpl")
    private CommunityDao commuDao;

    @Override
    public void addClubCalender(ClubCalendar commu) throws Exception {
        commuDao.addClubCalender(commu);
    }
}
