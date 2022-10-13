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
    public Cluber getCluberApplyUpdate(Cluber cluber);
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
    public int getCluberDelete(Cluber cluber);
    public void updateClubDeleteCluber(int clubNum);
    public void addClubBlacklist(Cluber cluber);
    public void updateClubBlacklist(Map<String, Object> map);
    public List<Cluber> listClubBlacklist(Map<String, Object> map);
    public int getTotalClubBlacklist(Map<String, Object> map);
    public String getClubBlacklist(int clubUserNum);
    public void addClubMasterBoard(ClubMasterBoard clubMasterBoard);
    public void updateClubMasterBoard(ClubMasterBoard clubMasterBoard);
    public void deleteClubMasterBoard(int clubMasterBoardNum);
    public List<ClubMasterBoard> listClubMasterBoard(Map<String, Object> map);
    public int getTotalClubMasterBoard(Map<String, Object> map);
    public ClubMasterBoard getClubMasterBoard(int clubMasterBoardNum);
    public void addClubMasterBoardFile(File file);
    public List<String> listClubMasterBoardCurrentFile(int clubMasterBoardNum);
    public void deleteClubMasterBoardFile(Map<String, Object> map);
    public int getClubMasterBoardNum(String userId);
    public void addClubCalendarApply(Map<String, Object> map);
    public void deleteClubCalendarApply(Map<String, Object> map);
    public List<CalendarCluber>listClubCalendarApply(Map<String, Object> map);
    public void updateClubCalendarApply(Map<String, Object> map);
    public List<Cluber> listCluber(Map<String, Object> map);
    public String getCluberCondition(Map<String, Object> map);
    public int getTotalCluber(Map<String, Object> map);
    public Cluber getCluber(int clubUserNum);
    public void updateCluber(Cluber cluber);
    public void addVote(Vote vote);
    public void updateVote(Vote vote);
    public void deleteVote(int voteNum);
    public void deleteVoter(Map<String, Object> map);
    public List<Vote> listVote(String roomId);
    public Vote getVote(int voteNum);
    public List<Voter> listVoter(Voter voter);
    public void addVoter(Voter voter);

}
