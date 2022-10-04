package com.project.community.controller;

import com.project.community.service.CommunityService;
import com.project.domain.Comment;
import com.project.domain.Recomment;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/commu/json/*")
public class CommunityRestController {

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService communityService;

    /* 댓글 대댓글*/
    @RequestMapping(value = "addComment", method = RequestMethod.POST)
    public String addComment(@RequestBody Comment comment/*, @ModelAttribute("comment")Comment comment*/) throws ParseException {
        System.out.println(comment);

  /*      JSONParser parser = new JSONParser();

        JSONObject jsonObj = (JSONObject)parser.parse(commentText);*/

        comment.setUserId("user01");
        comment.setBoardNum(10001);
        comment.setBoardCategory("1");
        comment.setBoardCategory("1");
        comment.setCommentCheck("n");

        System.out.println("댓글 도매인  : " + comment);

       communityService.addComment(comment);

        return null;
    }
    @RequestMapping("addRecomment")
    public String addReComment(@RequestBody Recomment recomment){

        System.out.println("대댓글의 내영 : " + recomment);

        recomment.setCommentNum(10000);
        recomment.setUserId("user01");
        recomment.setBoardCategory("1");

        communityService.addRecomment(recomment);

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
