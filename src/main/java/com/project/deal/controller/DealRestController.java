package com.project.deal.controller;

import com.project.club.service.ClubService;
import com.project.community.service.CommunityService;
import com.project.deal.service.DealService;
import com.project.domain.Deal;
import com.project.domain.User;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/deal/json/*")
public class DealRestController {


    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService communityService;
    @Autowired
    @Qualifier("dealServiceImpl")
    private DealService dealService;

    @RequestMapping(value = "dealLike")
    public Map<String, Object> dealLike(@RequestBody String Board, HttpSession session) throws ParseException {

        JSONParser parser = new JSONParser();

        System.out.println("likeRestController진입 : " + Board);

        User user = (User) session.getAttribute("user");
        String userId = user.getUserId();

        Map<String, Object> map = new HashMap<>();

        JSONObject jsonObj = (JSONObject)parser.parse(Board);

        String SboardNum = (String) jsonObj.get("boardNum");
        String SboardCategory = (String) jsonObj.get("boardCategory");

        System.out.println(SboardNum);
        System.out.println(SboardCategory);
        int boardNum = Integer.parseInt(SboardNum);
        int boardCategory = Integer.parseInt(SboardCategory);

        /*좋아요 유무 체크*/
        String likeCheck = communityService.getLikeCheck(userId,boardNum,boardCategory);
        System.out.println("왕아아아아좋아여ㅛ 유뭇"+likeCheck);
        /*좋아요 체크가 null이면 좋아요 add*/
        if( likeCheck == null) {
            /*좋아요 add*/
            communityService.addLike(userId,boardNum,boardCategory);
            String like =  communityService.getLikeCheck(userId,boardNum,boardCategory);
            map.put("like" , like);
            return map;
                    //좋아요 체크가 y면 좋아요 count -1*/
        } else if (likeCheck.equals("y")) {

            /*좋아요 체크를 'n' 로 변경*/
            communityService.updateLike(userId,boardNum,boardCategory,"n");
            String like =  communityService.getLikeCheck(userId,boardNum,boardCategory);
            map.put("like" , like);
            return map;
            /*좋아요 체크가 n이면 실행*/
        }else if (likeCheck.equals("n")){
            /*좋아요 체크를 'y' 로 변경*/
            communityService.updateLike(userId,boardNum,boardCategory,"y");
            String like =  communityService.getLikeCheck(userId,boardNum,boardCategory);
            map.put("like" , like);
            return map;

        }
        return null;
    }
    @RequestMapping("getLikeCheck")
    public Map getLikeCheck(@RequestBody String Board, HttpSession session) throws ParseException {
        JSONParser parser = new JSONParser();

        System.out.println("likeRestController진입 : " + Board);

        User user = (User) session.getAttribute("user");
        String userId = user.getUserId();

        Map<String, Object> map = new HashMap<>();

        JSONObject jsonObj = (JSONObject)parser.parse(Board);

        String SboardNum = (String) jsonObj.get("boardNum");
        String SboardCategory = (String) jsonObj.get("boardCategory");

        System.out.println(SboardNum);
        System.out.println(SboardCategory);
        int boardNum = Integer.parseInt(SboardNum);
        int boardCategory = Integer.parseInt(SboardCategory);
        String like =  communityService.getLikeCheck(userId,boardNum,boardCategory);
        map.put("like" , like);
        return map;
    }
}
