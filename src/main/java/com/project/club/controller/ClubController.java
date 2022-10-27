package com.project.club.controller;

import com.project.club.service.ClubService;
import com.project.common.KakaoMapApi;
import com.project.common.Page;
import com.project.common.Search;
import com.project.domain.*;
import com.project.myPage.service.MyPageService;
import com.project.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.*;

@Controller
@RequestMapping("/club/*")
public class ClubController {

    @Autowired
    @Qualifier("clubServiceImpl")
    private ClubService clubService;

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @Autowired
    @Qualifier("myPageServiceImpl")
    private MyPageService myPageService;

    @Value("#{commonProperties['pageSize']}")
    int pageSize;

    @Value("#{commonProperties['pageUnit']}")
    int pageUnit;

    @Value("#{commonProperties['resourcesPath']}")
    String resourcesPath;

    @Value("#{commonProperties['clubImagePath']}")
    String clubImagePath;

    @Value("#{commonProperties['clubMasterBoardPath']}")
    String clubMasterBoardPath;

    public ClubController() {
    }

    @RequestMapping(value = "login")
    public String login(HttpSession session, @RequestParam("userId") String userId) throws Exception {
        User user = userService.getUser(userId);
        session.setAttribute("user", user);
        return "forward:/club/listClub";
    }

    @RequestMapping(value = "addClub", method = RequestMethod.GET)
    public String addClubView() {
        return "/view/club/addClub.jsp";
    }

    @RequestMapping(value = "addClub", method = RequestMethod.POST)
    public String addClub(@ModelAttribute("club") Club club, @ModelAttribute("file") MultipartFile file, HttpSession session, @RequestParam("clubTags")List<String> clubTags) throws Exception {
//        System.out.println(file);
//        System.out.println(file.getOriginalFilename());//real.png
//        System.out.println(file.getName());
//        System.out.println(Objects.requireNonNull(file.getContentType()).substring(0,file.getContentType().indexOf("/")));//image/png
        User user = (User) session.getAttribute("user");
        club.setClubMasterId(user.getUserId());

        if (Objects.requireNonNull(file.getContentType()).substring(0, file.getContentType().indexOf("/")).equals("image")) {
            String fileName = clubImagePath + UUID.randomUUID() + file.getOriginalFilename();
            java.io.File uploadFile = new java.io.File(fileName);
            file.transferTo(uploadFile);
            club.setClubImage(fileName);
        }

        StringBuilder clubTag = new StringBuilder();

        for(String s : clubTags){
            clubTag.append("#").append(s).append(" ");
        }

        club.setTag(clubTag.toString().trim());

        club = clubService.addClub(club);
        return "redirect:/club/getClub/" + club.getClubNum();
    }

