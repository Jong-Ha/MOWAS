package club.service;

import com.project.club.service.ClubService;
import com.project.domain.Club;
import com.project.domain.Cluber;
import com.project.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/context-common.xml","classpath:config/context-aspect.xml","classpath:config/context-mybatis.xml","classpath:config/context-transaction.xml"})
public class ClubServiceTest {

    @Autowired
    @Qualifier("clubServiceImpl")
    ClubService clubService;

    @Test
    public void addClub(){
        Club club = new Club();
        club.setClubMasterId("user01");
        club.setInterList("02");
        club.setClubName("club02");
        club.setClubText("asdfasdf");
        club.setVillCode("신림동");
        club.setClubImage("이미지");
        club.setTag("#asdf #qwer #zxcv");

        Club result = clubService.addClub(club);

        System.out.println(result);
    }

    @Test
    public void updateClub(){
        Club club = new Club();
        club.setClubNum(10008);
        club.setGatherCheck("0");
        club.setClubName("clubName");
        club.setClubText("clubText");
        club.setVillCode("역삼1동");
        club.setClubImage("미지미지");
        club.setTag("#tag1 #tag2 #tag3");

        Club result = clubService.updateClub(club);

        System.out.println(result);
    }

    @Test
    public void deleteClub(){
        Club club = new Club();
        club.setClubNum(10008);

        clubService.deleteClub(club);
    }

    @Test
    public void getClub(){

        int clubNum = 10008;

        Club result = clubService.getClub(clubNum);

        System.out.println(result);
    }

    @Test
    public void addCluberApply(){
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
    public void updateCluberApply(){
        Cluber cluber = new Cluber();
        cluber.setClubUserNum(10014);
        cluber.setCluberText("자소설쓴다");

        clubService.updateCluberApply(cluber);
    }

    @Test
    public void deleteCluberApply(){
        int clubUserNum = 10013;

        clubService.deleteCluberApply(clubUserNum);
    }

    @Test
    public void listCluberApply(){
        int clubNum = 10008;

        List<Cluber> result = clubService.listCluberApply(clubNum);

        System.out.println(result);
    }

    @Test
    public void getCluberApply(){
        int clubUserNum = 10013;

        String result = clubService.getCluberApply(clubUserNum);

        System.out.println(result);
    }

    @Test
    public void processCluberApply(){
        String result = "accept";
        int clubUserNum = 10015;
        int clubNum = 10008;

        clubService.updateCluberApply(clubNum,clubUserNum,result);

    }

    @Test
    public void addClubManager(){
        int clubUserNum = 10015;

        clubService.addClubManager(clubUserNum);
    }

    @Test
    public void deleteClubManager(){
        int clubUserNum = 10015;

        clubService.deleteClubManager(clubUserNum);
    }

    @Test
    public void updateClubMaster(){
        int clubUserNum = 10015;
        int clubNum = 10008;
        Cluber cluber = new Cluber();
        cluber.setClubUserNum(clubUserNum);
        cluber.setClubNum(clubNum);

        clubService.updateClubMaster(cluber);
    }

    @Test
    public void deleteCluber(){
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
    public void listClubBlacklist(){
        int clubNum = 10008;

        System.out.println(clubService.listClubBlacklist(clubNum));
    }

    @Test
    public void getClubBlacklist(){
        int clubUserNum = 10017;

        System.out.println(clubService.getClubBlacklist(clubUserNum));
    }

    @Test
    public void addClubBlacklist(){
        Cluber cluber = new Cluber();
        User user = new User();
        user.setUserId("user02");
        user.setUserImage("이미미미미");
        cluber.setUser(user);
        cluber.setClubNum(10008);
        cluber.setBlacklistText("왜 블랙됨!");

        clubService.addClubBlacklist(cluber);

        int clubUserNum = 10017;
        System.out.println(clubService.getClubBlacklist(clubUserNum));
    }

    @Test
    public void updateClubBlacklist(){
        String process = "F";
        List<Integer> list = new ArrayList<Integer>();
        list.add(10016);
        list.add(10017);
        clubService.updateClubBlacklist(process, list);
    }

}
