package com.project.club.controller;

import com.project.club.service.ClubCalendarService;
import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import com.project.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.mail.Multipart;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@RestController
@RequestMapping("/clubCal/json/*")
public class ClubCalendarRestController<list> {

    @Autowired
    @Qualifier("clubCalenderServiceImpl")
    private ClubCalendarService calenderService;

    /*캘린더 등록 ajax 처리*/
    @RequestMapping("addClubCalender")
    public int addClubCalender(@RequestBody ClubCalendar calender, HttpSession session) {

        User user = (User) session.getAttribute("user");

        System.out.println(calender);


        calender.setLocation("창원시 진해구 소사동");
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

        return 0;
    }

    /*모임 ajax 처리*/
    @RequestMapping("addClubCalenderReview")
    public int addClubCalenderReview(@RequestBody ClubCalendarReview calenderReview
            , HttpSession session) {

        System.out.println("모임 일정 등록 : " + calenderReview);

        User user = (User) session.getAttribute("user");

        calenderReview.setUserId(user.getUserId());

        /*category로 유효성 check*/
        if (calenderReview.getBoardCategory() == 1) {

             calenderService.addCalenderReview(calenderReview);

        } else if (calenderReview.getBoardCategory() == 2) {

             calenderService.addCalenderReview(calenderReview);
        }

        System.out.println("boardNum의 정보 : :" + calenderReview.getClubCalenderReviewNum());

        return calenderReview.getClubCalenderReviewNum();
    }

    @RequestMapping("updateClubCalenderReview")
    public int updateClubCalenderReview(@RequestBody ClubCalendarReview calendarReview) {
        System.out.println("업데이할 내용 :  " + calendarReview);

        calenderService.updateCalenderReview(calendarReview);

        return 0;
    }



    //일정 가져오기
    @RequestMapping("getListCalender")
    public List<Map<String, Object>> getListCalender(@RequestBody ClubCalendar calender) {

        System.out.println("calender의 정보 : " + calender);

        List<Map<String, Object>>  list = calenderService.getListCalender(calender);

        System.out.println("이거지~ : " + list);

        return list;
    }

    @RequestMapping("fileUpload")
    public int fileUpload(@RequestParam("form") List<MultipartFile> file
                          ,@RequestParam("boardNum") String boardNum
                          ,@RequestParam("boardCategoru") String boardCategory
                          ,HttpServletRequest request, HttpServletResponse response) {

        System.out.println("json으로 보낸 : " + file);
        System.out.println("boardNum : " + boardNum);
        System.out.println("boardCategory : " + boardCategory);

        List<Map<String, String>> fileList = new ArrayList<>();

        String fileName = null;
        for (int i = 0; i < file.size(); i++) {

            if(boardCategory.equals("01") || boardCategory.equals("02") ) {

                fileName = "/uploadFiles/clubCalendarReviewFiles/" + UUID.randomUUID() + file.get(i).getOriginalFilename();

            } else if (boardCategory.equals("03")) {

                fileName = "/uploadFiles/villBoardFiles/" + UUID.randomUUID() + file.get(i).getOriginalFilename();
            }

            System.out.println("파일 이름 : " + fileName);
            Map<String, String> map = new HashMap<>();
            map.put("fileName", fileName);
            map.put("boardNum", boardNum);
            map.put("boardCategory", boardCategory);
            fileList.add(map);
            calenderService.addFileUpload(map);

            System.out.println("파일 업로드의 정보 : " + map);
            try {
                file.get(i).transferTo(new File( fileList.get(i).get("fileName")));
                System.out.println("업로드 성공");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return 0;
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


