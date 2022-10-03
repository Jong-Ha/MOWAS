package com.project.community.controller;

import com.project.domain.Comment;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/commu/json/*")
public class CommunityRestController {

    @RequestMapping(value = "addComment", method = RequestMethod.POST)
    public String addComment(@RequestBody String comment){

        System.out.println("댓글 내용" + comment);

        return null;
    }

    @RequestMapping(value = "viewCount")
    public String viewCount(@RequestBody String viewCount) throws ParseException {

        System.out.println("조회수 : " + viewCount);

        JSONParser parser = new JSONParser();

        JSONObject jsonObj = (JSONObject) parser.parse(viewCount);

        /* json객체를 String으로 형변환후 int로 형변환*/
        String SCount = (String) jsonObj.get("viewCount");

        int Count = Integer.parseInt(SCount);

        System.out.println("json 조회수 : " + Count);

        return null;
    }

    @RequestMapping(value = "addLike")
    public String addLike(@RequestBody String like) throws ParseException {
        System.out.println("좋아요 진입 : " + like);

        JSONParser parser = new JSONParser();

        JSONObject jsonObject = (JSONObject) parser.parse(like);

        String SLike = (String)jsonObject.get("likeCount");

        int likeCount = Integer.parseInt(SLike);

        System.out.println("좋아영!!!" + likeCount);

        return null;
    }
}
