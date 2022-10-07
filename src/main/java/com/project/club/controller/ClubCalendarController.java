package com.project.club.controller;

import com.project.club.service.ClubCalendarService;
import com.project.community.service.CommunityService;
import com.project.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
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

    /*모임 일정*/
    @RequestMapping(value = "addClubCalender", method = RequestMethod.POST)
    public String addClubCalender(@ModelAttribute("ClubCalendar") ClubCalendar calender,
                                  @RequestParam("file") List<MultipartFile> file) throws Exception {
        calender.setClubNum(10008);

        calender.setLocation("창원시 진해구 소사동");
        /*자동 참여*/
        if(calender.getApplyAutoCheck()  == "on" ){
            calender.setApplyAutoCheck("1");
        }else {
            calender.setApplyAutoCheck("2");
        }
        /*추가 참여*/
        if(calender.getCalendarApplyCheck() == "on" ){
            calender.setCalendarApplyCheck("1");
        }else{
            calender.setCalendarApplyCheck("2");
        }

        /*알림 설정*/
        if (calender.getNoticeCheck() == "on"){
            calender.setNoticeCheck("1");
        }else{
            calender.setNoticeCheck("2");
        }

        System.out.println("addClubCalender 진입 " + calender);

        calenderService.addCalender(calender);
/*
        System.out.println("파일 업로드 진입 : " + file);

        List<Map<String, String>> fileList = new ArrayList<>();
        for (int i = 0; i < file.size(); i++) {
            String fileName = file.get(i).getOriginalFilename();
            System.out.println("파일 이름 : " + fileName);
            Map<String, String> map = new HashMap<>();
            map.put("fileName", fileName);
            fileList.add(map);

            try {
                file.get(i).transferTo(new File("/uploadFiles/" + fileList.get(i).get("fileName")));
                System.out.println("업로드 성공");
            } catch (Exception e) {
                e.printStackTrace();
            }
       }*/


        return "/view/community/calender.jsp";
    }

    @RequestMapping(value = "getCalender")
    public String getCalender(){

        int clubNum = 2;

        String getCalender = calenderService.getCalender(clubNum);
        return null;
    }



    /*모임 일정 후기 쇼츠*/
    @RequestMapping(value = "addClubCalenderReview", method = RequestMethod.POST)
    public String addClubCalenderReview(@ModelAttribute("clubCalenderReview") ClubCalendarReview calenderReview
            /*, @RequestParam("file") List<MultipartFile> file*/ ,HttpSession session) {

      /*  System.out.println("파일 업로드 진입 : " + file);*/

        User user = (User)session.getAttribute("user");

        System.out.println("모임 일정 후기 Data : " + calenderReview);


        /*  List<Map<String, String>> fileList = new ArrayList<>();
        for (int i = 0; i < file.size(); i++) {
            String fileName = file.get(i).getOriginalFilename();
            System.out.println("파일 이름 : " + fileName);
            Map<String, String> map = new HashMap<>();
            map.put("fileName", fileName);
            fileList.add(map);

            try {
                file.get(i).transferTo(new File("/uploadFiles/" + fileList.get(i).get("fileName")));
                System.out.println("업로드 성공");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }*/

        calenderReview.setClubCalenderNum(10001);

        calenderReview.setUserId(user.getUserId());

        calenderReview.setClubNum(10002);

        if(calenderReview.getBoardCategory() == 1) {
            calenderService.addCalenderReview(calenderReview);
        }else if(calenderReview.getBoardCategory() == 2){

        }
        return null;
    }

    /*수정 화면 navigation*/
    @RequestMapping(value = "updateClubCalenderReview", method = RequestMethod.GET)
    public String updateClubCalenderReview(@RequestParam("clubCalenderReviewNum")int clubCalenderReviewNum
                                            ,@RequestParam("boardCategory")int boardCategory
                                            ,@ModelAttribute("clubCalenderReview")ClubCalendarReview calenderReview ,Model model){

        calenderReview = calenderService.getCalenderReview(clubCalenderReviewNum);

        model.addAttribute("calenderReview",calenderReview);

        if (calenderReview.getBoardCategory() == 1){
            return "/view/community/update/updateClubCalenderReview.jsp";
        } else if (calenderReview.getBoardCategory() == 2) {
            return "/view/community/update/updateClubCalenderReviewShort.jsp";
        }

       return null;
    }

    /*모임 일정 후기 수정*/
    @RequestMapping(value = "updateClubCalenderReview", method = RequestMethod.POST)
    public String updateClubCalenderReview(@ModelAttribute("clubCalenderReview") ClubCalendarReview calenderReview){

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
    public String deleteClubCalenderReview(@RequestParam("calenderNum")int calenderNum){

        System.out.println("모임 일정 번호 : " + calenderNum);

        calenderService.deleteCalenderReview(calenderNum);

        return null;
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

    @RequestMapping("listCalenderReview")
    public String listCalenderReview(@RequestParam("boardCategory")int boardCategory
                                    ,Model model,HttpServletRequest request){
        System.out.println(boardCategory);
        Map<String, Object> map = calenderService.listCalenderReview(boardCategory);

        model.addAttribute("list", map.get("list"));

        if (boardCategory == 1){
            return "forward:/view/community/list/clubCalenderReviewList.jsp";
        } else if (boardCategory == 2) {
            return "forward:/view/community/list/clubCalenderReviewShortList.jsp";
        }

        return null;

    }
}
