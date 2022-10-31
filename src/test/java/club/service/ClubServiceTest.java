package club.service;

import com.project.club.service.ClubService;
import com.project.common.Search;
import com.project.domain.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/context-common.xml", "classpath:config/context-aspect.xml", "classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml"})
public class ClubServiceTest {

    @Autowired
    @Qualifier("clubServiceImpl")
    ClubService clubService;

    @Test
    public void addClub() {
        Club club = new Club();
        club.setClubMasterId("user01");
        club.setInterList("02");
        club.setClubName("club02");
        club.setClubText("asdfasdf");
        club.setVillCode("신림동");
        club.setClubImage("이미지");
        club.setTag("#asdf #qwer #zxcv");

//        Club result = clubService.addClub(club);

//        System.out.println(result);
    }

    @Test
    public void updateClub() {
        Club club = new Club();
        club.setClubNum(10008);
        club.setGatherCheck("0");
        club.setClubName("clubName");
        club.setClubText("clubText");
        club.setVillCode("역삼1동");
        club.setClubImage("미지미지");
        club.setTag("#tag1 #tag2 #tag3");

//        Club result = clubService.updateClub(club);

    }

    @Test
    public void deleteClub() {
        Club club = new Club();
        club.setClubNum(10008);

        clubService.deleteClub(club);
    }

    @Test
    public void getClub() {

        int clubNum = 10008;

        Club result = clubService.getClub(clubNum);

        System.out.println(result);
    }

    @Test
    public void listClub() {
        String userId = "user01";

//        System.out.println(clubService.listClub(userId));
    }

    @Test
    public void addCluberApply() {
        Cluber cluber = new Cluber();
        User user = new User();
        user.setUserId("user02");
        user.setUserImage("노이미지");
        cluber.setUser(user);
        cluber.setClubNum(10008);
        cluber.setCluberText("자소설");

        clubService.addCluberApply(cluber);
    }

    @Test
    public void updateCluberApply() {
        Cluber cluber = new Cluber();
        cluber.setClubUserNum(10014);
        cluber.setCluberText("자소설쓴다");

        clubService.updateCluberApply(cluber);
    }

    @Test
    public void deleteCluberApply() {
        int clubUserNum = 10013;

        clubService.deleteCluberApply(clubUserNum);
    }

    @Test
    public void listCluberApply() {
        int clubNum = 10008;

        List<Cluber> result = clubService.listCluberApply(clubNum);

        System.out.println(result);
    }

    @Test
    public void getCluberApply() {
        int clubUserNum = 10004;

        String result = clubService.getCluberApply(clubUserNum);

        System.out.println(result);
    }

    @Test
    public void processCluberApply() {
        String result = "accept";
        int clubUserNum = 10015;
        int clubNum = 10008;

//        clubService.updateCluberApply(clubNum, clubUserNum, result);

    }

    @Test
    public void addClubManager() {
        int clubUserNum = 10015;

        clubService.addClubManager(clubUserNum);
    }

    @Test
    public void deleteClubManager() {
        int clubUserNum = 10015;

        clubService.deleteClubManager(clubUserNum);
    }

    @Test
    public void updateClubMaster() {
        int clubUserNum = 10015;
        int clubNum = 10008;
        Cluber cluber = new Cluber();
        cluber.setClubUserNum(clubUserNum);
        cluber.setClubNum(clubNum);

        clubService.updateClubMaster(cluber);
    }

    @Test
    public void deleteCluber() {
        String clubOutText = "퇴근하자";
        int clubUserNum = 10015;
        int clubNum = 10008;
        String kick = "T";
        Cluber cluber = new Cluber();
        cluber.setClubUserNum(clubUserNum);
        cluber.setClubOutText(clubOutText);
        cluber.setClubNum(clubNum);

        clubService.deleteCluber(cluber, kick);
    }

    @Test
    public void listClubBlacklist() {
        int clubNum = 10008;
        Search search = new Search();

        System.out.println(clubService.listClubBlacklist(search, clubNum));
    }

    @Test
    public void getClubBlacklist() {
        int clubUserNum = 10017;

        System.out.println(clubService.getClubBlacklist(clubUserNum));
    }

    @Test
    public void addClubBlacklist() {
        Cluber cluber = new Cluber();
        User user = new User();
        user.setUserId("user02");
        user.setUserImage("이미미미미");
        cluber.setUser(user);
        cluber.setClubNum(10008);
        cluber.setBlacklistText("왜 블랙됨!");

        clubService.addClubBlacklist(cluber);
    }

    @Test
    public void updateClubBlacklist() {
        String process = "F";
        List<Integer> list = new ArrayList<Integer>();
        list.add(10016);
        list.add(10017);
        clubService.updateClubBlacklist(process, list);
    }

    @Test
    public void listClubMasterBoard() {
        int clubNum = 10008;
        Search search = new Search();
        System.out.println(clubService.listClubMasterBoard(search, clubNum));
    }

    @Test
    public void getClubMasterBoard() {
        int clubMasterBoardNum = 10001;
        System.out.println(clubService.getClubMasterBoard(clubMasterBoardNum));
    }

    @Test
    public void addClubMasterBoard() {
        ClubMasterBoard clubMasterBoard = new ClubMasterBoard();
        clubMasterBoard.setClubNum(10008);
        clubMasterBoard.setUserId("user02");
        clubMasterBoard.setTitle("제제제목목목");
        clubMasterBoard.setText("내내내용용용");
        List<File> files = new ArrayList<>();
        for (int i = 0; i < 2; i++) {
            File file = new File();
            file.setFileName((i + 1) + "파일");
            files.add(file);
        }
        clubMasterBoard.setFiles(files);

        clubService.addClubMasterBoard(clubMasterBoard);
    }

