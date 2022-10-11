package com.project.deal.controller;

import com.project.community.service.CommunityService;
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

@RestController
@RequestMapping("/deal/json/*")
public class DealRestController {



    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService communityService;

    @RequestMapping(value = "dealLike")
    public int dealLike(@RequestBody String Board, HttpSession session) throws ParseException {

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
}
