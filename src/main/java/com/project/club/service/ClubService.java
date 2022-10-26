package com.project.club.service;

import com.project.common.Search;
import com.project.domain.*;

import java.util.List;
import java.util.Map;

public interface ClubService {

    public Club addClub(Club club);
    public void updateClub(Club club);
    public void deleteClub(Club club);
    public Club getClub(int clubNum);
    public Cluber getCluberCondition(User user, int clubNum);
    public List<Club> listClub(String userId, Search search, String searchLocation, List<String> searchInterList, List<String> searchTag);
    public void addCluberApply(Cluber cluber);
    public void updateCluberApply(Cluber cluber);
    public Cluber getCluberApplyUpdate(Cluber cluber);
    public void deleteCluberApply(int clubUserNum);
    public List<Cluber> listCluberApply(int clubNum);
    public String getCluberApply(int clubUserNum);
    public void updateCluberApply(int clubNum, int clubUserNum, String userId, String result);
    public void addClubManager(int clubUserNum);
    public void deleteClubManager(int clubUserNum);
    public void updateClubMaster(Cluber cluber);
    public void deleteCluber(Cluber cluber, String kickoutCheck);
    public int getCluberDelete(Cluber cluber);
    public void addClubBlacklist(Cluber cluber);
    public void updateClubBlacklist(String process, List<Integer> clubUserNumList);
    public Map<String, Object> listClubBlacklist(Search search, int clubNum);
    public String getClubBlacklist(int clubUserNum);
    public int addClubMasterBoard(ClubMasterBoard clubMasterBoard);
    public void updateClubMasterBoard(ClubMasterBoard clubMasterBoard, List<String> deleteFileNames);
    public List<String> deleteClubMasterBoard(int clubMasterBoardNum);
    public Map<String, Object> listClubMasterBoard(Search search, int clubNum);
    public ClubMasterBoard getClubMasterBoard(int clubMasterBoardNum);
    public void addClubCalendarApply(CalendarCluber calendarCluber, String applyAutoCheck);
    public void deleteClubCalendarApply(int clubCalendarNum, String userId);
    public List<CalendarCluber>listClubCalendarApply(int clubCalendarNum, String applyStatus);
    public void deleteClubCalendar(int clubCalendarNum);
    public String getCalendarCluberCondition(int clubCalendarNum, String userId);
    public void updateClubCalendarApply(int clubCalendarApplyNum, String process);
    public Map<String, Object> listCluber(Search search, int clubNum);
    public Cluber getCluber(int clubUserNum);
    public void updateCluber(Cluber cluber);
    public void addVote(Vote vote);
    public void updateVote(Vote vote);
    public List<Vote> listVote(String roomId);
    public Vote getVote(int voteNum, String userId);
//    public void addVoter(List<String> voterItems, String userId, int voteNum);
    public List<Voter> listVoter(Voter voter);
    public void updateVoter(List<String> voterItems, String userId, int voteNum);
    public void deleteVote(int voteNum);
    public void addCalendarCluber(int clubCalendarNum, List<String> userIdList);
    Map<String, Object> getListCluber(String userId);

}
