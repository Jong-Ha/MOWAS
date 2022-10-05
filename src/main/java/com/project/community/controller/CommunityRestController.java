package com.project.community.controller;

import com.project.community.service.CommunityService;
import com.project.domain.Comment;
import com.project.domain.Recomment;
import com.project.domain.VilBoard;
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
        comment.setBoardCategory("10");
        comment.setCommentCheck("n");

        System.out.println("댓글 도매인  : " + comment);

       communityService.addComment(comment);

        return null;
    }

    @RequestMapping(value = "updateComment", method = RequestMethod.POST)
    public String updateComment(@RequestBody Comment comment/*, @ModelAttribute("comment")Comment comment*/) throws ParseException {
        System.out.println(comment);

  /*      JSONParser parser = new JSONParser();

        JSONObject jsonObj = (JSONObject)parser.parse(commentText);*/

        comment.setBoardNum(10001);
        comment.setCommentNum(10001);

        System.out.println("댓글 도매인  : " + comment);

        communityService.updateComment(comment);

        return null;
    }

    @RequestMapping(value = "deleteComment", method = RequestMethod.POST)
    public String deleteComment(@RequestBody Comment comment){

        comment.setCommentCheck("y");

        System.out.println(comment);

        communityService.deleteComment(comment);

        return null;
    }
    @RequestMapping("addRecomment")
    public String addReComment(@RequestBody Recomment recomment){

        System.out.println("대댓글의 내영 : " + recomment);

        recomment.setUserId("user01");
        recomment.setBoardCategory("11");

        communityService.addRecomment(recomment);

        return null;
    }

    @RequestMapping("updateRecomment")
    public String updateRecomment(@RequestBody Recomment recomment){
        System.out.println("대댓글 수정 : " + recomment);

        recomment.setRecommentNum(10000);

        communityService.updateRecomment(recomment);
        return null;
    }

    @RequestMapping("deleteRecomment")
    public String deleteRecomment(@RequestBody Recomment recomment){

        System.out.println("대댓글 삭제 : "+ recomment);

        communityService.deleteRecomment(recomment.getRecommentNum());

        return null;
    }

    @RequestMapping(value = "viewCount")
    public int viewCount(@RequestBody VilBoard villBoard) throws ParseException {

        communityService.updateViewCount(villBoard);

        return communityService.getViewCount(villBoard.getVillBoardNum());
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
