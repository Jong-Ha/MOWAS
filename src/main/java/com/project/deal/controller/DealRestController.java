package com.project.deal.controller;

import com.project.community.service.CommunityService;
import com.project.deal.service.DealService;
import com.project.domain.Deal;
import com.project.domain.User;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

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
    public int dealLike(@RequestBody String Board, HttpSession session) throws ParseException {

        JSONParser parser = new JSONParser();

        System.out.println("likeRestController진입 : " + Board);

        User user = (User) session.getAttribute("user");
        String userId = user.getUserId();

        Map<String, Object> map = new HashMap<>();

        JSONObject jsonObj = (JSONObject)parser.parse(Board);

        String SboardNum = (String) jsonObj.get("dealBoardNum");
        String SboardCategory = (String) jsonObj.get("boardCategory");
        String SlikeCount = (String) jsonObj.get("likeCount");

        System.out.println(SboardNum);
        System.out.println(SboardCategory);
        int dealBoardNum = Integer.parseInt(SboardNum);
        int boardCategory = Integer.parseInt(SboardCategory);
        int likeCount = Integer.parseInt(SlikeCount.trim());

        /*좋아요 유무 체크*/
        String likeCheck = communityService.getLikeCheck(userId,dealBoardNum,boardCategory);
        System.out.println("왕아아아아좋아여ㅛ 유뭇"+likeCheck);
        /*좋아요 체크가 null이면 좋아요 add*/
        if( likeCheck == null) {
            /*게시글에 좋아요 count +1*/
            communityService.updateLikeCount(dealBoardNum,boardCategory,likeCount);

            /*좋아요 add*/
            communityService.addLike(userId,dealBoardNum,boardCategory);

            /*좋아요 count 화면으로 return*/
            return communityService.getLikeCount(dealBoardNum, boardCategory);

            /*좋아요 체크가 y면 좋아요 count -1*/
        } else if (likeCheck.equals("y")) {

            /*좋아요 count -1*/
            communityService.deleteLikeCount(dealBoardNum,boardCategory,likeCount);

            /*좋아요 체크를 'n' 로 변경*/
            communityService.updateLike(userId,dealBoardNum,boardCategory,"n");

            /*좋아요 count 화면으로 return*/
            return communityService.getLikeCount(dealBoardNum,boardCategory);
            /*좋아요 체크가 n이면 실행*/
        }else if (likeCheck.equals("n")){
            /*게시글에 좋아요 count +1*/
            communityService.updateLikeCount(dealBoardNum,boardCategory,likeCount);

            /*좋아요 체크를 'y' 로 변경*/
            communityService.updateLike(userId,dealBoardNum,boardCategory,"y");
            /*좋아요 count 화면으로 return*/
            return communityService.getLikeCount(dealBoardNum,boardCategory);
        }

        return 0;
    }
   //     }
//            /*좋아요 add*/
//            communityService.addLike(userId,boardNum,boardCategory);
//            String like =  communityService.getLikeCheck(userId,boardNum,boardCategory);
//            map.put("like" , like);
//            return map;
//                    //좋아요 체크가 y면 좋아요 count -1*/
//        } else if (likeCheck.equals("y")) {
//
//            /*좋아요 체크를 'n' 로 변경*/
//            communityService.updateLike(userId,boardNum,boardCategory,"n");
//            String like =  communityService.getLikeCheck(userId,boardNum,boardCategory);
//            map.put("like" , like);
//            return map;
//            /*좋아요 체크가 n이면 실행*/
//        }else if (likeCheck.equals("n")){
//            /*좋아요 체크를 'y' 로 변경*/
//            communityService.updateLike(userId,boardNum,boardCategory,"y");
//            String like =  communityService.getLikeCheck(userId,boardNum,boardCategory);
//            map.put("like" , like);
//            return map;
//
//        }
//        return null;
//    }
    //예전거 liketoggle인듯