    @RequestMapping(value = "listClub")
    public String listClub(Model model, HttpSession session, @RequestParam(value = "searchLocation", required = false) String searchLocation, @RequestParam(value = "searchTag", required = false) List<String> searchTag, @RequestParam(value = "searchInterList", required = false) List<String> searchInterList, @ModelAttribute("search") Search search) throws Exception {
        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);
        search.setSearchCondition("1");
//        System.out.println(searchLocation);
        System.out.println(searchTag);
//        System.out.println(searchInterList);
        User user = (User) session.getAttribute("user");
        String userId = "";
        if (user != null) {
            userId = user.getUserId();
            if(searchLocation==null){
                searchLocation = ((User)session.getAttribute("user")).getVillCode();
                searchInterList = new ArrayList<>();
                for(UserInterList uil : (List<UserInterList>) myPageService.getMyInfor(userId).get("interList")){
                    String str = null;
                    int item = Integer.parseInt(uil.getInterList().trim());
                    if(item<10){
                        str = "0"+item;
                    }else {
                        str = ""+item;
                    }
                    searchInterList.add(str);
                }
            }
        }else {
            if(searchLocation==null){
                searchLocation="역삼1동";
            }
        }
        List<Club> list = clubService.listClub(userId,search,searchLocation,searchInterList,searchTag);
        for(Club club : list){
            club.parseInterList();
        }
        model.addAttribute("list", list);
        model.addAttribute("searchTag",searchTag);
        model.addAttribute("searchLocation",searchLocation);
        model.addAttribute("searchInterList",searchInterList);
        return "/view/club/listClub.jsp";
    }

    @RequestMapping(value = "getClub/{clubNum}")
    public String getClub(Model model, @PathVariable int clubNum, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Cluber currentCluber = clubService.getCluberCondition(user, clubNum);
            session.setAttribute("currentCluber", currentCluber);
        } else {
            session.removeAttribute("currentCluber");
        }
        Club club = clubService.getClub(clubNum);
        List<String> tagList = new ArrayList<>();
        for(String tag : club.getTag().split("#")){
            if(!tag.equals("")){
                tagList.add(tag.trim());
            }
        }
        club.parseInterList();
        model.addAllAttributes(KakaoMapApi.getJsonAddress(club.getVillCode()));
        model.addAttribute("club", club);
        model.addAttribute("tagList", tagList);
        return "/view/club/getClub.jsp";
    }

    @RequestMapping(value = "updateClub/{clubNum}", method = RequestMethod.GET)
    public String updateClubView(Model model, @PathVariable int clubNum) {
        model.addAttribute(clubService.getClub(clubNum));
        return "/view/club/updateClub.jsp";
    }

    @RequestMapping(value = "updateClub", method = RequestMethod.POST)
    public String updateClub(@ModelAttribute("club") Club club, @ModelAttribute("file") MultipartFile file, @RequestParam(value = "deleteFileName", required = false) String deleteFileName, @RequestParam("clubTags")List<String> clubTags) throws Exception {
        //새로운 파일 업로드
        if (Objects.requireNonNull(file.getContentType()).substring(0, file.getContentType().indexOf("/")).equals("image")) {
            String fileName = clubImagePath + UUID.randomUUID() + file.getOriginalFilename();
            System.out.println(fileName);
            java.io.File uploadFile = new java.io.File(fileName);
            file.transferTo(uploadFile);
            club.setClubImage(fileName);
        }

        if(club.getGatherCheck()==null){
            club.setGatherCheck("0");
        }

        StringBuilder clubTag = new StringBuilder();

        for(String s : clubTags){
            clubTag.append("#").append(s).append(" ");
        }

        club.setTag(clubTag.toString().trim());

        //파일 업데이트
        clubService.updateClub(club);

        //기존파일 삭제
//        System.out.println("deleteFileName : "+deleteFileName);
        if (deleteFileName != null) {
//            System.out.println("first if");
            java.io.File deleteFile = new java.io.File(resourcesPath + deleteFileName);
            if (deleteFile.exists()) {
//                System.out.println("second if");
                if (deleteFile.delete()) {
                    System.out.println("file deleted");
                } else {
                    System.out.println("cannot delete");
                }
            }
        }
        return "redirect:/club/getClub/" + club.getClubNum();
    }

    @RequestMapping(value = "deleteClub/{clubNum}")
    public String deleteClub(@PathVariable int clubNum) {
        Club club = new Club();
        club.setClubNum(clubNum);
        clubService.deleteClub(club);
        return "redirect:/club/listClub";
    }

    @RequestMapping(value = "addCluberApply/{clubNum}", method = RequestMethod.GET)
    public String addCluberApplyView(@PathVariable int clubNum, Model model) {
        Club club = clubService.getClub(clubNum);
        model.addAttribute("club", club);
        return "/view/club/addCluberApply.jsp";
    }

    @RequestMapping(value = "addCluberApply", method = RequestMethod.POST)
    public String addCluberApply(@ModelAttribute("cluber") Cluber cluber, HttpSession session) {
        cluber.setUser((User) session.getAttribute("user"));
        clubService.addCluberApply(cluber);
        return "redirect:/club/getClub/" + cluber.getClubNum();
    }

    @RequestMapping(value = "updateCluberApply/{clubNum}", method = RequestMethod.GET)
    public String updateCluberApplyView(@PathVariable int clubNum, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        Club club = clubService.getClub(clubNum);
        Cluber cluber = new Cluber();
        cluber.setUser(user);
        cluber.setClubNum(clubNum);
        cluber = clubService.getCluberApplyUpdate(cluber);
        model.addAttribute("club", club);
        model.addAttribute("cluber", cluber);
        return "/view/club/updateCluberApply.jsp";
    }

    @RequestMapping(value = "updateCluberApply", method = RequestMethod.POST)
    public String updateCluberApply(@ModelAttribute("cluber") Cluber cluber) {
        clubService.updateCluberApply(cluber);
        return "redirect:/club/getClub/" + cluber.getClubNum();
    }

    @RequestMapping(value = "deleteCluberApply", method = RequestMethod.POST)
    public String deleteCluberApply(@ModelAttribute("cluber") Cluber cluber) {
        clubService.deleteCluberApply(cluber.getClubUserNum());
        return "redirect:/club/getClub/" + cluber.getClubNum();
    }

    @RequestMapping(value = "listCluberApply/{clubNum}", method = RequestMethod.GET)
    public String listCluberApply(@PathVariable int clubNum, Model model) {
        model.addAttribute("list", clubService.listCluberApply(clubNum));
        return "/view/club/listCluberApply.jsp";
    }

    @RequestMapping(value = "listCluber/{clubNum}")
    public String listCluber(@PathVariable int clubNum, Model model, @ModelAttribute("search") Search search) {
        search.setPageSize(pageSize);
        search.setSearchCondition("0");
        Map<String, Object> map = clubService.listCluber(search, clubNum);
        Page resultPage = new Page(search.getCurrentPage(), (Integer) map.get("totalCount"), pageUnit, pageSize);
        map.put("resultPage", resultPage);
        model.addAllAttributes(map);
        return "/view/club/listCluber.jsp";
    }

    @RequestMapping(value = "listCluberOut/{clubNum}")
    public String listCluberOut(@PathVariable int clubNum, Model model, @ModelAttribute("search") Search search) {
        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);
        search.setSearchCondition("1");
        Map<String, Object> map = clubService.listCluber(search, clubNum);
        Page resultPage = new Page(search.getCurrentPage(), (Integer) map.get("totalCount"), pageUnit, pageSize);
        map.put("resultPage", resultPage);
        model.addAllAttributes(map);
        return "/view/club/listCluber.jsp";
    }

    @RequestMapping(value = "getCluber/{clubUserNum}", method = RequestMethod.GET)
    public String getCluber(@PathVariable int clubUserNum, Model model) {
        model.addAttribute("cluber", clubService.getCluber(clubUserNum));
        return "/view/club/getCluber.jsp";
    }

    @RequestMapping(value = "updateCluber/{clubUserNum}", method = RequestMethod.GET)
    public String updateCluberView(@PathVariable int clubUserNum, Model model) {
        model.addAttribute("cluber", clubService.getCluber(clubUserNum));
        return "/view/club/updateCluber.jsp";
    }

    @RequestMapping(value = "updateCluber", method = RequestMethod.POST)
    public String updateCluber(@ModelAttribute("cluber") Cluber cluber) {
        clubService.updateCluber(cluber);
        return "redirect:/club/getCluber/" + cluber.getClubUserNum();
    }

    @RequestMapping(value = "deleteCluber/{kickoutCheck}", method = RequestMethod.GET)
    public String deleteCluberView(@RequestParam(value = "clubNum", defaultValue = "0") int clubNum, @RequestParam(value = "clubUserNum", defaultValue = "0") int clubUserNum, @PathVariable String kickoutCheck, HttpSession session, Model model) {
        if (clubUserNum == 0) {
            Cluber cluber = new Cluber();
            cluber.setUser((User) session.getAttribute("user"));
            cluber.setClubNum(clubNum);
            clubUserNum = clubService.getCluberDelete(cluber);
        }
        model.addAttribute("cluber", clubService.getCluber(clubUserNum));
        model.addAttribute("kickoutCheck", kickoutCheck);

        return "/view/club/deleteCluber.jsp";
    }

    @RequestMapping(value = "deleteCluber", method = RequestMethod.POST)
    public String deleteCluber(@ModelAttribute("cluber") Cluber cluber,@ModelAttribute("user") User user, @RequestParam("kickoutCheck") String kickoutCheck) {
        cluber.setUser(user);
        clubService.deleteCluber(cluber, kickoutCheck);
        if (kickoutCheck.equals("T")) {
            return "redirect:/club/getCluber/" + cluber.getClubUserNum();
        } else {
            return "redirect:/club/getClub/" + cluber.getClubNum();
        }
    }

    @RequestMapping(value = "addClubBlacklist/{clubNum}", method = RequestMethod.GET)
    public String addClubBlacklistView(@PathVariable int clubNum, @RequestParam(value = "userId", required = false) String userId, Model model) {
        model.addAttribute("userId", userId);
        model.addAttribute("clubNum", clubNum);
        return "/view/club/addClubBlacklist.jsp";
    }

    @RequestMapping(value = "addClubBlacklist", method = RequestMethod.POST)
    public String addClubBlacklist(@ModelAttribute("cluber") Cluber cluber, @ModelAttribute("blackUser") User blackUser) {
        cluber.setUser(blackUser);
        clubService.addClubBlacklist(cluber);
        return "redirect:/club/listClubBlacklist/" + cluber.getClubNum();
    }

    @RequestMapping(value = "listClubBlacklist/{clubNum}")
    public String listClubBlacklist(@PathVariable int clubNum, Model model, @ModelAttribute("search") Search search) {
        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);
        Map<String, Object> map = clubService.listClubBlacklist(search, clubNum);
        Page resultPage = new Page(search.getCurrentPage(), (Integer) map.get("totalCount"), pageUnit, pageSize);
        map.put("resultPage", resultPage);
        model.addAllAttributes(map);
        return "/view/club/listClubBlacklist.jsp";
    }

    @RequestMapping(value = "addClubMasterBoard/{clubNum}", method = RequestMethod.GET)
    public String addClubMasterBoardView(@PathVariable int clubNum, Model model) {
        model.addAttribute("clubNum", clubNum);
        return "/view/club/addClubMasterBoard.jsp";
    }

    @RequestMapping(value = "addClubMasterBoard", method = RequestMethod.POST)
    public String addClubMasterBoard(@ModelAttribute("clubMasterBoard") ClubMasterBoard clubMasterBoard, MultipartHttpServletRequest multi) throws Exception {
        ////파일 업로드
        //파일 추출
        List<MultipartFile> mfs = multi.getFiles("file");
        System.out.println(mfs);
        //저장할 파일이 있는지 validation check
        if (mfs.size() > 0 && !mfs.get(0).getOriginalFilename().equals("")) {
            //저장할 리스트 생성
            List<File> files = new ArrayList<>();
            //추출된 파일 업로드
            for (MultipartFile mf : mfs) {
                //파일이 이미지인지 validation check
                if (Objects.requireNonNull(mf.getContentType()).substring(0, mf.getContentType().indexOf("/")).equals("image")) {
                    //파일 경로 및 이름 유니크하게 생성
                    String fileName = clubMasterBoardPath + UUID.randomUUID() + mf.getOriginalFilename();
                    java.io.File uploadFile = new java.io.File(fileName);
                    //파일 업로드
                    mf.transferTo(uploadFile);
                    //리스트에 파일 저장
                    File file = new File();
                    file.setFileName(fileName);
                    files.add(file);
                }
            }
            //domain 객체에 리스트 저장
            clubMasterBoard.setFiles(files);
        }

        //모임 공지사항 등록
        int boardNum = clubService.addClubMasterBoard(clubMasterBoard);
        return "redirect:/club/getClubMasterBoard/" + boardNum;
    }

    @RequestMapping(value = "getClubMasterBoard/{boardNum}", method = RequestMethod.GET)
    public String getClubMasterBoard(@PathVariable("boardNum") int boardNum, Model model) {
        model.addAttribute("clubMasterBoard", clubService.getClubMasterBoard(boardNum));
        return "/view/club/getClubMasterBoard.jsp";
    }

    @RequestMapping(value = "updateClubMasterBoard/{boardNum}", method = RequestMethod.GET)
    public String updateClubMasterBoardView(@PathVariable int boardNum, Model model) {
        ClubMasterBoard clubMasterBoard = clubService.getClubMasterBoard(boardNum);
        int fileSize = clubMasterBoard.getFiles().size();
        model.addAttribute("clubMasterBoard", clubMasterBoard);
        model.addAttribute("fileSize", fileSize);
        return "/view/club/updateClubMasterBoard.jsp";
    }

    @RequestMapping(value = "updateClubMasterBoard", method = RequestMethod.POST)
    public String updateClubMasterBoard(@ModelAttribute("clubMasterBoard") ClubMasterBoard clubMasterBoard, MultipartHttpServletRequest multi, @RequestParam(value = "deleteFileName", required = false) List<String> deleteFileNames) throws Exception {
        ////파일 업로드
        //파일 추출
        List<MultipartFile> mfs = multi.getFiles("file");
        System.out.println(mfs);
        //저장할 리스트 생성
        List<File> files = new ArrayList<>();
        //저장할 파일이 있는지 validation check
        if (mfs.size() > 0 && !mfs.get(0).getOriginalFilename().equals("")) {
            //추출된 파일 업로드
            for (MultipartFile mf : mfs) {
                //파일이 이미지인지 validation check
                if (Objects.requireNonNull(mf.getContentType()).substring(0, mf.getContentType().indexOf("/")).equals("image")) {
                    //파일 경로 및 이름 유니크하게 생성
                    String fileName = clubMasterBoardPath + UUID.randomUUID() + mf.getOriginalFilename();
                    java.io.File uploadFile = new java.io.File(fileName);
                    //파일 업로드
                    mf.transferTo(uploadFile);
                    //리스트에 파일 저장
                    File file = new File();
                    file.setFileName(fileName);
                    files.add(file);
                }
            }
        }
        //domain 객체에 리스트 저장
        clubMasterBoard.setFiles(files);

        //모임 공지사항 수정
        //서비스에서 일부러 에러 발생해서 롤백 - 검증용
        try {
            clubService.updateClubMasterBoard(clubMasterBoard, deleteFileNames);
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
        }

        //기존파일 삭제
//        System.out.println("deleteFileNames : "+deleteFileNames);
        if (deleteFileNames != null) {
            for (String deleteFileName : deleteFileNames) {
                java.io.File deleteFile = new java.io.File(resourcesPath + deleteFileName);
                if (deleteFile.exists()) {
                    if (deleteFile.delete()) {
                        System.out.println("file deleted");
                    } else {
                        System.out.println("cannot delete");
                    }
                }
            }
        }

        return "redirect:/club/getClubMasterBoard/" + clubMasterBoard.getBoardNum();
    }

    @RequestMapping(value = "deleteClubMasterBoard/{clubMasterBoardNum}/{clubNum}", method = RequestMethod.GET)
    public String deleteClubMasterBoard(@PathVariable int clubMasterBoardNum, @PathVariable int clubNum) {
        List<String> deleteFileNames = clubService.deleteClubMasterBoard(clubMasterBoardNum);

        ////기존파일 삭제
        //확인
//        System.out.println("deleteFileNames : "+deleteFileNames);
        //validation check
        if (deleteFileNames != null) {
            //각 항목 삭제
            for (String deleteFileName : deleteFileNames) {
                //파일 설정
                java.io.File deleteFile = new java.io.File(resourcesPath + deleteFileName);
                //파일이 있으면 삭제
                if (deleteFile.exists()) {
                    if (deleteFile.delete()) {
                        System.out.println("file deleted");
                    } else {
                        System.out.println("cannot delete");
                    }
                }
            }
        }

        return "redirect:/club/listClubMasterBoard/" + clubNum;
    }

    @RequestMapping(value = "listClubCalendarApply/{clubCalendarNum}", method = RequestMethod.GET)
    public String listClubCalendarApply(@PathVariable int clubCalendarNum, Model model) {
        model.addAttribute("list", clubService.listClubCalendarApply(clubCalendarNum, "0"));
        return "/view/club/listClubCalendarApply.jsp";
    }

    @RequestMapping(value = "listCalendarCluber/{clubCalendarNum}", method = RequestMethod.GET)
    public String listCalendarCluber(@PathVariable int clubCalendarNum, Model model) {
        model.addAttribute("list", clubService.listClubCalendarApply(clubCalendarNum, "1"));
        return "/view/club/listCalendarCluber.jsp";
    }

    @RequestMapping("updateClubMaster/{clubUserNum}")
    public String updateClubMaster(@PathVariable int clubUserNum) {
        clubService.updateClubMaster(clubService.getCluber(clubUserNum));
        return "redirect:/club/getCluber/" + clubUserNum;
    }

    @RequestMapping("addClubManager/{clubUserNum}")
    public String addClubManager(@PathVariable int clubUserNum) {
        clubService.addClubManager(clubUserNum);
        return "redirect:/club/getCluber/" + clubUserNum;
    }

    @RequestMapping("deleteClubManager/{clubUserNum}")
    public String deleteClubManager(@PathVariable int clubUserNum) {
        clubService.deleteClubManager(clubUserNum);
        return "redirect:/club/getCluber/" + clubUserNum;
    }

    @RequestMapping("updateClubBlacklist/{process}")
    public String updateClubBlacklist(@PathVariable String process, @RequestParam(value = "clubUserNum", required = false) List<Integer> clubUserNumList, @RequestParam("clubNum") int clubNum) {
        clubService.updateClubBlacklist(process, clubUserNumList);
        return "redirect:/club/listClubBlacklist/" + clubNum;
    }

    //확인용

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
        return "/view/club/listClubMasterBoard.jsp";
    }

    @RequestMapping(value = "listVote/{roomId}", method = RequestMethod.GET)
    public String listVote(@PathVariable String roomId, Model model) {
        model.addAttribute("list", clubService.listVote(roomId));
        return "/view/club/listVote.jsp";
    }

    @RequestMapping(value = "getVote/{voteNum}", method = RequestMethod.GET)
    public String getVote(@PathVariable int voteNum, Model model, HttpSession session) {
        String userId = ((User) session.getAttribute("user")).getUserId();
        model.addAttribute("vote", clubService.getVote(voteNum, userId));
//        Voter voter = new Voter();
//        voter.setUserId(userId);
//        voter.setVoteNum(voteNum);
//        model.addAttribute("myVoter", clubService.listVoter(voter));
        return "/view/club/getVote.jsp";
    }

    @RequestMapping(value = "addVote/{roomId}", method = RequestMethod.GET)
    public String addVoteView(@PathVariable String roomId, @ModelAttribute("vote") Vote vote) {
        return "/view/club/addVote.jsp";
    }

    @RequestMapping(value = "addVote", method = RequestMethod.POST)
    public String addVote(@ModelAttribute("vote") Vote vote) {
        if (vote.getMultiVoteCheck() == null) {
            vote.setMultiVoteCheck("0");
        }
        if (vote.getHideVoteCheck() == null) {
            vote.setHideVoteCheck("0");
        }
        if (vote.getEndDateCheck() == null) {
            vote.setEndDateCheck("0");
        }
        clubService.addVote(vote);
        return "redirect:/club/listVote/" + vote.getRoomId();
    }

    @RequestMapping(value = "updateVote/{voteNum}", method = RequestMethod.GET)
    public String updateVoteView(@PathVariable int voteNum, Model model, HttpSession session) {
        String userId = ((User) session.getAttribute("user")).getUserId();
        model.addAttribute("vote", clubService.getVote(voteNum, userId));
        return "/view/club/updateVote.jsp";
    }

    @RequestMapping(value = "updateVote", method = RequestMethod.POST)
    public String updateVote(@ModelAttribute("vote") Vote vote) {
        if (vote.getMultiVoteCheck() == null) {
            vote.setMultiVoteCheck("0");
        }
        if (vote.getHideVoteCheck() == null) {
            vote.setHideVoteCheck("0");
        }
        if (vote.getEndDateCheck() == null) {
            vote.setEndDateCheck("0");
            vote.setEndDate(null);
        }
        clubService.updateVote(vote);
        return "redirect:/club/getVote/" + vote.getVoteNum();
    }

    @RequestMapping(value = "deleteVote/{roomId}/{voteNum}", method = RequestMethod.GET)
    public String deleteVote(@PathVariable int voteNum, @PathVariable String roomId) {
        clubService.deleteVote(voteNum);
        return "redirect:/club/listVote/" + roomId;
    }

