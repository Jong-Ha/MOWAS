package com.project.club.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.club.service.ClubService;
import com.project.common.Search;
import com.project.community.service.CommunityService;
import com.project.domain.*;
import com.project.myPage.service.MyPageService;
import com.project.user.service.UserService;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/club/json/*")
public class ClubRestController {

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService communityService;

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @Autowired
    @Qualifier("clubServiceImpl")
    private ClubService clubService;

    @Autowired
    @Qualifier("myPageServiceImpl")
    private MyPageService myPageService;

    @Value("#{commonProperties['pageSize']}")
    private int pageSize;

    @RequestMapping(value = "clubLike")
    public int clubLike(@RequestBody String Board, HttpSession session) throws ParseException {

        JSONParser parser = new JSONParser();

        System.out.println("likeRestController진입 : " + Board);

        User user = (User) session.getAttribute("user");
        String userId = user.getUserId();

        JSONObject jsonObj = (JSONObject) parser.parse(Board);

        String SboardNum = (String) jsonObj.get("boardNum");
        String SboardCategory = (String) jsonObj.get("boardCategory");


        int boardNum = Integer.parseInt(SboardNum);
        int boardCategory = Integer.parseInt(SboardCategory);

        /*좋아요 유무 체크*/
        String likeCheck = communityService.getLikeCheck(userId, boardNum, boardCategory);

        /*좋아요 체크가 null이면 좋아요 add*/
        if (likeCheck == null) {
            /*좋아요 add*/
            communityService.addLike(userId, boardNum, boardCategory);
            /*좋아요 체크가 y면 좋아요 count -1*/
        } else if (likeCheck.equals("y")) {

            /*좋아요 체크를 'n' 로 변경*/
            communityService.updateLike(userId, boardNum, boardCategory, "n");

            /*좋아요 체크가 n이면 실행*/
        } else if (likeCheck.equals("n")) {

            /*좋아요 체크를 'y' 로 변경*/
            communityService.updateLike(userId, boardNum, boardCategory, "y");
        }
        return 0;
    }

    @RequestMapping(value = "processCluberApply", method = RequestMethod.POST)
    public int processCluberApply(@RequestBody Map<String, Object> map) throws Exception {
        System.out.println(map);
        int clubNum = Integer.parseInt((String) map.get("clubNum"));
        int clubUserNum = Integer.parseInt((String) map.get("clubUserNum"));
        String userId = (String) map.get("userId");
        String result = (String) map.get("result");
        clubService.updateCluberApply(clubNum, clubUserNum, userId, userService.getUser(userId).getUserImage(), result);
        return 0;
    }

    @RequestMapping(value = "getCluberApply", method = RequestMethod.POST)
    public Map<String, Object> getCluberApply(@RequestBody String data) throws IOException {
        JSONObject jsonObject = (JSONObject) JSONValue.parse(data);
        int clubUserNum = Integer.parseInt((String) jsonObject.get("clubUserNum"));
        Map<String, Object> map = new HashMap<>();
        map.put("cluberText", clubService.getCluberApply(clubUserNum));
        return map;
    }

    @RequestMapping(value = "getClubBlacklist", method = RequestMethod.POST)
    public Map<String, Object> getClubBlacklist(@RequestBody String data) throws IOException {
        JSONObject jsonObject = (JSONObject) JSONValue.parse(data);
        int clubUserNum = Integer.parseInt((String) jsonObject.get("clubUserNum"));
        Map<String, Object> map = new HashMap<>();
        map.put("blacklistText", clubService.getClubBlacklist(clubUserNum));
        return map;
    }

    @RequestMapping(value = "updateClubCalendarApply", method = RequestMethod.POST)
    public int updateClubCalendarApply(@RequestBody Map<String, Object> map) {
        System.out.println(map);
        int clubCalendarApplyNum = Integer.parseInt((String) map.get("clubCalendarApplyNum"));
        String result = (String) map.get("result");
        clubService.updateClubCalendarApply(clubCalendarApplyNum, result);
        return 0;
    }

    @RequestMapping(value = "addClubCalendarApply", method = RequestMethod.POST)
    public int addClubCalendarApply(@RequestBody Map<String, Object> map) {
        int clubCalendarNum = (int) map.get("clubCalendarNum");
        String userId = (String) map.get("userId");
        String userImage = (String) map.get("userImage");
        String applyAutoCheck = (String) map.get("applyAutoCheck");
        User user = new User();
        user.setUserImage(userImage);
        user.setUserId(userId);
        CalendarCluber calendarCluber = new CalendarCluber();
        calendarCluber.setUser(user);
        calendarCluber.setClubCalendarNum(clubCalendarNum);
        clubService.addClubCalendarApply(calendarCluber, applyAutoCheck);
        return 0;
    }

    @RequestMapping(value = "deleteClubCalendarApply", method = RequestMethod.POST)
    public int deleteClubCalendarApply(@RequestBody Map<String, Object> map) {
        int clubCalendarNum = (int) map.get("clubCalendarNum");
        String userId = (String) map.get("userId");
        clubService.deleteClubCalendarApply(clubCalendarNum, userId);
        return 0;
    }