    @Test
    public void updateClubMasterBoard() {
        ClubMasterBoard clubMasterBoard = clubService.getClubMasterBoard(10002);
        clubMasterBoard.setTitle("제목");
        clubMasterBoard.setText("내용");
        List<File> files = new ArrayList<>();
        for (int i = 0; i < 2; i++) {
            File file = new File();
            file.setBoardNum(clubMasterBoard.getBoardNum());
            file.setFileName((i + 1) + "파일");
            files.add(file);
            file = new File();
            file.setBoardNum(clubMasterBoard.getBoardNum());
            file.setFileName("파일" + (i + 10));
            files.add(file);
        }
        clubMasterBoard.setFiles(files);
//        clubService.updateClubMasterBoard(clubMasterBoard);
    }

    @Test
    public void deleteClubMasterBoard() {
        int clubMasterBoardNum = 10002;

        clubService.deleteClubMasterBoard(clubMasterBoardNum);
    }

    @Test
    public void listClubCalendarApply() {
        int clubCalendarNum = 10001;
        String applyStatus = "1";

        System.out.println(clubService.listClubCalendarApply(clubCalendarNum, applyStatus));
    }

    @Test
    public void addClubCalendarApply() {
        CalendarCluber calendarCluber = new CalendarCluber();
        User user = new User();
        user.setUserId("user03");
        user.setUserImage("미미미");
        calendarCluber.setUser(user);
        calendarCluber.setClubCalendarNum(10001);
        String applyAutoCheck = "1";

        clubService.addClubCalendarApply(calendarCluber, applyAutoCheck);
    }

    @Test
    public void deleteClubCalendarApply() {
        int clubCalendarNum = 10001;
        String userId = "user02";

        clubService.deleteClubCalendarApply(clubCalendarNum, userId);
    }

    @Test
    public void updateClubCalendarApply() {
        int clubCalendarApplyNum = 10005;
        String process = "reject";

        clubService.updateClubCalendarApply(clubCalendarApplyNum, process);
    }

    @Test
    public void listCluber() {
        int clubNum = 10008;
        Search search = new Search();
        System.out.println(clubService.listCluber(search, clubNum));
    }

    @Test
    public void getCluber() {
        int clubUserNum = 10004;

        System.out.println(clubService.getCluber(clubUserNum));
    }

    @Test
    public void updateCluber() {
        Cluber cluber = new Cluber();
        cluber.setClubUserNum(10006);
        cluber.setCluberText("소개소개소개소개소개");

        clubService.updateCluber(cluber);
    }

    @Test
    public void addVoteNoEndDate() {
        Vote vote = new Vote();
        vote.setRoomId("room01");
        vote.setVoteMasterId("user01");
        vote.setVoteTitle("제제");
        vote.setVoteText("내내");
        vote.setMultiVoteCheck("0");
        vote.setHideVoteCheck("0");
        vote.setEndDateCheck("0");
        vote.setVoteItem1("11");

        clubService.addVote(vote);
    }

    @Test
    public void addVoteEndDate() {
        Vote vote = new Vote();
        vote.setRoomId("room01");
        vote.setVoteMasterId("user01");
        vote.setVoteTitle("제제");
        vote.setVoteText("내내");
        vote.setMultiVoteCheck("0");
        vote.setHideVoteCheck("0");
        vote.setEndDateCheck("1");
//        vote.setEndDate(new Date(122, 9, 14));
        vote.setVoteItem1("11");

        clubService.addVote(vote);
    }

    @Test
    public void updateVote() {
        Vote vote = new Vote();
        vote.setVoteNum(10011);
        ;
        vote.setVoteTitle("제제");
        vote.setVoteText("내내");
        vote.setMultiVoteCheck("0");
        vote.setHideVoteCheck("0");
        vote.setEndDateCheck("0");
        vote.setVoteItem1("11");

        clubService.updateVote(vote);
    }

    @Test
    public void listVote() {
        String roomId = "room01";

        for (Vote vote : clubService.listVote(roomId)) {
            System.out.println(vote);
        }
    }

    @Test
    public void getVote() {
        System.out.println(clubService.getVote(10006, "user01"));
    }

    @Test
    public void addVoter() {
        List<String> voterItems = new ArrayList<>();
        voterItems.add("3");
        voterItems.add("4");
        voterItems.add("5");

        String userId = "user01";

        int voteNum = 10006;

//        clubService.addVoter(voterItems,userId,voteNum);
    }

    @Test
    public void listVoter() {
        String userId = "user01";
        int voteNum = 10006;
        String voteItem = "1";

        Voter voter = new Voter();
        voter.setVoteNum(voteNum);
        voter.setUserId(userId);
        voter.setVoteItem(voteItem);

        for (Voter v : clubService.listVoter(voter)){
            System.out.println(v);
        }
    }

    @Test
    public void updateVoter() {
        List<String> voterItems = new ArrayList<>();
        voterItems.add("3");
        voterItems.add("2");

        String userId = "user01";

        int voteNum = 10006;

        clubService.updateVoter(voterItems,userId,voteNum);
    }

    @Test
    public void deleteVote() {
        int voteNum = 10006;

        clubService.deleteVote(voteNum);
    }

}
