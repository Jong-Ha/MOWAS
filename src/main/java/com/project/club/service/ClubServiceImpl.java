package com.project.club.service;

import com.project.club.dao.ClubDao;
import com.project.domain.Club;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("clubServiceImpl")
public class ClubServiceImpl implements ClubService {

    @Autowired
    @Qualifier("clubDaoImpl")
    ClubDao clubDao;

    @Override
    public Club addClub(Club club) {
        clubDao.addClub(club);
        clubDao.addClubMaster(club);
        return clubDao.getClub(club);
    }

    @Override
    public Club updateClub(Club club) {
        clubDao.updateClub(club);
        return clubDao.getClub(club.getClubNum());
    }

    @Override
    public void deleteClub(Club club) {
        clubDao.deleteClub(club);
    }

    @Override
    public Club getClub(int clubNum) {
        return clubDao.getClub(clubNum);
    }
}
