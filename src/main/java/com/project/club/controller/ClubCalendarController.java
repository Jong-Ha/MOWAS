package com.project.club.controller;

import com.project.club.service.ClubCalendarService;
import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
@RequestMapping("clubcal")
public class ClubCalendarController {

    @Autowired
    @Qualifier("clubCalenderServiceImpl")
    private ClubCalendarService clenderService;

    @RequestMapping(value = "addClubCalender", method = RequestMethod.POST)
    public String addClubCalender(@ModelAttribute("ClubCalendar") ClubCalendar commu) throws Exception {
        System.out.println("addClubCalender 진입 " + commu);
        commu.setClubNum(3);
        //commuService.addClubCalender(commu);
        return "/view/community/calender.jsp";
    }

    @RequestMapping(value = "addClubCalenderReviewShort", method = RequestMethod.POST)
    public String addClubCalenderReviewShort(@ModelAttribute("clubCalenderReviewShort") ClubCalendarReview calendeReview
            , @RequestParam("file") List<MultipartFile> file) {

        System.out.println("파일 업로드 진입 : " + file);

        List<Map<String, String>> fileList = new ArrayList<>();
        for (int i = 0; i < file.size(); i++) {
            String fileName = file.get(i).getOriginalFilename();

            Map<String, String> map = new HashMap<>();
            map.put("fileName", fileName);
            fileList.add(map);

            try {
                file.get(i).transferTo(new File("/resources/uploadFiles/" + fileList.get(i).get("fileName")));
                System.out.println("업로드 성공");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return null;
    }
}
