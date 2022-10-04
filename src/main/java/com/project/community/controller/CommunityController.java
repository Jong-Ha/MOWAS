package com.project.community.controller;

import com.project.community.service.CommunityService;
import com.project.domain.ClubCalendar;
import com.project.domain.VilBoard;
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
    };

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

    @RequestMapping(value = "clubCalenderReviewShortList")
    public String clubCalenderReviewShortList() {

        return "/view/community/list/clubCalenderReviewShortList.jsp";
    }

    @RequestMapping(value = "addVillBoard")
    public String addVillBoard(@ModelAttribute("villBoard")VilBoard villBoard){
        System.out.println("우리 동네 게시글 진입 : " + villBoard);

        villBoard.setUserId("user01");
        villBoard.setVillCode("창원");
        villBoard.setBoardCategory(1);

        commuService.addVillBoard(villBoard);


        return null;
    }


}
