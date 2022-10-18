package com.project.myPage.controller;

import com.project.club.service.ClubCalendarService;
import com.project.club.service.ClubService;
import com.project.common.Page;
import com.project.common.Search;
import com.project.community.service.CommunityService;
import com.project.deal.service.DealService;
import com.project.domain.*;
import com.project.myPage.service.MyPageService;
import com.project.site.service.SiteService;
import com.project.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/myPage/*")


public class MyPageController {

    @Autowired
    @Qualifier("myPageServiceImpl")
    private MyPageService myPageService;

    @Autowired
    @Qualifier("clubServiceImpl")
    private ClubService clubService;

    @Autowired
    @Qualifier("clubCalenderServiceImpl")
    private ClubCalendarService calenderService;

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService commuService;

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService communityService;

    @Autowired
    @Qualifier("dealServiceImpl")
    private DealService dealService;

    @Autowired
    @Qualifier("siteServiceImpl")
    private SiteService siteService;

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    public MyPageController(){
        System.out.println(this.getClass());
    }

    @Value("#{commonProperties['pageUnit']}")
    int pageUnit;
    @Value("#{commonProperties['pageSize']}")
    int pageSize;
    @Value("#{commonProperties['resourcesPath']}")
    String resourcesPath;
    @Value("#{commonProperties['userImagePath']}")
    String userImagePath;

    @RequestMapping(value = "getMyPage",method = RequestMethod.GET)
    public String getMyPage(@RequestParam(value = "userId")String userId, Model model)throws Exception{

        System.out.println("getMyPage컨트롤러 userId의 값?"+userId);
        User user = myPageService.getMyPage(userId);
        model.addAttribute("user", user);

        return "forward:/view/myPage/getMyPage.jsp";
    }

    @RequestMapping(value = "getMyInfor",method = RequestMethod.GET)
    public String getMyInfor(@RequestParam(value = "userId")String userId, Model model)throws Exception{
        System.out.println("getMyInfor컨트롤러 userId의 값?"+userId);

        Map<String, Object> map = myPageService.getMyInfor(userId);
        System.out.println("getMyInfor 컨트롤러 map의 값은?"+map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyInfor.jsp";
    }

    @RequestMapping(value = "updateClick",method = RequestMethod.GET)
    public String updateClick(@RequestParam(value = "userId")String userId, Model model)throws Exception{
        System.out.println("updateClick컨트롤러 userId의 값?"+userId);

        Map<String, Object> map = myPageService.getMyInfor(userId);
        System.out.println("updateClick 컨트롤러 map의 값은?"+map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/updateMyInfor.jsp";
    }

    @RequestMapping(value = "updateMyInfor",method = RequestMethod.GET)
    public String updateMyInfor(@RequestParam(value = "userId")String userId)throws Exception{
        System.out.println("updateMyInfor컨트롤러 userId의 값?"+userId);


        return "forward:/view/myPage/getMyInfor.jsp";
    }
    //우리동네 게시글
    @RequestMapping(value = "getVillBoard")
    public String getVillBoard(@RequestParam("villBoardNum") int villBoardNum
            , @RequestParam("boardCategory") int boardCategory
            , Model model, @ModelAttribute("VillBaord") VilBoard villBoard) {

        villBoard = commuService.getVillBoard(villBoardNum);

        Map<String, Object> map = commuService.listComment(villBoardNum, boardCategory);


        model.addAttribute("list", map.get("list"));

        model.addAttribute("villBoard", villBoard);

        return "/view/community/get/getVillBoard.jsp";
    }

    //모임 후기글


    @RequestMapping(value = "clubCalenderReviewList")
    public String clubCalenderReview() {

        return "/view/community/list/clubCalenderReviewList.jsp";
    }

    @RequestMapping(value = "clubCalenderReviewShortList")
    public String clubCalenderReviewShortList() {

        return "/view/community/list/clubCalenderReviewShortList.jsp";
    }

    @RequestMapping(value = "getClub/{clubNum}")
    public String getClub(Model model, @PathVariable int clubNum, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            String cluberStatus = clubService.getCluberCondition(user, clubNum);
            session.setAttribute(String.valueOf(clubNum), cluberStatus);
        } else {
            session.removeAttribute(String.valueOf(clubNum));
        }
        Club club = clubService.getClub(clubNum);
        model.addAttribute("club", club);
        return "/view/club/getClub.jsp";
    }

    @RequestMapping(value = "getClubMasterBoard/{boardNum}", method = RequestMethod.GET)
    public String getClubMasterBoard(@PathVariable("boardNum") int boardNum, Model model) {
        model.addAttribute("clubMasterBoard", clubService.getClubMasterBoard(boardNum));
        return "/view/club/getClubMasterBoard.jsp";
    }

    @RequestMapping("getClubCalender")
    public String getClubCalender(@RequestParam("clubCalenderNum")int clubCalenderNum
            ,@ModelAttribute("ClubCalendar") ClubCalendar clubCalendar
            ,Model model){

        System.out.println(clubCalenderNum);

        clubCalendar = calenderService.getCalender(clubCalenderNum);

        String[] date = clubCalendar.getClubDate().split(" ");

        clubCalendar.setClubDate(date[0]);

        model.addAttribute("clubCalender", clubCalendar);

        return "/view/community/get/getClubCalender.jsp";
    }

    @RequestMapping("getClubCalenderReview")
    public String getClubCalenderReview(@RequestParam("clubCalenderReviewNum")int clubCalenderReviewNum,
                                        @RequestParam("boardCategory")int boardCategory,
                                        @ModelAttribute("clubCalenderReview")ClubCalendarReview calendarReview,
                                        @ModelAttribute("Comment") Comment comment,
                                        Model model){

        calendarReview = calenderService.getCalenderReview(clubCalenderReviewNum);

        Map<String, Object> map = communityService.listComment(clubCalenderReviewNum ,boardCategory);



        model.addAttribute("calenderReview", calendarReview);
        model.addAttribute("list", map.get("list"));

        System.out.println("list의 정보 : " + map.get("list"));

        return "/view/community/get/getClubCalenderReview.jsp";
    }

    @RequestMapping(value = "getDeal/{dealBoardNum}")
    public String getDeal(Model model, @PathVariable int dealBoardNum,HttpSession session) throws Exception {
        Deal deal = dealService.getDeal(dealBoardNum);
//Object User=session.getAttribute("userId");
        //String boardCategory = String.valueOf(deal.getBoardCategory());
        System.out.println(deal.getBoardCategory());
//String likeCheck =commuService.getLikeCheck((String)session.getAttribute("userId"),dealBoardNum, (Integer.parseInt(deal.getBoardCategory())));
        String likeCheck =commuService.getLikeCheck("user01",dealBoardNum, (Integer.parseInt(deal.getBoardCategory())));

        System.out.println("likecheck"+likeCheck);
        model.addAttribute("deal", deal);
        model.addAttribute("likeCheck",likeCheck);
        return "/view/deal/getDeal.jsp";
    }

    @RequestMapping(value = "getMasterBoard/{masterBoardNo}", method = RequestMethod.GET)
    public String getMasterBoard(@PathVariable int masterBoardNo, Model model) throws Exception {
        System.out.println("/site/getMasterBoard : GET");
        MasterBoard masterBoard = siteService.getMasterBoard(masterBoardNo);
        model.addAttribute("masterBoard", masterBoard);
        return "forward:/view/site/getMasterBoard.jsp";
    }
    @RequestMapping(value = "getCommunityReport/{communityReportNo}", method = RequestMethod.GET)
    public String getCommunityReport(@PathVariable int communityReportNo, Model model) throws Exception {
        System.out.println("/site/getCommunityReport : GET");
        CommunityReport communityReport = siteService.getCommunityReport(communityReportNo);
        model.addAttribute("communityReport", communityReport);
        return "forward:/view/site/getCommunityReport.jsp";
    }

    @RequestMapping(value = "listCommunityReport")
    public String listCommunityReport(@ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("/site/listCommunityReport : GET / POST");

        if(search.getCurrentPage() == 0 ){
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String , Object> map = siteService.listCommunityReport(search);

        Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
        System.out.println("resultPage : " + resultPage);
        System.out.println("list : " + map.get("list"));

        model.addAttribute("list", map.get("list"));
        model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);

        return "forward:/view/site/listCommunityReport.jsp";
    }

    @RequestMapping(value = "getUser", method = RequestMethod.GET)
    public String getUser(@RequestParam("userId")String userId, Model model)throws Exception{
        System.out.println("/user/getUser : GET 실행");
        User user = userService.getUser(userId);
        model.addAttribute("user", user);
        return "forward:/view/user/getUserDetail.jsp";
    }

    ///*
    @RequestMapping(value = "getMyBoard", method = RequestMethod.GET)
    public String getMyBoard(@RequestParam(value ="userId")String userId,Model model)throws Exception{
        System.out.println("getMyBoard컨트롤러 userId의 값?"+userId);

        Map<String, Object> map = myPageService.getMyBoard(userId);
        System.out.println("getMyBoard 컨트롤러 map의 값은?"+map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyBoard.jsp";
    }

    @RequestMapping(value = "getMyComment", method = RequestMethod.GET)
    public String getMyComment(@RequestParam(value ="userId")String userId,Model model)throws Exception{
        System.out.println("getMyComment 컨트롤러 userId의 값?"+userId);

        Map<String, Object> map = myPageService.getMyComment(userId);
        System.out.println("getMyComment 컨트롤러 map의 값은?"+map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyComment.jsp";
    }

    @RequestMapping(value = "getMyLike", method = RequestMethod.GET)
    public String getMyLike(@RequestParam(value ="userId")String userId,Model model)throws Exception{
        System.out.println("getMyLike 컨트롤러 userId의 값?"+userId);

        Map<String, Object> map = myPageService.getMyLike(userId);
        System.out.println("getMyLike 컨트롤러 map의 값은?"+map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyLike.jsp";
    }

    @RequestMapping(value = "getMyClub", method = RequestMethod.GET)
    public String getMyClub(@RequestParam(value ="userId")String userId,Model model)throws Exception{
        System.out.println("getMyClub 컨트롤러 userId의 값?"+userId);

        Map<String, Object> map = myPageService.getMyClub(userId);
        System.out.println("getMyClub 컨트롤러 map의 값은?"+map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyClub.jsp";
    }

    @RequestMapping(value = "getMyDeal", method = RequestMethod.GET)
    public String getMyDeal(@RequestParam(value ="userId")String userId,Model model)throws Exception{
        System.out.println("getMyDeal 컨트롤러 userId의 값?"+userId);

        Map<String, Object> map = myPageService.getMyDeal(userId);
        System.out.println("getMyDeal 컨트롤러 map의 값은?"+map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyDeal.jsp";
    }

    @RequestMapping(value = "getMyReport", method = RequestMethod.GET)
    public String getMyReport(@RequestParam(value ="userId")String userId,Model model)throws Exception{
        System.out.println("getMyReport 컨트롤러 userId의 값?"+userId);

        Map<String, Object> map = myPageService.getMyReport(userId);
        System.out.println("getMyReport 컨트롤러 map의 값은?"+map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyReport.jsp";
    }

    @RequestMapping(value = "getMyPpt", method = RequestMethod.GET)
    public String getMyPpt(@RequestParam(value ="userId")String userId,Model model)throws Exception{
        System.out.println("getMyPpt 컨트롤러 userId의 값?"+userId);

        Map<String, Object> map = myPageService.getMyPpt(userId);
        System.out.println("getMyPpt 컨트롤러 map의 값은?"+map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyPpt.jsp";
    }
    //*/
}
