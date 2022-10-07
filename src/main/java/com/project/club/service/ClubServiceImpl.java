package com.project.club.service;

import com.project.club.dao.ClubDao;
import com.project.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.*;

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
    public List<Club> listClub(String userId) {
        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        return clubDao.listClub(map);
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
    public Cluber getCluberApplyUpdate(Cluber cluber) {
        return clubDao.getCluberApplyUpdate(cluber);
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
    public int getCluberDelete(Cluber cluber) {
        return clubDao.getCluberDelete(cluber);
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

    @Override
    public int addClubMasterBoard(ClubMasterBoard clubMasterBoard) {
        clubDao.addClubMasterBoard(clubMasterBoard);
        int clubMasterBoardNum = clubDao.getClubMasterBoardNum(clubMasterBoard.getUserId());
        List<File> files = clubMasterBoard.getFiles();
        for(File file : files){
            file.setBoardNum(clubMasterBoardNum);
            clubDao.addClubMasterBoardFile(file);
        }
        return  clubMasterBoardNum;
    }

    @Override
    public void updateClubMasterBoard(ClubMasterBoard clubMasterBoard) {
        clubDao.updateClubMasterBoard(clubMasterBoard);
        clubDao.deleteClubMasterBoardFile(clubMasterBoard);
        List<String> currentFiles = clubDao.listClubMasterBoardCurrentFile(clubMasterBoard.getBoardNum());
        Set<String> check = new HashSet<>();
        check.addAll(currentFiles);
        for(File file : clubMasterBoard.getFiles()){
            if(check.add(file.getFileName())){
                clubDao.addClubMasterBoardFile(file);
            }
        }
    }

    @Override
    public void deleteClubMasterBoard(int clubMasterBoardNum) {
        clubDao.deleteClubMasterBoard(clubMasterBoardNum);
        ClubMasterBoard clubMasterBoard = new ClubMasterBoard();
        List<File> files = new ArrayList<>();
        clubMasterBoard.setFiles(files);
        clubMasterBoard.setBoardNum(clubMasterBoardNum);
        clubDao.deleteClubMasterBoardFile(clubMasterBoard);
    }

    @Override
    public List<ClubMasterBoard> listClubMasterBoard(int clubNum) {
        return clubDao.listClubMasterBoard(clubNum);
    }

    @Override
    public ClubMasterBoard getClubMasterBoard(int clubMasterBoardNum) {
        return clubDao.getClubMasterBoard(clubMasterBoardNum);
    }

    @Override
    public void addClubCalendarApply(CalendarCluber calendarCluber, String applyAutoCheck) {
        Map<String, Object> map = new HashMap<>();
        map.put("calendarCluber", calendarCluber);
        map.put("applyAutoCheck", applyAutoCheck);
        clubDao.addClubCalendarApply(map);
    }

    @Override
    public void deleteClubCalendarApply(int clubCalendarNum, String userId) {
        Map<String, Object> map = new HashMap<>();
        map.put("clubCalendarNum", clubCalendarNum);
        map.put("userId", userId);
        clubDao.deleteClubCalendarApply(map);
    }

    @Override
    public List<CalendarCluber> listClubCalendarApply(int clubCalendarNum, String applyStatus) {
        Map<String, Object> map = new HashMap<>();
        map.put("clubCalendarNum",clubCalendarNum);
        map.put("applyStatus",applyStatus);
        return clubDao.listClubCalendarApply(map);
    }

    @Override
    public void updateClubCalendarApply(int clubCalendarApplyNum, String process) {
        Map<String, Object> map = new HashMap<>();
        map.put("clubCalendarApplyNum", clubCalendarApplyNum);
        map.put("process", process);
        clubDao.updateClubCalendarApply(map);
    }

    @Override
    public List<Cluber> listCluber(int clubNum) {
        return clubDao.listCluber(clubNum);
    }

    @Override
    public Cluber getCluber(int clubUserNum) {
        return clubDao.getCluber(clubUserNum);
    }

    @Override
    public void updateCluber(Cluber cluber) {
        clubDao.updateCluber(cluber);
    }
}
