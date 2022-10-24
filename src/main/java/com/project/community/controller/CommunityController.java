package com.project.community.controller;

import com.project.club.service.ClubCalendarService;
import com.project.community.service.CommunityService;
import com.project.deal.service.DealService;
import com.project.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/commu/*")
public class CommunityController {

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService commuService;

    @Autowired
    @Qualifier("clubCalenderServiceImpl")
    private ClubCalendarService calenderService;




    @RequestMapping("main")
    public String Calender() {
        System.out.println("calender진입");
        return "/view/community/list/Community.jsp";
    }

    ;

    //우리동네 게시글
    @RequestMapping(value = "getVillBoard")
    public String getVillBoard(@RequestParam("villBoardNum") int villBoardNum
            , @RequestParam("boardCategory") int boardCategory
            , Model model, @ModelAttribute("VillBaord") VilBoard villBoard) {

        villBoard = commuService.getVillBoard(villBoardNum);

        Map<String, Object> map = commuService.listComment(villBoardNum, boardCategory);


        model.addAttribute("list", map.get("list"));

        model.addAttribute("villBoard", villBoard);

        return "/view/community/get/getVillBoard.jsp";
    }

    @RequestMapping(value = "villBoardList")
    public String villBoardList(@RequestParam("villCode") String villCode,
                                Model model) {

        Map<String, Object> map = commuService.listVillBoard(villCode);

        model.addAttribute("list", map.get("list"));

        return "/view/community/list/villBoardList.jsp";
    }

    //모임 후기글

    @RequestMapping(value = "getClubCalenderReview")
    public String getClubCalenderReview() {

        return "/view/community/get/getClubCalenderReview.jsp";
    }

    @RequestMapping(value = "clubCalenderReviewList")
    public String clubCalenderReview() {

        return "/view/community/list/clubCalenderReviewList.jsp";
    }

    @RequestMapping(value = "clubCalenderReviewShortList")
    public String clubCalenderReviewShortList() {

        return "/view/community/list/clubCalenderReviewShortList.jsp";
    }

    @RequestMapping(value = "addVillBoard")
    public String addVillBoard(@ModelAttribute("villBoard") VilBoard villBoard,
                               HttpSession session) {
        User user = (User) session.getAttribute("user");

        System.out.println("유저의 이름 :" + user.getUserId());
        villBoard.setUserId(user.getUserId());
        villBoard.setVillCode("창원");
        villBoard.setBoardCategory(3);

        //commuService.addVillBoard(villBoard);

        return null;
    }

    @RequestMapping(value = "updateVillBoard", method = RequestMethod.GET)
    public String updateVillBoard(@RequestParam("boardNum") int boardNum
            , @ModelAttribute("vilBarod") VilBoard vilBoard
            , Model model) {

        vilBoard = commuService.getVillBoard(boardNum);

        model.addAttribute("villBoard", vilBoard);

        return "/view/community/update/updateVillBoard.jsp";
    }

    @RequestMapping(value = "updateVillBoard", method = RequestMethod.POST)
    public String updateVillBoard(@ModelAttribute("villBoard") VilBoard vilBoard) {

        commuService.updateVillBoard(vilBoard);

        return null;
    }

    @RequestMapping(value = "deleteBoard")
    public String deleteBoard(@RequestParam("boardNum") int boardNum,
                              @RequestParam("boardCategory") int boardCategory
            , Model model, HttpSession session, HttpServletResponse response) throws UnsupportedEncodingException {

        //ClubCalendarReview calenderReview = calenderService.getCalenderReview(boardNum);


        Map<String, Object> map = commuService.listComment(boardNum, boardCategory);

        List<Comment> list = (List<Comment>) map.get("list");

        for (int i = 0; i < list.size(); i++) {

            System.out.println("list의 정보 :" +list.get(i).getCommentNum() );
            commuService.deleteAllRecomment(list.get(i).getCommentNum());

        }

        commuService.deleteAllComment(boardNum,boardCategory);

        calenderService.deleteFile(boardNum);

        commuService.deleteAllLike(boardNum,boardCategory);

        commuService.deleteBoard(boardNum,boardCategory);


        /*session.getAttribute("villCode");*/

        String villCode = "창원";

        String encode = "";

        encode = URLEncoder.encode(villCode, "utf-8");

        if (boardCategory == 1) {
            return "redirect:/clubCal/listCalenderReview?boardCategory=" + boardCategory;
        } else if (boardCategory == 2) {
            return "redirect:/clubCal/listCalenderReview?boardCategory=" + boardCategory;
        } else if (boardCategory == 3) {
            return "redirect:/commu/villBoardList?villCode=" + encode;
        }
        return null;
    }

    @RequestMapping("addDealCalender")
    public String addDealCalender(@RequestParam("boardNum")int boardNum
                                ,Model model) throws Exception {

        model.addAttribute("boardNum", boardNum);

        System.out.println(boardNum);

        return "/view/community/add/addDealCalender.jsp";
    }


}
