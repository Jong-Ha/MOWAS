package com.project.community.controller;

import com.project.community.service.CommunityService;
import com.project.domain.ClubCalendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/commu/*")
public class CommunityController {

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService commuService;

    @RequestMapping("/")
    public String Calender() {
        System.out.println("calender진입");

        return "/view/community/list/Community.jsp";
    }

    ;

    @RequestMapping(value = "addClubCalender", method = RequestMethod.POST)
    public String addClubCalender(@ModelAttribute("ClubCalendar") ClubCalendar commu) throws Exception {
        System.out.println("addClubCalender 진입 " + commu);
        commu.setClubNum(3);
        commuService.addClubCalender(commu);
        return "/view/community/calender.jsp";
    }

    //우리동네 게시글
    @RequestMapping(value = "getVillBoard")
    public String getVillBoard(){
        return "/view/community/get/getVillBoard.jsp";
    }
    @RequestMapping(value = "villBoardList")
    public String villBoardList() {

        return "/view/community/list/villBoardList.jsp";
    }

    //모임 후기글

    @RequestMapping(value = "getClubCalenderReview")
    public String getClubCalenderReview(){

        return "/view/community/get/getClubCalenderReview.jsp";
    }

    @RequestMapping(value = "clubCalenderReviewList")
    public String clubCalenderReview() {

        return "/view/community/list/clubCalenderReviewList.jsp";
    }

    //모임 후기 쇼츠
    @RequestMapping(value = "clubCalenderReviewShortList")
    public String clubCalenderReviewShort(){

        return "/view/community/list/clubCalenderReviewShortList.jsp";

    }

}
