package com.project.club.service;

import com.project.club.dao.ClubDao;
import com.project.domain.Club;
import com.project.domain.Cluber;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
        clubDao.addClubMasterNewClub(club);
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
    public void updateCluberApply(int clubNum, int clubUserNum, String result) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("result",result);
        map.put("clubUserNum",clubUserNum);
        map.put("clubNum",clubNum);

        clubDao.processCluberApply(map);
        if(((String)map.get("result")).equals("accept")){
            clubDao.updateClubNewCluber((Integer) map.get("clubNum"));
        }
    }

    @Override
    public void addClubManager(int clubUserNum) {
        clubDao.addClubManager(clubUserNum);
    }

    @Override
    public void deleteClubManager(int clubUserNum) {
        clubDao.deleteClubManager(clubUserNum);
    }

    @Override
    public void updateClubMaster(Cluber cluber) {
        clubDao.deleteClubMaster(cluber);
        clubDao.addClubMaster(cluber);
        clubDao.updateClubMaster(cluber);
    }

    @Override
    public void deleteCluber(Cluber cluber, String kickoutCheck) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("cluber",cluber);
        map.put("kickoutCheck", kickoutCheck);
        clubDao.deleteCluber(map);
        clubDao.updateClubDeleteCluber(cluber.getClubNum());
    }

    @Override
    public void addClubBlacklist(Cluber cluber) {
        clubDao.addClubBlacklist(cluber);
    }

    @Override
    public void updateClubBlacklist(String process, List<Integer> clubUserNumList) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("process",process);
        map.put("list", clubUserNumList);
        clubDao.updateClubBlacklist(map);
    }

    @Override
    public List<Cluber> listClubBlacklist(int clubNum) {
        return clubDao.listClubBlacklist(clubNum);
    }

    @Override
    public String getClubBlacklist(int clubUserNum) {
        return clubDao.getClubBlacklist(clubUserNum);
    }
}
