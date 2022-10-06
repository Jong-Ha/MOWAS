package com.project.club.dao;

import com.project.domain.*;

import java.util.List;
import java.util.Map;

public interface ClubDao {

    public void addClub(Club club);
    public void updateClub(Club club);
    public void deleteClub(Club club);
    public Club getClub(int clubNum);
    public List<Club> listClub(Map<String, Object> map);
    public void addClubMasterNewClub(Club club);
    public Club getClub(Club club);
    public void addCluberApply(Cluber cluber);
    public void updateCluberApply(Cluber cluber);
    public void deleteCluberApply(int clubUserNum);
    public List<Cluber> listCluberApply(int clubNum);
    public String getCluberApply(int clubUserNum);
    public void processCluberApply(Map<String, Object> map);
    public void updateClubNewCluber(int clubNum);
    public void addClubManager(int clubUserNum);
    public void deleteClubManager(int clubUserNum);
    public void deleteClubMaster(Cluber cluber);
    public void addClubMaster(Cluber cluber);
    public void updateClubMaster(Cluber cluber);
    public void deleteCluber(Map<String, Object> map);
    public void updateClubDeleteCluber(int clubNum);
    public void addClubBlacklist(Cluber cluber);
    public void updateClubBlacklist(Map<String, Object> map);
    public List<Cluber> listClubBlacklist(int clubNum);
    public String getClubBlacklist(int clubUserNum);
    public void addClubMasterBoard(ClubMasterBoard clubMasterBoard);
    public void updateClubMasterBoard(ClubMasterBoard clubMasterBoard);
    public void deleteClubMasterBoard(int clubMasterBoardNum);
    public List<ClubMasterBoard> listClubMasterBoard(int clubNum);
    public ClubMasterBoard getClubMasterBoard(int clubMasterBoardNum);
    public void addClubMasterBoardFile(File file);
    public List<String> listClubMasterBoardCurrentFile(int clubMasterBoardNum);
    public void deleteClubMasterBoardFile(ClubMasterBoard clubMasterBoard);
    public int getClubMasterBoardNum(String userId);
    public void addClubCalendarApply(Map<String, Object> map);
    public void deleteClubCalendarApply(Map<String, Object> map);
    public List<CalendarCluber>listClubCalendarApply(Map<String, Object> map);
    public void updateClubCalendarApply(Map<String, Object> map);
}
