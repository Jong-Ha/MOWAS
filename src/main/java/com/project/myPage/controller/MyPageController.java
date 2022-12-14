package com.project.myPage.controller;

import com.project.club.service.ClubCalendarService;
import com.project.club.service.ClubService;
import com.project.common.Page;
import com.project.common.Search;
import com.project.community.service.CommunityService;
import com.project.deal.service.DealService;
import com.project.domain.*;
import com.project.myPage.service.MyPageService;
import com.project.site.service.SiteService;
import com.project.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/myPage/*")


public class MyPageController {

    @Autowired
    @Qualifier("myPageServiceImpl")
    private MyPageService myPageService;

    @Autowired
    @Qualifier("clubServiceImpl")
    private ClubService clubService;

    @Autowired
    @Qualifier("clubCalenderServiceImpl")
    private ClubCalendarService calenderService;

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService commuService;

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService communityService;

    @Autowired
    @Qualifier("dealServiceImpl")
    private DealService dealService;

    @Autowired
    @Qualifier("siteServiceImpl")
    private SiteService siteService;

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    public MyPageController() {
        System.out.println(this.getClass());
    }

    @Value("#{commonProperties['pageUnit']}")
    int pageUnit;
    @Value("#{commonProperties['pageSize']}")
    int pageSize;
    @Value("#{commonProperties['resourcesPath']}")
    String resourcesPath;
    @Value("#{commonProperties['userImagePath']}")
    String userImagePath;

    @RequestMapping(value = "getMyPage", method = RequestMethod.GET)
    public String getMyPage(@RequestParam(value = "userId") String userId, Model model) throws Exception {

        System.out.println("getMyPage???????????? userId??? ????" + userId);
        User user = myPageService.getMyPage(userId);
        model.addAttribute("user", user);

        return "forward:/view/myPage/getMyPage.jsp";
    }

    @RequestMapping(value = "getMyInfor", method = RequestMethod.GET)
    public String getMyInfor(@RequestParam(value = "userId") String userId, Model model) throws Exception {
        System.out.println("getMyInfor???????????? userId??? ????" + userId);

        Map<String, Object> map = myPageService.getMyInfor(userId);
        String tm = "";
        ArrayList tmlist = null;

        System.out.println("????????? ?????????????????? : " + map.get("interList"));
        List<UserInterList> abcd = (List<UserInterList>) map.get("interList");
        for (int i = 0; i < abcd.size(); i++) {
            String abc = abcd.get(i).getInterList().trim();
            System.out.println("abc??? ???...." + abc);
            String interList = "";
            String str = "";
            switch (Integer.parseInt(abc)) {
                case 1:
                    interList = "??????";
                    str += interList;
                    break;
                case 2:
                    interList = "?????????";
                    str += interList;
                    break;
                case 3:
                    interList = "????????????";
                    str += interList;
                    break;
                case 4:
                    interList = "??????";
                    str += interList;
                    break;
                case 5:
                    interList = "?????????";
                    str += interList;
                    break;
                case 6:
                    interList = "??????";
                    str += interList;
                    break;
                case 7:
                    interList = "??????";
                    str += interList;
                    break;
                case 8:
                    interList = "??????";
                    str += interList;
                    break;
                case 9:
                    interList = "??????";
                    str += interList;
                    break;
                case 10:
                    interList = "??????";
                    str += interList;
                    break;
                case 11:
                    interList = "??????";
                    str += interList;
                    break;
                case 12:
                    interList = "??????";
                    str += interList;
                    break;
                case 13:
                    interList = "??????";
                    str += interList;
                    break;
            }
            System.out.println("str??? ???..?" + str);
            tm += str + "\n\r";
            System.out.println("tm??????.....! " + tm);
            tmlist = new ArrayList<>();
            tmlist.add(tm);

            map.put("interList", tmlist);
        }

        System.out.println("getMyInfor ???????????? map??? ???????" + map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyInfor.jsp";
    }

    @RequestMapping(value = "updateClick", method = RequestMethod.GET)
    public String updateClick(@RequestParam(value = "userId") String userId, Model model) throws Exception {
        System.out.println("updateClick???????????? userId??? ????" + userId);

        Map<String, Object> map = myPageService.getMyInfor(userId);

        String tm = "";
        ArrayList tmlist = null;

        System.out.println("????????? ?????????????????? : " + map.get("interList"));
        List<UserInterList> abcd = (List<UserInterList>) map.get("interList");
        for (int i = 0; i < abcd.size(); i++) {
            String abc = abcd.get(i).getInterList().trim();
            System.out.println("abc??? ???...." + abc);
            String interList = "";
            String str = "";
            switch (Integer.parseInt(abc)) {
                case 1:
                    interList = "??????";
                    str += interList;
                    break;
                case 2:
                    interList = "?????????";
                    str += interList;
                    break;
                case 3:
                    interList = "????????????";
                    str += interList;
                    break;
                case 4:
                    interList = "??????";
                    str += interList;
                    break;
                case 5:
                    interList = "?????????";
                    str += interList;
                    break;
                case 6:
                    interList = "??????";
                    str += interList;
                    break;
                case 7:
                    interList = "??????";
                    str += interList;
                    break;
                case 8:
                    interList = "??????";
                    str += interList;
                    break;
                case 9:
                    interList = "??????";
                    str += interList;
                    break;
                case 10:
                    interList = "??????";
                    str += interList;
                    break;
                case 11:
                    interList = "??????";
                    str += interList;
                    break;
                case 12:
                    interList = "??????";
                    str += interList;
                    break;
                case 13:
                    interList = "??????";
                    str += interList;
                    break;
            }
            System.out.println("str??? ???..?" + str);
            tm += str + "\n\r";
            System.out.println("tm??????.....! " + tm);
            tmlist = new ArrayList<>();
            tmlist.add(tm);

            map.put("interList", tmlist);
        }

        System.out.println("updateClick ???????????? map??? ???????" + map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/updateMyInfor.jsp";
    }

    @RequestMapping(value = "updateMyInfor", method = RequestMethod.POST)
    public String updateMyInfor(@ModelAttribute User user, Model model, HttpSession session,
                                @RequestParam(value = "file") MultipartFile file) throws Exception {
        System.out.println("updateMyInfor???????????? user??? ????" + user);
        System.out.println(user.getLoginType());

        if (user.getLoginType().equals("1")) {

            if (Objects.requireNonNull(file.getContentType()).substring(0, file.getContentType().indexOf("/")).equals("image")) {

                System.out.println("file.getContentType() : " + file.getContentType());
                String fileRealName = file.getOriginalFilename();
                long size = file.getSize();

                System.out.println("????????? : " + fileRealName);
                System.out.println("????????????(byte) : " + size);

                String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
                String uploadFolder = "C:\\Project\\MOWAS\\src\\main\\webapp\\resources\\uploadFiles\\userImages";

                UUID uuid = UUID.randomUUID();
                System.out.println(uuid.toString());
                String[] uuids = uuid.toString().split("-");

                String uniqueName = uuids[0];
                System.out.println("????????? ?????? ????????? " + uniqueName);
                System.out.println("???????????? " + fileExtension);

                String uploadLocation = uploadFolder + "\\" + uniqueName + fileExtension;
                System.out.println("uploadLocation??? ??? :" + uploadLocation);

                java.io.File saveFile = new File(uploadLocation);
                try {
                    file.transferTo(saveFile);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }

                String userImage = userImagePath + uniqueName + fileExtension;
                user.setUserImage(userImage);

                userService.updateUser(user);
                Map<String, Object> map = myPageService.getMyInfor(user.getUserId());
                System.out.println("getMyInfor ???????????? map1??? ???????" + map);
                model.addAttribute("map", map);

                session.setAttribute("user", userService.getUser(user.getUserId()));
            }
            User userImg = userService.getUser(user.getUserId());
            user.setUserImage(userImg.getUserImage());

            userService.updateUser(user);
            Map<String, Object> map = myPageService.getMyInfor(user.getUserId());
            System.out.println("getMyInfor ???????????? map1===1??? ???????" + map);
            model.addAttribute("map", map);

            session.setAttribute("user", userService.getUser(user.getUserId()));


        } else if (user.getLoginType().equals("2")) {

            if (Objects.requireNonNull(file.getContentType()).substring(0, file.getContentType().indexOf("/")).equals("image")) {

                System.out.println("file.getContentType() : " + file.getContentType());
                String fileRealName = file.getOriginalFilename();
                long size = file.getSize();

                System.out.println("????????? : " + fileRealName);
                System.out.println("????????????(byte) : " + size);

                String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
                String uploadFolder = "C:\\Project\\MOWAS\\src\\main\\webapp\\resources\\uploadFiles\\userImages";

                UUID uuid = UUID.randomUUID();
                System.out.println(uuid.toString());
                String[] uuids = uuid.toString().split("-");

                String uniqueName = uuids[0];
                System.out.println("????????? ?????? ????????? " + uniqueName);
                System.out.println("???????????? " + fileExtension);

                String uploadLocation = uploadFolder + "\\" + uniqueName + fileExtension;
                System.out.println("uploadLocation??? ??? :" + uploadLocation);

                java.io.File saveFile = new File(uploadLocation);
                try {
                    file.transferTo(saveFile);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }

                String userImage = userImagePath + uniqueName + fileExtension;
                user.setUserImage(userImage);

                userService.updateKakaoUser(user);
                Map<String, Object> map = myPageService.getMyInfor(user.getUserId());
                System.out.println("getMyInfor ???????????? map2??? ???????" + map);
                model.addAttribute("map", map);

                session.setAttribute("user", userService.getUser(user.getUserId()));

            }

            User userImg = userService.getUser(user.getUserId());
            user.setUserImage(userImg.getUserImage());

            userService.updateKakaoUser(user);
            Map<String, Object> map = myPageService.getMyInfor(user.getUserId());
            System.out.println("getMyInfor ???????????? map2===2??? ???????" + map);
            model.addAttribute("map", map);

            session.setAttribute("user", userService.getUser(user.getUserId()));

        } else {

            if (Objects.requireNonNull(file.getContentType()).substring(0, file.getContentType().indexOf("/")).equals("image")) {

                System.out.println("file.getContentType() : " + file.getContentType());
                String fileRealName = file.getOriginalFilename();
                long size = file.getSize();

                System.out.println("????????? : " + fileRealName);
                System.out.println("????????????(byte) : " + size);

                String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
                String uploadFolder = "C:\\Project\\MOWAS\\src\\main\\webapp\\resources\\uploadFiles\\userImages";

                UUID uuid = UUID.randomUUID();
                System.out.println(uuid.toString());
                String[] uuids = uuid.toString().split("-");

                String uniqueName = uuids[0];
                System.out.println("????????? ?????? ????????? " + uniqueName);
                System.out.println("???????????? " + fileExtension);

                String uploadLocation = uploadFolder + "\\" + uniqueName + fileExtension;
                System.out.println("uploadLocation??? ??? :" + uploadLocation);

                java.io.File saveFile = new File(uploadLocation);
                try {
                    file.transferTo(saveFile);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }

                String userImage = userImagePath + uniqueName + fileExtension;
                user.setUserImage(userImage);

                userService.updateKakaoUser(user);
                Map<String, Object> map = myPageService.getMyInfor(user.getUserId());
                System.out.println("getMyInfor ???????????? map3??? ???????" + map);
                model.addAttribute("map", map);

                session.setAttribute("user", userService.getUser(user.getUserId()));

            }

            User userImg = userService.getUser(user.getUserId());
            user.setUserImage(userImg.getUserImage());

            userService.updateNaverUser(user);
            Map<String, Object> map = myPageService.getMyInfor(user.getUserId());
            System.out.println("getMyInfor ???????????? map3===3??? ???????" + map);
            model.addAttribute("map", map);

            session.setAttribute("user", userService.getUser(user.getUserId()));
        }
        ;

        return "redirect:/myPage/getMyInfor?userId="+user.getUserId();
    }

    //???????????? ?????????
    @RequestMapping(value = "getVillBoard")
    public String getVillBoard(@RequestParam("villBoardNum") int villBoardNum
            , @RequestParam("boardCategory") int boardCategory
            , Model model, @ModelAttribute("VillBaord") VilBoard villBoard) {

        villBoard = commuService.getVillBoard(villBoardNum);

        //Map<String, Object> map = commuService.listComment(villBoardNum, boardCategory, search);


        //model.addAttribute("list", map.get("list"));

        model.addAttribute("villBoard", villBoard);

        return "/view/community/get/getVillBoard.jsp";
    }

    //?????? ?????????


    @RequestMapping(value = "clubCalenderReviewList")
    public String clubCalenderReview() {

        return "/view/community/list/clubCalenderReviewList.jsp";
    }

    @RequestMapping(value = "clubCalenderReviewShortList")
    public String clubCalenderReviewShortList() {

        return "/view/community/list/clubCalenderReviewShortList.jsp";
    }

    @RequestMapping(value = "getClub/{clubNum}")
    public String getClub(Model model, @PathVariable int clubNum, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Cluber currentCluber = clubService.getCluberCondition(user, clubNum);
            session.setAttribute("currentCluber", currentCluber);
        } else {
            session.removeAttribute("currentCluber");
        }
        Club club = clubService.getClub(clubNum);
        model.addAttribute("club", club);
        return "/view/club/getClub.jsp";
    }

    @RequestMapping(value = "getClubMasterBoard/{boardNum}", method = RequestMethod.GET)
    public String getClubMasterBoard(@PathVariable("boardNum") int boardNum, Model model) {
        model.addAttribute("clubMasterBoard", clubService.getClubMasterBoard(boardNum));
        return "/view/club/getClubMasterBoard.jsp";
    }


    @RequestMapping("getClubCalender")
    public String getClubCalender(@RequestParam("clubCalenderNum") int clubCalenderNum
            , @ModelAttribute("ClubCalendar") ClubCalendar clubCalendar
            , Model model) {

        System.out.println(clubCalenderNum);

        clubCalendar = calenderService.getCalender(clubCalenderNum);

        String[] date = clubCalendar.getClubDate().split(" ");

        clubCalendar.setClubDate(date[0]);

        model.addAttribute("clubCalender", clubCalendar);

        return "/view/community/get/getClubCalender.jsp";
    }

    @RequestMapping("getClubCalenderReview")
    public String getClubCalenderReview(@RequestParam("clubCalenderReviewNum") int clubCalenderReviewNum,
                                        @RequestParam("boardCategory") int boardCategory,
                                        @ModelAttribute("clubCalenderReview") ClubCalendarReview calendarReview,
                                        @ModelAttribute("Comment") Comment comment,
                                        Model model) {


        calendarReview = calenderService.getCalenderReview(clubCalenderReviewNum);

        //Map<String, Object> map = communityService.listComment(clubCalenderReviewNum ,boardCategory, search);


        model.addAttribute("calenderReview", calendarReview);
        //model.addAttribute("list", map.get("list"));

        //System.out.println("list??? ?????? : " + map.get("list"));

        return "/view/community/get/getClubCalenderReview.jsp";
    }

    @RequestMapping(value = "getDeal/{dealBoardNum}")
    public String getDeal(Model model, @PathVariable int dealBoardNum, HttpSession session) throws Exception {
        Deal deal = dealService.getDeal(dealBoardNum);
//Object User=session.getAttribute("userId");
        //String boardCategory = String.valueOf(deal.getBoardCategory());
        System.out.println(deal.getBoardCategory());
//String likeCheck =commuService.getLikeCheck((String)session.getAttribute("userId"),dealBoardNum, (Integer.parseInt(deal.getBoardCategory())));
        String likeCheck = commuService.getLikeCheck("user01", dealBoardNum, (Integer.parseInt(deal.getBoardCategory())));

        System.out.println("likecheck" + likeCheck);
        model.addAttribute("deal", deal);
        model.addAttribute("likeCheck", likeCheck);
        return "/view/deal/getDeal.jsp";
    }

    @RequestMapping(value = "getMasterBoard/{masterBoardNo}", method = RequestMethod.GET)
    public String getMasterBoard(@PathVariable int masterBoardNo, Model model) throws Exception {
        System.out.println("/site/getMasterBoard : GET");
        MasterBoard masterBoard = siteService.getMasterBoard(masterBoardNo);
        model.addAttribute("masterBoard", masterBoard);
        return "forward:/view/site/getMasterBoard.jsp";
    }

    @RequestMapping(value = "getCommunityReport/{communityReportNo}", method = RequestMethod.GET)
    public String getCommunityReport(@PathVariable int communityReportNo, Model model) throws Exception {
        System.out.println("/site/getCommunityReport : GET");
        CommunityReport communityReport = siteService.getCommunityReport(communityReportNo);
        model.addAttribute("communityReport", communityReport);
        return "forward:/view/site/getCommunityReport.jsp";
    }

    @RequestMapping(value = "listCommunityReport")
    public String listCommunityReport(@ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("/site/listCommunityReport : GET / POST");

        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String, Object> map = siteService.listCommunityReport(search);

        Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
        System.out.println("resultPage : " + resultPage);
        System.out.println("list : " + map.get("list"));

        model.addAttribute("list", map.get("list"));
        model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);

        return "forward:/view/site/listCommunityReport.jsp";
    }

    @RequestMapping(value = "getUser", method = RequestMethod.GET)
    public String getUser(@RequestParam("userId") String userId, Model model) throws Exception {
        System.out.println("/user/getUser : GET ??????");
        User user = userService.getUser(userId);
        model.addAttribute("user", user);
        return "forward:/view/user/getUserDetail.jsp";
    }

    ///*
    @RequestMapping(value = "getMyBoard")
    public String getMyBoard(@RequestParam(value = "userId") String userId, Model model,  @ModelAttribute("search") Search search) throws Exception {

        System.out.println("getMyBoard???????????? userId??? ????" + userId);

        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }

        search.setPageSize(pageSize);

        System.out.println("search??? ?????? : " + search);


        Map<String, Object> map = myPageService.getMyBoard(userId, search);

        System.out.println("getMyBoard ???????????? map??? ???????" + map);

        Page resultPage = new Page(search.getCurrentPage(), (Integer) map.get("villBoardTotal"), pageUnit, pageSize);

        model.addAttribute("map", map.get("villBoard"));
        model.addAttribute("resultPage", resultPage);

        return "forward:/view/myPage/getMyBoard.jsp";
    }

    @RequestMapping(value = "getMyCbMaster", method = RequestMethod.GET)
    public String getMyCbMaster(@RequestParam(value = "userId") String userId, Model model
    ) throws Exception {
        System.out.println("getMyCbMaster???????????? userId??? ????" + userId);

        Search search = new Search();
        Map<String, Object> map = myPageService.getMyBoard(userId, search);
        System.out.println("getMyCbMaster ???????????? map??? ???????" + map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyCbMaster.jsp";
    }

    @RequestMapping(value = "getMyCbReviewBoard")
    public String getMyCbReviewBoard(@RequestParam(value = "userId") String userId,
                                     @ModelAttribute("search") Search search,
                                     Model model) throws Exception {


        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }

        search.setPageSize(pageSize);

        System.out.println("search??? ?????? : " + search);


        System.out.println("getMyCbReviewBoard???????????? userId??? ????" + userId);

        Map<String, Object> map = myPageService.getMyBoard(userId, search);

        System.out.println("getMyCbReviewBoard ???????????? map??? ???????" + map);


        Page resultPage = new Page(search.getCurrentPage(), (Integer) map.get("clubCalenderTotle"), pageUnit, pageSize);

        model.addAttribute("resultPage", resultPage);

        model.addAttribute("map", map);

        return "forward:/view/myPage/getMyCbReviewBoard.jsp";
    }

    @RequestMapping(value = "getMyDealBoard", method = RequestMethod.GET)
    public String getMyDealBoard(@RequestParam(value = "userId") String userId, Model model
    ) throws Exception {
        System.out.println("getMyDealBoard???????????? userId??? ????" + userId);

        Search search = new Search();


        Map<String, Object> map = myPageService.getMyBoard(userId, search);
        System.out.println("getMyDealBoard ???????????? map??? ???????" + map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyDealBoard.jsp";
    }

    ///*
    @RequestMapping(value = "listClubMasterBoard/{clubNum}")
    public String listClubMasterBoard(Model model, @PathVariable("clubNum") int clubNum, @ModelAttribute("search") Search search) {
        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        if (search.getPageSize() == 0) {
            search.setPageSize(pageSize);
        }
        if (search.getSearchKeyword() == null) {
            search.setSearchKeyword("");
        }
        Map<String, Object> map = clubService.listClubMasterBoard(search, clubNum);

        Page resultPage = new Page(search.getCurrentPage(), (Integer) map.get("totalCount"), pageUnit, pageSize);
        map.put("resultPage", resultPage);
        model.addAllAttributes(map);
        return "forward:/view/myPage/getMyBoard.jsp";
    }

    //*/
    @RequestMapping(value = "getMyComment")
    public String getMyComment(@RequestParam(value = "userId") String userId, Model model,
                               @ModelAttribute("search") Search search) throws Exception {
        System.out.println("getMyComment ???????????? userId??? ????" + userId);

        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);



        Map<String, Object> map = myPageService.getMyComment(userId ,search);


        System.out.println("getMyComment ???????????? map??? ???????" + map);


        Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("commentTotal")).intValue(), pageUnit, pageSize);

        System.out.println(resultPage);

        model.addAttribute("map", map);
        model.addAttribute("resultPage", resultPage);

        return "forward:/view/myPage/getMyComment.jsp";
    }

    @RequestMapping(value = "getMyRecomment")
    public String getMyRecomment(@RequestParam(value = "userId") String userId, Model model, @ModelAttribute("search") Search search) throws Exception {
        System.out.println("getMyRecomment ???????????? userId??? ????" + userId);
        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String, Object> map = myPageService.getMyRecomment(userId, search);

        System.out.println("getMyRecomment ???????????? map??? ???????" + map);


        Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("recommentTotal")).intValue(), pageUnit, pageSize);

        System.out.println(resultPage);

        model.addAttribute("list", map.get("list"));
        model.addAttribute("resultPage", resultPage);

        return "forward:/view/myPage/getMyRecomment.jsp";
    }

    @RequestMapping(value = "getMyCommentLike")
    public String getMyCommentLike(@RequestParam(value = "userId") String userId
                                    , Model model
                                    ,@ModelAttribute("search") Search search) throws Exception {

        System.out.println("getMyCommentLike ???????????? userId??? ????" + userId);


        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String, Object> map = myPageService.getMyCommentLike(userId, search);

        Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("commentLikeTotal")).intValue(), pageUnit, pageSize);


        System.out.println("getMyCommentLike ???????????? map??? ???????" + map);
        model.addAttribute("map", map);
        model.addAttribute("resultPage", resultPage);


        return "forward:/view/myPage/getMyCommentLike.jsp";
    }

    @RequestMapping(value = "getMyRecommentLike")
    public String getMyRecommentLike(@RequestParam(value = "userId") String userId,
                                     Model model
                                     ,@ModelAttribute("search") Search search) throws Exception {

        System.out.println("getMyRecommentLike ???????????? userId??? ????" + userId);


        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);


        Map<String, Object> map = myPageService.getMyRecommentLike(userId, search);

        Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("recommentLikeTotal")).intValue(), pageUnit, pageSize);

        System.out.println("getMyRecommentLike ???????????? map??? ???????" + map);

        model.addAttribute("map", map);
        model.addAttribute("resultPage", resultPage);
        return "forward:/view/myPage/getMyRecommentLike.jsp";
    }


    @RequestMapping(value = "getMyVillBoardLike")
    public String getMyLike(@RequestParam(value = "userId") String userId,
                            Model model
                            ,@ModelAttribute("search") Search search) throws Exception {
        System.out.println("getMyLike ???????????? userId??? ????" + userId);


        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);


        Map<String, Object> map = myPageService.getMyLike(userId,search);

        Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("villBoardTotal")).intValue(), pageUnit, pageSize);


        System.out.println("getMyLike ???????????? map??? ???????" + map);

        model.addAttribute("map", map);
        model.addAttribute("resultPage", resultPage);

        return "forward:/view/myPage/getMyVillBoardLike.jsp";
    }

    @RequestMapping(value = "getMyCbRvLike")
    public String getMyCbRvLike(@RequestParam(value = "userId") String userId
                                ,Model model
                                ,@ModelAttribute("search") Search search) throws Exception {
        System.out.println("getMyCbRvLike ???????????? userId??? ????" + userId);


        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String, Object> map = myPageService.getMyLike(userId, search);
        System.out.println("getMyCbRvLike ???????????? map??? ???????" + map);

        Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("clubCalenderReviewTotal")).intValue(), pageUnit, pageSize);

        model.addAttribute("map", map);
        model.addAttribute("resultPage", resultPage);

        return "forward:/view/myPage/getMyCbRvLike.jsp";
    }

    @RequestMapping(value = "getMyDealLike", method = RequestMethod.GET)
    public String getMyDealLike(@RequestParam(value = "userId") String userId,
                                Model model
                                ,@ModelAttribute("search")Search search) throws Exception {
        System.out.println("getMyDealLike ???????????? userId??? ????" + userId);

        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);


        Map<String, Object> map = myPageService.getMyLike(userId, search);


      Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("dealBoardLikeTotal")).intValue(), pageUnit, pageSize);


        System.out.println("getMyDealLike ???????????? map??? ???????" + map);


        model.addAttribute("map", map.get("dealBoardLike"));
        model.addAttribute("resultPage", resultPage);

        return "forward:/view/myPage/getMyDealLike.jsp";
    }



    @RequestMapping(value = "getMyClub", method = RequestMethod.GET)
    public String getMyClub(@RequestParam(value = "userId") String userId, Model model, @ModelAttribute(value = "search") Search search) throws Exception {
        System.out.println("getMyClub ???????????? userId??? ????" + userId);

        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }

        search.setPageSize(pageSize);

        Map<String, Object> map = myPageService.getMyClub("join", userId, search);

        for (Map<String, Object> item : (List<Map<String, Object>>) map.get("list")) {
            Club club = (Club) item.get("club");
            club.parseInterList();
            String gc = "????????????";
            if (club.getGatherCheck().equals("1")) {
                gc = "?????????";
            }
            club.setGatherCheck(gc);
        }

        System.out.println("getMyClub ???????????? map??? ???????" + map);
        Page resultPage = new Page(search.getCurrentPage(), (Integer) map.get("totalCount"), pageUnit, pageSize);
        map.put("resultPage", resultPage);
        model.addAllAttributes(map);
        return "forward:/view/myPage/getMyClub.jsp";
    }

    @RequestMapping(value = "getMyClubLike", method = RequestMethod.GET)
    public String getMyClubLike(@RequestParam(value = "userId") String userId, Model model, @ModelAttribute(value = "search") Search search) throws Exception {

        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }

        search.setPageSize(pageSize);

        Map<String, Object> map = myPageService.getMyClubLike(userId, search);

        for (Club club : (List<Club>)map.get("list")) {
            club.parseInterList();
            String gc = "????????????";
            if (club.getGatherCheck().equals("1")) {
                gc = "?????????";
            }
            club.setGatherCheck(gc);
        }

        Page resultPage = new Page(search.getCurrentPage(), (Integer) map.get("totalCount"), pageUnit, pageSize);
        map.put("resultPage", resultPage);
        model.addAllAttributes(map);

        return "forward:/view/myPage/getMyClubLike.jsp";
    }

    @RequestMapping(value = "getMyClubApply")
    public String getMyClubApply(@RequestParam(value = "userId") String userId, Model model, @ModelAttribute(value = "search") Search search) throws Exception {
        System.out.println("getMyClubApply ???????????? userId??? ????" + userId);

        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }

        search.setPageSize(pageSize);

        Map<String, Object> map = myPageService.getMyClub("apply", userId, search);

        for (Map<String, Object> item : (List<Map<String, Object>>) map.get("list")) {
            Club club = (Club) item.get("club");
            Cluber cluber = (Cluber) item.get("cluber");
            club.parseInterList();
            String gc = "????????????";
            if (club.getGatherCheck().equals("1")) {
                gc = "?????????";
            }
            club.setGatherCheck(gc);
            switch (Integer.parseInt(cluber.getCluberStatus())) {
                case 2:
                    cluber.setCluberStatus("??????");
                    break;
                case 3:
                    cluber.setCluberStatus("??????");
                    break;
                default:
                    cluber.setCluberStatus("??????");
                    break;
            }
        }

        System.out.println("getMyClubApply ???????????? map??? ???????" + map);
        Page resultPage = new Page(search.getCurrentPage(), (Integer) map.get("totalCount"), pageUnit, pageSize);
        map.put("resultPage", resultPage);
        model.addAllAttributes(map);
        return "forward:/view/myPage/getMyClubApply.jsp";
    }

    @RequestMapping(value = "getMyDeal", method = RequestMethod.GET)
    public String getMyDeal(@RequestParam(value = "userId") String userId, Model model) throws Exception {
        System.out.println("getMyDeal ???????????? userId??? ????" + userId);

        Map<String, Object> map = myPageService.getMyDeal(userId);
        System.out.println("getMyDeal ???????????? map??? ???????" + map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyEndDeal.jsp";
    }

    @RequestMapping(value = "getMyDealReview", method = RequestMethod.GET)
    public String getMyDealReview(@RequestParam(value = "userId") String userId, Model model) throws Exception {
        System.out.println("getMyDealReview ???????????? userId??? ????" + userId);

        Map<String, Object> map = myPageService.getMyDeal(userId);
        System.out.println("getMyDealReview ???????????? map??? ???????" + map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyDealReview.jsp";
    }

    @RequestMapping(value = "getMyReport")
    public String getMyReport(@RequestParam(value = "userId") String userId, @ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("getMyReport ???????????? userId??? ????" + userId);
        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String, Object> map = myPageService.getMyReport(userId);
        System.out.println("getMyReport ???????????? map??? ???????" + map);
        Map<String, Object> mapTotalCount = myPageService.getTotalCount(search);
        Page resultPage = new Page(search.getCurrentPage(), ((Integer) mapTotalCount.get("totalCount")).intValue(), pageUnit, pageSize);

        System.out.println("========================"+resultPage);

        model.addAttribute("map", map);
        model.addAttribute("resultPage", resultPage);
        return "forward:/view/myPage/getMyReport.jsp";
    }

    @RequestMapping(value = "getMyPpt")
    public String getMyPpt(@RequestParam(value = "userId") String userId, @ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("getMyPpt ???????????? userId??? ????" + userId);
        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String, Object> map = myPageService.getMyPpt(userId);
        System.out.println("getMyPpt ???????????? map??? ???????" + map);
        Map<String, Object> mapTotalCount = myPageService.getTotalCount(search);
        Page resultPage = new Page(search.getCurrentPage(), ((Integer) mapTotalCount.get("totalCount")).intValue(), pageUnit, pageSize);
        System.out.println(resultPage);

        model.addAttribute("map", map);
        model.addAttribute("resultPage", resultPage);
        return "forward:/view/myPage/getMyPpt.jsp";
    }

    @RequestMapping(value="userOut", method = RequestMethod.GET)
    public String userOut(@RequestParam(value = "userId") String userId,Model model,HttpSession session)throws Exception{
        System.out.println("????????? userOut ???????????? ????????????");
        System.out.println("userId??????????"+userId);

        userService.userOut(userId);

        session.removeAttribute("user");

        return "redirect:/";
    }

    //*/
}
