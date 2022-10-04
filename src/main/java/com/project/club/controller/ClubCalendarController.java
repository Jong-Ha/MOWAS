package com.project.club.controller;

import com.project.club.service.ClubCalendarService;
import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
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

    /*모임 일정*/

    /*모임 일정 후기 쇼츠*/
    @RequestMapping(value = "addClubCalenderReview", method = RequestMethod.POST)
    public String addClubCalenderReview(@ModelAttribute("clubCalenderReview") ClubCalendarReview calendeReview
            , @RequestParam("file") List<MultipartFile> file) {

        System.out.println("파일 업로드 진입 : " + file);
        System.out.println("모임 일정 후기 Data : " + calendeReview);


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
        }

        calendeReview.setClubCalenderNum(10001);
        calendeReview.setClubNum(10008);
        calendeReview.setUserId("user01");
        calendeReview.setBoardCategory(2);

        calenderService.addCalenderReview(calendeReview);

        return null;
    }
}