//    @RequestMapping(value = "addVoter", method = RequestMethod.POST)
//    public String addVoter(@RequestParam("voteItem") List<String> voteItems, @RequestParam("voteNum") int voteNum, HttpSession session) {
//        String userId = ((User) session.getAttribute("user")).getUserId();
//        clubService.addVoter(voteItems, userId, voteNum);
//        return "redirect:/club/getVote/" + voteNum;
//    }

    @RequestMapping(value = "updateVoter", method = RequestMethod.POST)
    public String updateVoter(@RequestParam("voteItem") List<String> voteItems, @RequestParam("voteNum") int voteNum, HttpSession session) {
        String userId = ((User) session.getAttribute("user")).getUserId();
        clubService.updateVoter(voteItems, userId, voteNum);
        return "redirect:/club/getVote/" + voteNum;
    }

    @RequestMapping(value = "endVote/{voteNum}", method = RequestMethod.GET)
    public String endVote(@PathVariable int voteNum) {
        Vote vote = new Vote();
        vote.setVoteNum(voteNum);
        vote.setEndCheck("1");
        clubService.updateVote(vote);
        return "redirect:/club/getVote/" + voteNum;
    }

    @RequestMapping(value = "feane/{page}", method = RequestMethod.GET)
    public String feane(@PathVariable String page) {
        return "/view/feane/"+page+".jsp";
    }
}
