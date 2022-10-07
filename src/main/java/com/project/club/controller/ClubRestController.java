package com.project.club.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.club.service.ClubService;
import com.project.community.service.CommunityService;
import com.project.domain.CalendarCluber;
import com.project.domain.User;
import com.project.user.service.UserService;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/club/json/*")
public class ClubRestController {

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService communityService;

    @Autowired
    @Qualifier("clubServiceImpl")
    private ClubService clubService;

    @RequestMapping(value = "clubLike")
    public int clubLike(@RequestBody String Board, HttpSession session) throws ParseException {

        JSONParser parser = new JSONParser();

        System.out.println("likeRestController진입 : " + Board);

        User user = (User) session.getAttribute("user");
        String userId = user.getUserId();

        JSONObject jsonObj = (JSONObject)parser.parse(Board);

        String SboardNum = (String) jsonObj.get("boardNum");
        String SboardCategory = (String) jsonObj.get("boardCategory");


        int boardNum = Integer.parseInt(SboardNum);
        int boardCategory = Integer.parseInt(SboardCategory);

        /*좋아요 유무 체크*/
        String likeCheck = communityService.getLikeCheck(userId,boardNum,boardCategory);

        /*좋아요 체크가 null이면 좋아요 add*/
        if( likeCheck == null) {
            /*좋아요 add*/
            communityService.addLike(userId,boardNum,boardCategory);
            /*좋아요 체크가 y면 좋아요 count -1*/
        } else if (likeCheck.equals("y")) {

            /*좋아요 체크를 'n' 로 변경*/
            communityService.updateLike(userId,boardNum,boardCategory,"n");

            /*좋아요 체크가 n이면 실행*/
        }else if (likeCheck.equals("n")){

            /*좋아요 체크를 'y' 로 변경*/
            communityService.updateLike(userId,boardNum,boardCategory,"y");
        }
        return 0;
    }

    @RequestMapping(value = "processCluberApply", method = RequestMethod.POST)
    public int processCluberApply(@RequestBody Map<String, Object> map){
        System.out.println(map);
        int clubNum = Integer.parseInt((String) map.get("clubNum"));
        int clubUserNum = Integer.parseInt((String) map.get("clubUserNum"));
        String result = (String) map.get("result");
        clubService.updateCluberApply(clubNum, clubUserNum, result);
        return 0;
    }

    @RequestMapping(value = "getCluberApply", method = RequestMethod.POST)
    public Map<String, Object> getCluberApply(@RequestBody String data) throws IOException {
        JSONObject jsonObject = (JSONObject) JSONValue.parse(data);
        int clubUserNum = Integer.parseInt((String) jsonObject.get("clubUserNum"));
        Map<String, Object> map = new HashMap<>();
        map.put("cluberText",clubService.getCluberApply(clubUserNum));
        return map;
    }

    @RequestMapping(value = "getClubBlacklist", method = RequestMethod.POST)
    public Map<String, Object> getClubBlacklist(@RequestBody String data) throws IOException {
        JSONObject jsonObject = (JSONObject) JSONValue.parse(data);
        int clubUserNum = Integer.parseInt((String) jsonObject.get("clubUserNum"));
        Map<String, Object> map = new HashMap<>();
        map.put("blacklistText",clubService.getClubBlacklist(clubUserNum));
        return map;
    }

    @RequestMapping(value = "updateClubCalendarApply", method = RequestMethod.POST)
    public int updateClubCalendarApply(@RequestBody Map<String, Object> map){
        System.out.println(map);
        int clubCalendarApplyNum = Integer.parseInt((String) map.get("clubCalendarApplyNum"));
        String result = (String) map.get("result");
        clubService.updateClubCalendarApply(clubCalendarApplyNum, result);
        return 0;
    }

    @RequestMapping(value = "addClubCalendarApply", method = RequestMethod.POST)
    public int addClubCalendarApply(@RequestBody Map<String, Object> map){
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
        clubService.addClubCalendarApply(calendarCluber,applyAutoCheck);
        return 0;
    }

    @RequestMapping(value = "deleteClubCalendarApply", method = RequestMethod.POST)
    public int deleteClubCalendarApply(@RequestBody Map<String, Object> map){
        int clubCalendarNum = (int) map.get("clubCalendarNum");
        String userId = (String) map.get("userId");
        clubService.deleteClubCalendarApply(clubCalendarNum,userId);
        return 0;
    }

}
