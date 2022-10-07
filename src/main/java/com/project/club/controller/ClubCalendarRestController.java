package com.project.club.controller;

import com.project.club.service.ClubCalendarService;
import com.project.domain.ClubCalendarReview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/clubCal/json/*")
public class ClubCalendarRestController {

    @Autowired
    @Qualifier("clubCalenderServiceImpl")
    private ClubCalendarService calenderService;


    @RequestMapping("updateClubCalenderReview")
    public int updateClubCalenderReview(@RequestBody ClubCalendarReview calendarReview){
        System.out.println("업데이할 내용 :  " + calendarReview);

        calenderService.updateCalenderReview(calendarReview);

        return 0;
    }
}