//    @RequestMapping(value = "addVoter", method = RequestMethod.POST)
//    public boolean addVoter(@RequestBody Map<String, Object> map) {
//        List<String> voterItems = (List<String>) map.get("voterItems");
//        String userId = (String) map.get("userId");
//        int voteNum = (int) map.get("voteNum");
//        try {
//            clubService.addVoter(voterItems, userId, voteNum);
//            return true;
//        } catch (Exception e) {
//            return false;
//        }
//    }

    @RequestMapping(value = "listVoter", method = RequestMethod.POST)
    public List<Voter> listVoter(@RequestBody Map<String, Object> map) {
        Voter voter = new Voter();
        String voteItem = (String) map.get("voteItem");
        int voteNum = (int) map.get("voteNum");
        voter.setVoteItem(voteItem);
        voter.setVoteNum(voteNum);

        return clubService.listVoter(voter);
    }

    @RequestMapping(value = "getCalendarCluberCondition",method = RequestMethod.POST)
    public Map<String, Object> getCalendarCluberCondition(@RequestBody Map<String, Object> map){
        System.out.println(map);
        int clubCalendarNum = (int) map.get("clubCalendarNum");
        String userId = (String) map.get("userId");
        map.put("condition",clubService.getCalendarCluberCondition(clubCalendarNum,userId));
        return map;
    }

    @RequestMapping(value = "listClub")
//    public Model listClub(Model model, @ModelAttribute("search") Search search) throws Exception {
        public Map<String ,Object> listClub(@RequestBody Map<String ,Object> map) throws Exception {

        Search search = new Search();

        if(map.get("currentPage")!=null){
            int currentPage = Integer.parseInt((String)map.get("currentPage"));
            search.setCurrentPage(currentPage);
            if (currentPage == 0) {
                search.setCurrentPage(1);
            }
        }

        String userId = "";
        String searchLocation = "";
        List<String> searchTag = null;
        List<String> searchInterList = null;

        if(map.get("userId")!=null){
            userId = (String)map.get("userId");
        }

        search.setPageSize(pageSize);
        if(map.get("searchLocation")!=null){
            searchLocation = (String)map.get("searchLocation");
        }

        if(map.get("searchTag")!=null){
            searchTag = (List<String>)map.get("searchTag");
        }

        if(map.get("searchInterList")!=null){
            searchInterList = (List<String>)map.get("searchInterList");
        }

        if (!userId.equals("")) {
            if(searchLocation.equals("")){
                searchLocation = userService.getUser(userId).getVillCode();
                searchInterList = new ArrayList<>();
                for(UserInterList uil : (List<UserInterList>) myPageService.getMyInfor(userId).get("interList")){
                    String str = null;
                    int item = Integer.parseInt(uil.getInterList().trim());
                    if(item<10){
                        str = "0"+item;
                    }else {
                        str = ""+item;
                    }
                    searchInterList.add(str);
                }
            }
        }else {
            userId = "";
            if(searchLocation==null){
                searchLocation="역삼1동";
            }
        }
        List<Club> list = clubService.listClub(userId,search,searchLocation,searchInterList,searchTag);
        for(Club club : list){
            club.parseInterList();
        }
        map.put("list", list);
        return map;
    }
//    @RequestMapping(value = "updateVoter", method = RequestMethod.POST)
//    public boolean updateVoter(@RequestBody Map<String, Object> map) {
//        List<String> voterItems = (List<String>) map.get("voterItems");
//        String userId = (String) map.get("userId");
//        int voteNum = (int) map.get("voteNum");
//        try {
//            clubService.updateVoter(voterItems, userId, voteNum);
//            return true;
//        } catch (Exception e) {
//            return false;
//        }
//    }

}
