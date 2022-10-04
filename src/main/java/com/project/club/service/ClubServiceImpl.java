package com.project.club.service;

import com.project.club.dao.ClubDao;
import com.project.domain.Club;
import com.project.domain.Cluber;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    @Override
    public void addCluberApply(Cluber cluber) {
        clubDao.addCluberApply(cluber);
    }

    @Override
    public void updateCluberApply(Cluber cluber) {
        clubDao.updateCluberApply(cluber);
    }

    @Override
    public void deleteCluberApply(int clubUserNum) {
        clubDao.deleteCluberApply(clubUserNum);
    }

    @Override
    public List<Cluber> listCluberApply(int clubNum) {
        return clubDao.listCluberApply(clubNum);
    }

    @Override
    public String getCluberApply(int clubUserNum) {
        return clubDao.getCluberApply(clubUserNum);
    }

    @Override
    public void updateCluberApply(Map<String, Object> map) {
        clubDao.processCluberApply(map);
        if(map.get("result").equals("accept")){
            Cluber cluber = (Cluber) map.get("cluber");
            clubDao.updateClubNewCluber(cluber.getClubNum());
        }
    }
}
