package com.project.club.controller;

import com.project.club.service.ClubCalendarService;
import com.project.club.service.ClubService;
import com.project.common.Search;
import com.project.community.service.CommunityService;
import com.project.deal.service.DealService;
import com.project.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/clubCal/*")
public class ClubCalendarController {

    @Autowired
    @Qualifier("clubCalenderServiceImpl")
    private ClubCalendarService calenderService;

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService communityService;

    @Autowired
    @Qualifier("clubServiceImpl")
    private ClubService clubService;


    @Autowired
    @Qualifier("dealServiceImpl")
    private DealService dealService;

    /*모임 일정*/

    @RequestMapping("addCalender")
    public String addCalender(@RequestParam("clubNum") int clubNum
            , Model model) {

        Club club = clubService.getClub(clubNum);

        model.addAttribute("club", club);


        return "/view/community/add/addClubCalender.jsp";
    }

    @RequestMapping("deleteClubCalender")
    public int deleteClubCalender(@RequestParam("boardNum")int boardNum){

        calenderService.deleteClubCalender(boardNum);

        return 0;
    }




    @RequestMapping(value = "addClubCalender", method = RequestMethod.POST)
    public String addClubCalender(@ModelAttribute("ClubCalendar") ClubCalendar calender,
                                  @RequestParam("clubNum") int clubNum) throws Exception {

        Club club = clubService.getClub(clubNum);

        calender.setClubNum(club.getClubNum());

        /*자동 참여*/
        if (calender.getApplyAutoCheck() == "on") {
            calender.setApplyAutoCheck("1");
        } else {
            calender.setApplyAutoCheck("2");
        }
        /*추가 참여*/
        if (calender.getCalendarApplyCheck() == "on") {
            calender.setCalendarApplyCheck("1");
        } else {
            calender.setCalendarApplyCheck("2");
        }

        /*알림 설정*/
        if (calender.getNoticeCheck() == "on") {
            calender.setNoticeCheck("1");
        } else {
            calender.setNoticeCheck("2");
        }

        System.out.println("addClubCalender 진입 " + calender);

        calenderService.addCalender(calender);


        return "/view/community/calender.jsp";
    }

    @RequestMapping("updateClubCalender")
    public String updateClubCalender(@RequestParam("boardNum")int boardNum
                                    ,Model model){

        ClubCalendar clubCalender = calenderService.getCalender(boardNum);

        model.addAttribute("clubCalender", clubCalender);

        return "/view/community/updateCalender.jsp";
    }

    @RequestMapping("getClubCalender")
    public String getClubCalender(@RequestParam("clubCalenderNum") int clubCalenderNum
            , @ModelAttribute("ClubCalendar") ClubCalendar clubCalendar
            , Model model) {

        System.out.println(clubCalenderNum);

        clubCalendar = calenderService.getCalender(clubCalenderNum);

        String[] date = clubCalendar.getClubDate().split(" ");

        clubCalendar.setClubDate(date[0]);

        model.addAttribute("clubCalender", clubCalendar);

        return "/view/community/get/getClubCalender.jsp";
    }

    @RequestMapping(value = "addClubCalenderReview", method = RequestMethod.GET)
    public String addClubCalenderReview(@RequestParam("clubCalenderNum") int clubCalenderNum
            , @RequestParam("boardCategory") String boardCategory
            , Model model) {

        ClubCalendar clubCalendar = calenderService.getCalender(clubCalenderNum);


        String[] date = clubCalendar.getClubDate().split(" ");

        clubCalendar.setClubDate(date[0]);

        model.addAttribute("clubCalendar", clubCalendar);


        if (boardCategory.equals("01")) {
            return "/view/community/add/addClubCalenderReview.jsp";
        } else if (boardCategory.equals("02")) {
            return "/view/community/add/addClubCalenderReviewShort.jsp";
        }

        return null;
    }

    /*모임 일정 후기 쇼츠*/
    @RequestMapping(value = "addClubCalenderReview", method = RequestMethod.POST)
    public String addClubCalenderReview(@ModelAttribute("clubCalenderReview") ClubCalendarReview calenderReview, HttpSession session) {


        User user = (User) session.getAttribute("user");

        System.out.println("모임 일정 후기 Data : " + calenderReview);

        calenderReview.setUserId(user.getUserId());

        if (calenderReview.getBoardCategory() == 1) {
            calenderService.addCalenderReview(calenderReview);
        } else if (calenderReview.getBoardCategory() == 2) {

        }
        return null;
    }

    /*수정 화면 navigation*/
    @RequestMapping(value = "updateClubCalenderReview", method = RequestMethod.GET)
    public String updateClubCalenderReview(@RequestParam("clubCalenderReviewNum") int clubCalenderReviewNum
            , @RequestParam("boardCategory") int boardCategory
            , @ModelAttribute("clubCalenderReview") ClubCalendarReview calenderReview, Model model) {

        calenderReview = calenderService.getCalenderReview(clubCalenderReviewNum);

        model.addAttribute("calenderReview", calenderReview);

        if (calenderReview.getBoardCategory() == 1) {
            return "/view/community/update/updateClubCalenderReview.jsp";
        } else if (calenderReview.getBoardCategory() == 2) {
            return "/view/community/update/updateClubCalenderReviewShort.jsp";
        }

        return null;
    }

    /*모임 일정 후기 수정*/
    @RequestMapping(value = "updateClubCalenderReview", method = RequestMethod.POST)
    public String updateClubCalenderReview(@ModelAttribute("clubCalenderReview") ClubCalendarReview calenderReview) {

        System.out.println("모임 일정 후기 수정 : " + calenderReview);

        calenderService.updateCalenderReview(calenderReview);
    /*    if(calenderReview.getBoardCategory() == 1){
            return "forward:/view/community/list/clubCalenderReviewList.jsp";
        } else if (calenderReview.getBoardCategory() == 2) {
            return "forward:/view/community/list/clubCalenderReviewShortList.jsp";
        }*/
        return null;
    }

    @RequestMapping("deleteClubCalenderReview")
    public String deleteClubCalenderReview(@RequestParam("calenderNum") int calenderNum) {

        System.out.println("모임 일정 번호 : " + calenderNum);

        calenderService.deleteCalenderReview(calenderNum);

        return null;
    }

    @RequestMapping("getClubCalenderReview")
    public String getClubCalenderReview(@RequestParam("clubCalenderReviewNum") int clubCalenderReviewNum,
                                        @RequestParam("boardCategory") int boardCategory,
                                        @ModelAttribute("clubCalenderReview") ClubCalendarReview calendarReview,
                                        @ModelAttribute("Comment") Comment comment,
                                        Model model) {

        calendarReview = calenderService.getCalenderReview(clubCalenderReviewNum);

        Map<String, Object> map = communityService.listComment(clubCalenderReviewNum, boardCategory);


        model.addAttribute("calenderReview", calendarReview);
        model.addAttribute("list", map.get("list"));

        System.out.println("list의 정보 : " + map.get("list"));

        return "/view/community/get/getClubCalenderReview.jsp";
    }

    @RequestMapping("listCalenderReview")
    public String listCalenderReview(@RequestParam("boardCategory") int boardCategory
            , Model model, HttpServletRequest request) {
        System.out.println(boardCategory);

        Map<String, Object> map = calenderService.listCalenderReview(boardCategory);

        model.addAttribute("list", map.get("list"));
        model.addAttribute("list2", map.get("list2"));

        if (boardCategory == 1) {
            return "forward:/view/community/list/clubCalenderReviewList.jsp";
        } else if (boardCategory == 2) {
            return "forward:/view/community/list/clubCalenderReviewShortList.jsp";
        }

        return null;


    }

    @RequestMapping("addCalenderCluber")
    public String addCalenderCluber(@RequestParam("clubNum") int clubNum
            , @ModelAttribute("search") Search search
            , Model model) {

        search.setSearchCondition("0");

        Map<String, Object> map = clubService.listCluber(search, clubNum);

        model.addAttribute("list", map.get("list"));

        return "/view/community/add/addCalenderCluber.jsp";
    }




}
