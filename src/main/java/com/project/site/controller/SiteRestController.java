package com.project.site.controller;

import com.project.domain.CommunityReport;
import com.project.domain.MasterBoard;
import com.project.domain.User;
import com.project.site.service.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

import static com.project.common.KakaoMapApi.coordToAddress;

@RestController
@RequestMapping("/site/json/*")
public class SiteRestController {

    @Autowired
    @Qualifier("siteServiceImpl")
    private SiteService siteService;

    public SiteRestController() {
        System.out.println(this.getClass());
    }

    //좌표를 RequestParam으로 받아서 RestController에서 Call한 예제
    @RequestMapping( value="clubMap" , method= RequestMethod.POST, produces = "application/text; charset=UTF-8")
    public String clubMap(@RequestParam String longitude, @RequestParam String latitude)  throws Exception {

        String vilCode = "";
        vilCode = coordToAddress(longitude, latitude);
        System.out.println("++++++++my location : ++++++++++" +vilCode);
        return vilCode;
    }

    @RequestMapping( value="addCommunityReport" , method= RequestMethod.POST, produces = "application/text; charset=UTF-8")
    public String addCommunityReport(@RequestBody CommunityReport communityReport, HttpSession session)  throws Exception {
        System.out.println("커뮤니티 신고 등록");

        System.out.println(communityReport);
        User user = (User) session.getAttribute("user");
        communityReport.setReportId(user.getUserId());
        siteService.addCommunityReport(communityReport);

        String result = "신고되었습니다.";
        return result;
    }

    @RequestMapping( value="getMasterBoard/{masterBoardNo}", method=RequestMethod.GET )
    public MasterBoard getMasterBoard(@PathVariable int masterBoardNo ) throws Exception {

        System.out.println("/site/json/getMasterBoard : GET");
        MasterBoard masterBoard = siteService.getMasterBoard(masterBoardNo);
        return masterBoard;
    }
}
