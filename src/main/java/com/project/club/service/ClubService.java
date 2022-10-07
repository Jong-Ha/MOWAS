package com.project.club.service;

import com.project.domain.CalendarCluber;
import com.project.domain.Club;
import com.project.domain.ClubMasterBoard;
import com.project.domain.Cluber;

import java.util.List;

public interface ClubService {

    public Club addClub(Club club);
    public Club updateClub(Club club);
    public void deleteClub(Club club);
    public Club getClub(int clubNum);
    public List<Club> listClub(String userId);
    public void addCluberApply(Cluber cluber);
    public void updateCluberApply(Cluber cluber);
    public Cluber getCluberApplyUpdate(Cluber cluber);
    public void deleteCluberApply(int clubUserNum);
    public List<Cluber> listCluberApply(int clubNum);
    public String getCluberApply(int clubUserNum);
    public void updateCluberApply(int clubNum, int clubUserNum, String result);
    public void addClubManager(int clubUserNum);
    public void deleteClubManager(int clubUserNum);
    public void updateClubMaster(Cluber cluber);
    public void deleteCluber(Cluber cluber, String kickoutCheck);
    public int getCluberDelete(Cluber cluber);
    public void addClubBlacklist(Cluber cluber);
    public void updateClubBlacklist(String process, List<Integer> clubUserNumList);
    public List<Cluber> listClubBlacklist(int clubNum);
    public String getClubBlacklist(int clubUserNum);
    public int addClubMasterBoard(ClubMasterBoard clubMasterBoard);
    public void updateClubMasterBoard(ClubMasterBoard clubMasterBoard);
    public void deleteClubMasterBoard(int clubMasterBoardNum);
    public List<ClubMasterBoard> listClubMasterBoard(int clubNum);
    public ClubMasterBoard getClubMasterBoard(int clubMasterBoardNum);
    public void addClubCalendarApply(CalendarCluber calendarCluber, String applyAutoCheck);
    public void deleteClubCalendarApply(int clubCalendarNum, String userId);
    public List<CalendarCluber>listClubCalendarApply(int clubCalendarNum, String applyStatus);
    public void updateClubCalendarApply(int clubCalendarApplyNum, String process);
    public List<Cluber> listCluber(int clubNum);
    public Cluber getCluber(int clubUserNum);
    public void updateCluber(Cluber cluber);
}
