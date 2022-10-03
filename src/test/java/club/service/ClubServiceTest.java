package club.service;

import com.project.club.service.ClubService;
import com.project.domain.Club;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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

        Club result = new Club();

        result = clubService.addClub(club);

        System.out.println(result);
    }
}
