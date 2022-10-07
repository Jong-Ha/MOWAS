package com.project.club.controller;

import com.project.club.service.ClubCalendarService;
import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import com.project.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/clubCal/json/*")
public class ClubCalendarRestController {

    @Autowired
    @Qualifier("clubCalenderServiceImpl")
    private ClubCalendarService calenderService;

    /*캘린더 등록 ajax 처리*/
    @RequestMapping("addClubCalender")
    public int addClubCalender (@RequestBody ClubCalendar calender
                                /*, @RequestParam("file") List<MultipartFile> file*/ , HttpSession session){

        User user = (User)session.getAttribute("user");

        System.out.println(calender);

    /* List<Map<String, String>> fileList = new ArrayList<>();
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

        calender.setClubNum(10001);

        calenderService.addCalender(calender);

        return 0;
    }

    /*모임 ajax 처리*/
    @RequestMapping("addClubCalenderReview")
    public int addClubCalenderReview(@RequestBody ClubCalendarReview calenderReview
                                    ,HttpSession session) {
        System.out.println("모임 일정 등록 : " + calenderReview);

        User user = (User)session.getAttribute("user");

        calenderReview.setClubCalenderNum(10001);

        calenderReview.setUserId(user.getUserId());

        calenderReview.setClubNum(10002);

        /*category로 유효성 check*/

        if(calenderReview.getBoardCategory() == 1) {
            calenderService.addCalenderReview(calenderReview);
        }else if(calenderReview.getBoardCategory() == 2){
            calenderService.addCalenderReview(calenderReview);
        }

        /*파일 업로드*/
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
        return 0;
    }

    @RequestMapping("updateClubCalenderReview")
    public int updateClubCalenderReview(@RequestBody ClubCalendarReview calendarReview){
        System.out.println("업데이할 내용 :  " + calendarReview);

        calenderService.updateCalenderReview(calendarReview);

        return 0;
    }


}
