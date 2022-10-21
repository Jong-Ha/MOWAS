package com.project.community.controller;

import com.project.club.service.ClubCalendarService;
import com.project.community.service.CommunityService;
import com.project.domain.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/commu/json/*")
public class CommunityRestController {

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService communityService;

    @Autowired
    @Qualifier("clubCalenderServiceImpl")
    private ClubCalendarService calendarService;

    /* 댓글 대댓글*/
    @RequestMapping(value = "addComment", method = RequestMethod.POST)
    public int addComment(@RequestBody Comment comment
                        ,HttpSession session) throws ParseException {
        System.out.println(comment);

        User user = (User)session.getAttribute("user");

        comment.setUserId(user.getUserId());
        comment.setCommentCheck("n");


       communityService.addComment(comment);

        return 0;
    }

    @RequestMapping(value = "updateComment", method = RequestMethod.POST)
    public int updateComment(@RequestBody Comment comment/*, @ModelAttribute("comment")Comment comment*/) throws ParseException {
        System.out.println(comment);

  /*      JSONParser parser = new JSONParser();

        JSONObject jsonObj = (JSONObject)parser.parse(commentText);*/

        System.out.println("댓글 도매인  : " + comment);

        communityService.updateComment(comment);

        return 0;
    }

    @RequestMapping(value = "deleteComment", method = RequestMethod.POST)
    public int deleteComment(@RequestBody Comment comment){

        comment.setCommentCheck("y");

        System.out.println(comment);

        communityService.deleteComment(comment);

        return 0;
    }
    @RequestMapping("addRecomment")
    public int addReComment(@RequestBody Recomment recomment
                            ,HttpSession session){


        User user = (User)session.getAttribute("user");

        System.out.println("대댓글의 내영 : " + recomment);

        recomment.setUserId(user.getUserId());
        recomment.setBoardCategory("11");

        communityService.addRecomment(recomment);

        return 0;
    }

    @RequestMapping("updateRecomment")
    public int updateRecomment(@RequestBody Recomment recomment){
        System.out.println("대댓글 수정 : " + recomment);

        communityService.updateRecomment(recomment);

        return 0;
    }

    @RequestMapping("deleteRecomment")
    public int deleteRecomment(@RequestBody Recomment recomment){

        System.out.println("대댓글 삭제 : "+ recomment);

        communityService.deleteRecomment(recomment.getRecommentNum());

        return 0;
    }

    @RequestMapping("getListComment")
    public Map<String, Object> getListComment(@RequestBody Map<String, Object> map){

        Map<String, Object> map2 =
                communityService.listComment(Integer.parseInt((String) map.get("boardNum")),
                                            Integer.parseInt((String) map.get("boardCategory")));

        System.out.println(map2);

        return map2;
    }

    @RequestMapping(value = "viewCount")
    public int viewCount(@RequestBody String Board) throws ParseException {

        JSONParser parser = new JSONParser();

        System.out.println("viewCount : " + Board);

        JSONObject jsonObj = (JSONObject)parser.parse(Board);

        String SboardNum = (String) jsonObj.get("boardNum");
        String SboardCategory = (String) jsonObj.get("boardCategory");
        String SviewCount = (String) jsonObj.get("viewCount");

        int boardNum = Integer.parseInt(SboardNum);
        int boardCategory = Integer.parseInt(SboardCategory);
        int viewCount = Integer.parseInt(SviewCount);

        communityService.updateViewCount(boardNum,viewCount,boardCategory);

        return communityService.getViewCount(boardNum,boardCategory);
    }

    @RequestMapping(value = "addLike")
    public int addLike(@RequestBody String Board
                        ,HttpSession session) throws ParseException {

        JSONParser parser = new JSONParser();

        System.out.println("likeRestController진입 : " + Board);

        JSONObject jsonObj = (JSONObject)parser.parse(Board);

        String SboardNum = (String) jsonObj.get("boardNum");
        String SboardCategory = (String) jsonObj.get("boardCategory");
        String SlikeCount = (String) jsonObj.get("likeCount");


        int boardNum = Integer.parseInt(SboardNum);
        int boardCategory = Integer.parseInt(SboardCategory);
        int likeCount = Integer.parseInt(SlikeCount.trim());

        System.out.println(likeCount);

        /*String userId = session.getAttribute("userId");*/
        User user = (User)session.getAttribute("user");

        String userId = user.getUserId();

        /*좋아요 유무 체크*/
        String likeCheck = communityService.getLikeCheck(userId,boardNum,boardCategory);

        /*좋아요 체크가 null이면 좋아요 add*/
        if( likeCheck == null) {
            /*게시글에 좋아요 count +1*/
            communityService.updateLikeCount(boardNum,boardCategory,likeCount);

            /*좋아요 add*/
            communityService.addLike(userId,boardNum,boardCategory);

            /*좋아요 count 화면으로 return*/
            return communityService.getLikeCount(boardNum, boardCategory);

         /*좋아요 체크가 y면 좋아요 count -1*/
        } else if (likeCheck.equals("y")) {

            /*좋아요 count -1*/
            communityService.deleteLikeCount(boardNum,boardCategory,likeCount);

            /*좋아요 체크를 'n' 로 변경*/
            communityService.updateLike(userId,boardNum,boardCategory,"n");

            /*좋아요 count 화면으로 return*/
            return communityService.getLikeCount(boardNum,boardCategory);
           /*좋아요 체크가 n이면 실행*/
        }else if (likeCheck.equals("n")){
            /*게시글에 좋아요 count +1*/
            communityService.updateLikeCount(boardNum,boardCategory,likeCount);

            /*좋아요 체크를 'y' 로 변경*/
            communityService.updateLike(userId,boardNum,boardCategory,"y");
            /*좋아요 count 화면으로 return*/
            return communityService.getLikeCount(boardNum,boardCategory);
        }

        return 0;
    }

    @RequestMapping(value = "addVillBoard" , method =  RequestMethod.POST)
    public int addVillBarod(@RequestBody VilBoard villBoard, HttpSession session){
        System.out.println(villBoard);

        User user = (User)session.getAttribute("user");

        villBoard.setUserId(user.getUserId());
        villBoard.setVillCode("창원");

        communityService.addVillBoard(villBoard);

        return villBoard.getVillBoardNum();
    }

    @RequestMapping(value = "updateVillBoard" , method = RequestMethod.POST)
    public int updateVillBoard(@RequestBody VilBoard vilBoard){

        System.out.println("우리동네 게시판 수정 : "+ vilBoard);


        communityService.updateVillBoard(vilBoard);

        return 0;
    }

    @RequestMapping(value = "addDealCalender", method = RequestMethod.POST)
    public int addDealCalender(@RequestBody ClubCalendar calender ) {
        System.out.println("일정 정보 : " +calender);
        calendarService.addDealCalender(calender);

    return 0;
    }
}