//    @RequestMapping("getLikeCheck")
//    public int getLikeCheck(@RequestBody String Board, HttpSession session) throws ParseException {
////        JSONParser parser = new JSONParser();
////
////        System.out.println("likeRestController진입 : " + Board);
////
////        User user = (User) session.getAttribute("user");
////        String userId = user.getUserId();
////
////        Map<String, Object> map = new HashMap<>();
////
////        JSONObject jsonObj = (JSONObject)parser.parse(Board);
////
////        String SboardNum = (String) jsonObj.get("boardNum");
////        String SboardCategory = (String) jsonObj.get("boardCategory");
////
////        System.out.println(SboardNum);
////        System.out.println(SboardCategory);
////        int boardNum = Integer.parseInt(SboardNum);
////        int boardCategory = Integer.parseInt(SboardCategory);
////        String like =  communityService.getLikeCheck(userId,boardNum,boardCategory);
////        map.put("like" , like);
////        return map;
//
//        JSONParser parser = new JSONParser();
//
//        System.out.println("likeRestController진입 : " + Board);
//
//        User user = (User) session.getAttribute("user");
//        String userId = user.getUserId();
//
//        JSONObject jsonObj = (JSONObject)parser.parse(Board);
//
//        String SboardNum = (String) jsonObj.get("boardNum");
//        String SboardCategory = (String) jsonObj.get("boardCategory");
//
//
//        int boardNum = Integer.parseInt(SboardNum);
//        int boardCategory = Integer.parseInt(SboardCategory);
//        System.out.println(boardNum);
//        System.out.println(boardCategory);
//        /*좋아요 유무 체크*/
//        String likeCheck = communityService.getLikeCheck(userId,boardNum,boardCategory);
//
//        /*좋아요 체크가 null이면 좋아요 add*/
//        if( likeCheck == null) {
//            /*좋아요 add*/
//            communityService.addLike(userId,boardNum,boardCategory);
//            /*좋아요 체크가 y면 좋아요 count -1*/
//        } else if (likeCheck.equals("y")) {
//
//            /*좋아요 체크를 'n' 로 변경*/
//            communityService.updateLike(userId,boardNum,boardCategory,"n");
//
//            /*좋아요 체크가 n이면 실행*/
//        }else if (likeCheck.equals("n")){
//
//            /*좋아요 체크를 'y' 로 변경*/
//            communityService.updateLike(userId,boardNum,boardCategory,"y");
//        }
//        return 0;
//    }
    @RequestMapping(value = "addReview" , method = RequestMethod.POST)
    public int addVillBarod(@RequestBody Deal deal , HttpSession session) throws Exception {
        System.out.println("여기 restController에 들어간건가요 ?"+deal);
        User user=(User) session.getAttribute("user");
                deal.setDealId(user.getUserId());
                dealService.updateReview(deal);
                return deal.getDealBoardNum();
    }

    @RequestMapping(value = "viewCount")
    public int viewCount(@RequestBody Deal deal) throws ParseException {

//        JSONParser parser = new JSONParser();

        System.out.println("viewCount : " + deal.getViewCount());

//        JSONObject jsonObj = (JSONObject)parser.parse(deal);
//
//        String SboardNum = (String) jsonObj.get("dealBoardNum");
//        String SboardCategory = (String) jsonObj.get("boardCategory");
//        String SviewCount = (String) jsonObj.get("viewCount");
//
//        int boardNum = Integer.parseInt(SboardNum);
//        int boardCategory = Integer.parseInt(SboardCategory);
//        int viewCount = Integer.parseInt(SviewCount);

        dealService.updateViewCount(deal.getDealBoardNum(),deal.getViewCount(),deal.getBoardCategory());
        System.out.println("이뒤엔 안오는거임 ?");
        System.out.println(deal.getViewCount());
        System.out.println(deal.getLikeCount());
        return dealService.getViewCount(deal.getDealBoardNum(),deal.getBoardCategory());
    }

}
