package com.project.club.service;

import com.project.club.dao.ClubDao;
import com.project.common.Search;
import com.project.common.dao.MongoDbDao;
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

    @Autowired
    @Qualifier("mongoDbDaoImpl")
    MongoDbDao mongoDbDao;

    @Override
    public Club addClub(Club club) {
        clubDao.addClub(club);
        clubDao.addClubMasterNewClub(club);
        club = clubDao.getClub(club);
        mongoDbDao.addClub(club.getClubNum(), club.getClubName(), club.getClubMasterId());
        return club;
    }

    @Override
    public void updateClub(Club club) {
        clubDao.updateClub(club);
    }

    @Override
    public void deleteClub(Club club) {
        mongoDbDao.deleteClub(club.getClubNum());
        clubDao.deleteClub(club);
    }

    @Override
    public Club getClub(int clubNum) {
        return clubDao.getClub(clubNum);
    }

    @Override
    public Cluber getCluberCondition(User user, int clubNum) {
        Map<String, Object> map = new HashMap<>();
        map.put("user", user);
        map.put("clubNum", clubNum);
        Cluber cluber = clubDao.getBlackCluber(map);
        if(cluber!=null){
            return cluber;
        }
        return clubDao.getCluberCondition(map);
    }

    @Override
    public List<Club> listClub(String userId, Search search, String searchLocation, List<String> searchInterList, List<String> searchTag) {
        Map<String, Object> map = new HashMap<>();
        map.put("search",search);
        map.put("searchLocation",searchLocation);
        map.put("searchInterList",searchInterList);
        map.put("searchTag",searchTag);
        map.put("userId",userId);
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
    public void updateCluberApply(int clubNum, int clubUserNum, String userId, String result) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("result", result);
        map.put("clubUserNum", clubUserNum);
        map.put("clubNum", clubNum);

        clubDao.processCluberApply(map);
        if (result.equals("accept")) {
            clubDao.updateClubNewCluber(clubNum);
            mongoDbDao.addCluber(clubNum, userId);
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
        map.put("cluber", cluber);
        map.put("kickoutCheck", kickoutCheck);
        clubDao.deleteCluber(map);
        clubDao.updateClubDeleteCluber(cluber.getClubNum());
        System.out.println(cluber.getClubNum());
        System.out.println(cluber.getUser().getUserId());
        mongoDbDao.deleteCluber(cluber.getClubNum(), cluber.getUser().getUserId());
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
        map.put("process", process);
        map.put("list", clubUserNumList);
        clubDao.updateClubBlacklist(map);
    }

    @Override
    public Map<String, Object> listClubBlacklist(Search search, int clubNum) {
        Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        map.put("clubNum", clubNum);
        map.put("list", clubDao.listClubBlacklist(map));
        map.put("totalCount", clubDao.getTotalClubBlacklist(map));
        return map;
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
        for (File file : files) {
            file.setBoardNum(clubMasterBoardNum);
            clubDao.addClubMasterBoardFile(file);
        }
        return clubMasterBoardNum;
    }

    @Override
    public void updateClubMasterBoard(ClubMasterBoard clubMasterBoard, List<String> deleteFileNames) {
        //모임 공지사항 업데이트
        clubDao.updateClubMasterBoard(clubMasterBoard);

        //삭제된 파일 날리기
        Map<String, Object> map = new HashMap<>();
        map.put("boardNum", clubMasterBoard.getBoardNum());
        map.put("deleteFileNames", deleteFileNames);
        if (deleteFileNames != null) {
            clubDao.deleteClubMasterBoardFile(map);
        }

        //새로운 파일 등록
        List<File> files = clubMasterBoard.getFiles();
        for (File file : files) {
            file.setBoardNum(clubMasterBoard.getBoardNum());
            clubDao.addClubMasterBoardFile(file);
        }

        //에러발생
//        System.out.println(2/0);
    }

    @Override
    public List<String> deleteClubMasterBoard(int clubMasterBoardNum) {
        clubDao.deleteClubMasterBoard(clubMasterBoardNum);

        //파일 날리기
        Map<String, Object> map = new HashMap<>();
        List<String> deleteFileNames = new ArrayList<>();
        map.put("boardNum", clubMasterBoardNum);
        map.put("deleteFileNames", deleteFileNames);
        //deleteFileNames가 널이면 실행 안됨
        //deleteFileNames.size가 0이면 모든 파일 삭제
        List<String> deleteFiles = clubDao.listClubMasterBoardCurrentFile(clubMasterBoardNum);
        clubDao.deleteClubMasterBoardFile(map);
        return deleteFiles;
    }

    @Override
    public Map<String, Object> listClubMasterBoard(Search search, int clubNum) {
        Map<String, Object> map = new HashMap<>();
        map.put("search", search);
        map.put("clubNum", clubNum);
        int totalCount = clubDao.getTotalClubMasterBoard(map);
        List<ClubMasterBoard> list = clubDao.listClubMasterBoard(map);
        map.put("totalCount", totalCount);
        map.put("list", list);
        return map;
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
        map.put("clubCalendarNum", clubCalendarNum);
        map.put("applyStatus", applyStatus);
        return clubDao.listClubCalendarApply(map);
    }

    @Override
    public void deleteClubCalendar(int clubCalendarNum) {
        clubDao.deleteClubCalendar(clubCalendarNum);
    }

    @Override
    public String getCalendarCluberCondition(int clubCalendarNum, String userId) {
        Map<String, Object> map = new HashMap<>();
        map.put("clubCalendarNum", clubCalendarNum);
        map.put("userId", userId);
        return clubDao.getCalendarCluberCondition(map);
    }

    @Override
    public void updateClubCalendarApply(int clubCalendarApplyNum, String process) {
        Map<String, Object> map = new HashMap<>();
        map.put("clubCalendarApplyNum", clubCalendarApplyNum);
        map.put("process", process);
        clubDao.updateClubCalendarApply(map);
    }

    @Override
    public Map<String, Object> listCluber(Search search, int clubNum) {
        Map<String, Object> map = new HashMap<>();
        map.put("clubNum", clubNum);
        map.put("search", search);
        int totalCount = clubDao.getTotalCluber(map);
        List<Cluber> list = clubDao.listCluber(map);
        map.put("totalCount", totalCount);
        map.put("list", list);
        return map;
    }

    @Override
    public Cluber getCluber(int clubUserNum) {
        return clubDao.getCluber(clubUserNum);
    }

    @Override
    public void updateCluber(Cluber cluber) {
        clubDao.updateCluber(cluber);
    }

    @Override
    public void addVote(Vote vote) {
        clubDao.addVote(vote);
    }

    @Override
    public void updateVote(Vote vote) {
        clubDao.updateVote(vote);
    }

    @Override
    public void deleteVote(int voteNum) {
        Map<String, Object> map = new HashMap<>();
        map.put("voteNum", voteNum);
        clubDao.deleteVoter(map);
        clubDao.deleteVote(voteNum);
    }

    @Override
    public List<Vote> listVote(String roomId) {
        clubDao.updateVoteEndDate(roomId);
        return clubDao.listVote(roomId);
    }

    @Override
    public Vote getVote(int voteNum, String userId) {
        Map<String, Object> map = new HashMap<>();
        map.put("voteNum", voteNum);
        map.put("userId",userId);
        return clubDao.getVote(map);
    }

    @Override
    public List<Voter> listVoter(Voter voter) {
        return clubDao.listVoter(voter);
    }

//    @Override
//    public void addVoter(List<String> voterItems, String userId, int voteNum) {
//        for (String voteItem : voterItems) {
//            Voter voter = new Voter();
//            voter.setVoteItem(voteItem);
//            voter.setUserId(userId);
//            voter.setVoteNum(voteNum);
//            clubDao.addVoter(voter);
//        }
//    }

    @Override
    public void updateVoter(List<String> voterItems, String userId, int voteNum) {
        Map<String, Object> map = new HashMap<>();
        map.put("voteNum", voteNum);
        map.put("userId", userId);
        clubDao.deleteVoter(map);
        for (String voteItem : voterItems) {
            Voter voter = new Voter();
            voter.setVoteItem(voteItem);
            voter.setUserId(userId);
            voter.setVoteNum(voteNum);
            clubDao.addVoter(voter);
        }
    }

    @Override
    public void addCalendarCluber(int clubCalendarNum, List<String> userIdList) {
        for(String userId : userIdList){
            Map<String, Object> map = new HashMap<>();
            map.put("clubCalendarNum",clubCalendarNum);
            map.put("userId",userId);
            clubDao.addCalendarCluber(map);
        }
    }

    @Override
    public Map<String, Object> getListCluber(String userId) {
       Map<String, Object> map = new HashMap<>();

       List<CalendarCluber> list = clubDao.getListCluber(userId);

       map.put("list", list);

        return map;
    }
}
