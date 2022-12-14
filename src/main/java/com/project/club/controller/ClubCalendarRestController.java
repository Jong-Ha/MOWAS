package com.project.club.controller;

import com.project.club.service.ClubCalendarService;
import com.project.club.service.ClubService;
import com.project.common.Search;
import com.project.community.service.CommunityService;
import com.project.deal.service.DealService;
import com.project.domain.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.mail.Multipart;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/clubCal/json/*")
public class ClubCalendarRestController<list> {

    @Autowired
    @Qualifier("clubCalenderServiceImpl")
    private ClubCalendarService calenderService;

    @Autowired
    @Qualifier("clubServiceImpl")
    private ClubService clubService;

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService communityService;

    @Autowired
    @Qualifier("dealServiceImpl")
    private DealService dealService;

    @Value("#{commonProperties['pageSize']}")
    int pageSize;


    /*캘린더 등록 ajax 처리*/
    @RequestMapping("addClubCalender")
    public int addClubCalender(@RequestBody ClubCalendar calender
            , HttpSession session) {

        User user = (User) session.getAttribute("user");

        calender.setBoardCategory(5);

        System.out.println("=================" + calender.getApplyAutoCheck() + "==================");
        /*자동 참여*/
        if (calender.getApplyAutoCheck().equals("true")) {
            calender.setApplyAutoCheck("1");
        } else {
            calender.setApplyAutoCheck("2");
        }
        /*추가 참여*/
        if (calender.getCalendarApplyCheck().equals("true")) {
            calender.setCalendarApplyCheck("1");
        } else {
            calender.setCalendarApplyCheck("2");
        }

        System.out.println("addClubCalender 진입 " + calender);


        calenderService.addCalender(calender);

        return calender.getClubCalenderNum();
    }

    @RequestMapping("addCluber")
    public int addCluber(@RequestBody Map<String, Object> map) {

        System.out.println("클럽 맴버 : " + map.get("cluberList"));
        System.out.println("클럽 맴버 : " + map.get("clubCalenderNum"));


        List<String> list = (List<String>) map.get("cluberList");


        clubService.addCalendarCluber((Integer) map.get("clubCalenderNum"), list);


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

    @RequestMapping("getClubCalender")
    public Map<String, Object> clubCalendar(@RequestBody ClubCalendar clubCalendar) {
        Map<String, Object> map = new HashMap<>();

        clubCalendar = calenderService.getCalender(clubCalendar.getClubCalenderNum());

        String[] date = clubCalendar.getClubDate().split(" ");

        clubCalendar.setClubDate(date[0]);


        map.put("clubCalendar", clubCalendar);

        return map;
    }


    //일정 가져오기
    @RequestMapping("getListCalender")
    public List<Map<String, Object>> getListCalender(@RequestBody ClubCalendar calender) {

        System.out.println("calender의 정보 : " + calender);

        List<Map<String, Object>> list = calenderService.getListCalender(calender);

        System.out.println("이거지~ : " + list);

        return list;
    }

    @RequestMapping("updateClubCalender")
    public int updateClubCalender(@RequestBody ClubCalendar clubCalendar) {

        System.out.println(clubCalendar);
        if (clubCalendar.getApplyAutoCheck().equals("true")) {
            clubCalendar.setApplyAutoCheck("1");
        } else {
            clubCalendar.setApplyAutoCheck("2");
        }
        /*추가 참여*/
        if (clubCalendar.getCalendarApplyCheck().equals("true")) {
            clubCalendar.setCalendarApplyCheck("1");
        } else {
            clubCalendar.setCalendarApplyCheck("2");
        }


        System.out.println("updateClubCalender 진입 " + clubCalendar);

        calenderService.updateClubCalender(clubCalendar);

        return 0;
    }

    @RequestMapping("listClubCalendarReview")
    public Map<String,Object> listClubCalendarReview(@RequestBody Map<String, Object> map){

        Search search = new Search();
        ClubCalendarReview calendarReview = new ClubCalendarReview();

        if(map.get("currentPage")!= null){
            int currentPage = Integer.parseInt((String)map.get("currentPage"));
            search.setCurrentPage(currentPage);
            if (currentPage == 0){
                search.setCurrentPage(1);
            }
        }

        if(map.get("searchCondition") != null){
            String searchCondition = (String) map.get("searchCondition");
            search.setSearchCondition(searchCondition);
        }
        search.setPageSize(pageSize);
        if(map.get("searchKeyword")!=null){
            String searchKeyword = (String) map.get("searchKeyword");
            search.setSearchKeyword(searchKeyword);
        }

        String SboardCategory = (String) map.get("boardCategory");
        String SreviewRange = (String) map.get("reviewRange");


        Map<String,Object> map2 =  calenderService.listCalenderReview(Integer.parseInt(SboardCategory),search,Integer.parseInt(SreviewRange));

        System.out.println(map2.get("list"));

        return map2;
    }

    @RequestMapping("deleteClubCalender")
    public int deleteClubCalender(@RequestBody ClubCalendar clubCalendar) {

        calenderService.deleteClubCalender(clubCalendar.getClubCalenderNum());

        return 0;
    }

    @RequestMapping("getDealCalender")
    public Map<String, Object> getDealCalender(@RequestBody Deal deal ,HttpSession session) throws Exception {

        System.out.println(deal.getDealBoardNum());

        Map<String, Object> map = new HashMap<>();

        deal = dealService.getDeal(deal.getDealBoardNum());

        System.out.println("==============="+ deal);

        map.put("deal", deal);
        System.out.println(deal.getDealId());
        System.out.println("deaojfa;e"+map);
        return map;

    }

    @RequestMapping(value = "addDealCalender", method = RequestMethod.POST)
    public int addDealCalender(@RequestBody Deal deal) {

        deal.setDealModeCheck(1);

        System.out.println("일정 정보 : " + deal);

        calenderService.addDealCalender(deal);

        return 0;
    }

    @RequestMapping("updateDealCalender")
    public String dealUpdateCalender(@RequestBody Deal deal) {



        System.out.println("일정 정보 : " + deal);

        calenderService.dealUpdateCalender(deal);


        return null;
    }

    @RequestMapping(value = "getListDealCalender", method = RequestMethod.POST)
    public List<Map<String, Object>> getListDealCalender(@RequestBody String userId) throws ParseException {


        JSONParser parser = new JSONParser();

        JSONObject jsonObj = (JSONObject) parser.parse(userId);

        String user = (String) jsonObj.get("userId");

        System.out.println("getlistDealcalender진입 : " + user);

        List<Map<String, Object>> list = communityService.getListDealCalender(user);

        System.out.println(list);

        return list;

    }


    @RequestMapping("getClubCalenderReview")
    public Map<String, Object> getClubCalender(@RequestBody ClubCalendarReview clubCalendar) {

        System.out.println(clubCalendar);

        clubCalendar = calenderService.getCalenderReview(clubCalendar.getClubCalenderReviewNum());

        Map<String, Object> map = new HashMap<>();

        map.put("clubCalender", clubCalendar);

        return map;
    }


    @RequestMapping("updateClubCalenderReview")
    public int updateClubCalenderReview(@RequestBody ClubCalendarReview calendarReview) {
        System.out.println("업데이할 내용 :  " + calendarReview);

        calenderService.updateCalenderReview(calendarReview);

        return 0;
    }


    @RequestMapping("fileUpload")
    public int fileUpload(@RequestParam("form") List<MultipartFile> file
            , @RequestParam("boardNum") String boardNum
            , @RequestParam("boardCategoru") String boardCategory
            , HttpServletRequest request, HttpServletResponse response) {

        System.out.println("json으로 보낸 : " + file);
        System.out.println("boardNum : " + boardNum);
        System.out.println("boardCategory : " + boardCategory);

        List<Map<String, String>> fileList = new ArrayList<>();

        String fileName = null;
        for (int i = 0; i < file.size(); i++) {

            if (boardCategory.equals("1") || boardCategory.equals("2")) {

                fileName = "/uploadFiles/clubCalendarReviewFiles/" + UUID.randomUUID() + file.get(i).getOriginalFilename();

            } else if (boardCategory.equals("3")) {

                fileName = "/uploadFiles/villBoardFiles/" + UUID.randomUUID() + file.get(i).getOriginalFilename();

            } else if (boardCategory.equals("05"))
                fileName = "/uploadFiles/clubCalendar/" + UUID.randomUUID() + file.get(i).getOriginalFilename();

            System.out.println("파일 이름 : " + fileName);
            Map<String, String> map = new HashMap<>();
            map.put("fileName", fileName);
            map.put("boardNum", boardNum);
            map.put("boardCategory", boardCategory);
            fileList.add(map);
            calenderService.addFileUpload(map);

            System.out.println("파일 업로드의 정보 : " + map);
            try {
                file.get(i).transferTo(new File(fileList.get(i).get("fileName")));
                System.out.println("업로드 성공");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return 0;
    }

    @RequestMapping("fileUpdate")
    public int fileUpdate(@RequestParam("form") List<MultipartFile> file
            , @RequestParam("boardNum") int boardNum
            , @RequestParam("boardCategoru") String boardCategory) {

        calenderService.deleteFile(boardNum);

        System.out.println("파일 업로드 진입 : " + file);

        List<Map<String, String>> fileList = new ArrayList<>();

        String fileName = null;

        for (int i = 0; i < file.size(); i++) {

            if (boardCategory.equals("1") || boardCategory.equals("2")) {


                fileName = "/uploadFiles/clubCalendarReviewFiles/" + UUID.randomUUID() + file.get(i).getOriginalFilename();

            } else if (boardCategory.equals("3")) {

                fileName = "/uploadFiles/villBoardFiles/" + UUID.randomUUID() + file.get(i).getOriginalFilename();

            } else if (boardCategory.equals("05"))

                fileName = "/uploadFiles/clubCalendar/" + UUID.randomUUID() + file.get(i).getOriginalFilename();


            System.out.println(fileName);
            Map<String, String> map = new HashMap<>();

            map.put("fileName", fileName);
            map.put("boardNum", String.valueOf(boardNum));
            map.put("boardCategory", boardCategory);

            fileList.add(map);

            calenderService.addFileUpload(map);

            System.out.println("파일 업로드의 정보 : " + map);
            try {
                file.get(i).transferTo(new File(fileList.get(i).get("fileName")));

                System.out.println("수정 성공");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return 0;

    }

    @RequestMapping("addCalenderCluber")
    public Map<String,Object> addCalenderCluber(@RequestBody Map<String,Object>map){

        System.out.println("진입 : " + map.get("clubNum"));

        Search search = new Search();

        search.setSearchCondition("0");

        String SclubNum = (String) map.get("clubNum");


        return clubService.listCluber(search, Integer.parseInt(SclubNum));
    }



    @RequestMapping("getListCluber")
    public Map<String, Object> getListCluber(@RequestBody String user) throws ParseException {

        JSONParser parser = new JSONParser();

        JSONObject json = (JSONObject) parser.parse(user);

        String userId = (String) json.get("userId");

        System.out.println(userId);

        Map<String, Object> map = clubService.getListCluber(userId);

        System.out.println(map);

        return map;
    }

    @RequestMapping("getListCluberCalender")
    public List<Map<String, Object>> getListCluberCalender(@RequestBody String clubCalenderNum) throws ParseException {

        JSONParser parser = new JSONParser();

        JSONObject json = (JSONObject) parser.parse(clubCalenderNum);

        String ScalenderNum = String.valueOf(json.get("clubCalendarNum"));

        int calenderNum = Integer.parseInt(ScalenderNum);

        System.out.println(calenderNum);

        List<Map<String, Object>> list = calenderService.getListCluberCalender(calenderNum);

        System.out.println("============" + list + "============");

        return list;
    }


}


