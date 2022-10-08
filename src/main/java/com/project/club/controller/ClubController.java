package com.project.club.controller;

import com.project.club.service.ClubService;
import com.project.domain.*;
import com.project.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/club/*")
public class ClubController {

    @Autowired
    @Qualifier("clubServiceImpl")
    private ClubService clubService;

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @Value("#{commonProperties['pageSize']}")
    int pageSize;

    @Value("#{commonProperties['pageUnit']}")
    int pageUnit;

    public ClubController() {
    }

    @RequestMapping(value = "login")
    public String login(HttpSession session, @RequestParam("userId") String userId) throws Exception{
        User user = userService.getUser(userId);
        session.setAttribute("user",user);
        return "/club/listClub";
    }

    @RequestMapping(value = "addClub", method = RequestMethod.GET)
    public String addClubView(){
        return "/view/club/addClub.jsp";
    }

    @RequestMapping(value = "addClub", method = RequestMethod.POST)
    public String addClub(@ModelAttribute("club") Club club){
        club.setClubMasterId("user02");
        club = clubService.addClub(club);
        return "redirect:/club/getClub/"+club.getClubNum();
    }

    @RequestMapping(value = "listClub")
    public String listClub(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Club> list = clubService.listClub("");
        if (user!=null) {
            list = clubService.listClub(user.getUserId());
        }
        model.addAttribute("list",list);
        return "/view/club/listClub.jsp";
    }

    @RequestMapping(value = "getClub/{clubNum}")
    public String getClub(Model model, @PathVariable int clubNum){
        Club club = clubService.getClub(clubNum);
        model.addAttribute("club",club);
        return "/view/club/getClub.jsp";
    }

    @RequestMapping(value = "updateClub/{clubNum}", method = RequestMethod.GET)
    public String updateClubView(Model model, @PathVariable int clubNum){
        model.addAttribute(clubService.getClub(clubNum));
        return "/view/club/updateClub.jsp";
    }

    @RequestMapping(value = "updateClub", method = RequestMethod.POST)
    public String updateClub(@ModelAttribute("club") Club club) throws Exception{
        club.setClubMasterId("user02");
        club = clubService.updateClub(club);
        return "redirect:/club/getClub/"+club.getClubNum();
    }

    @RequestMapping(value = "deleteClub/{clubNum}")
    public String deleteClub(@PathVariable int clubNum){
        Club club = new Club();
        club.setClubNum(clubNum);
        clubService.deleteClub(club);
        return "redirect:/club/listClub";
    }

    @RequestMapping(value = "addCluberApply/{clubNum}", method = RequestMethod.GET)
    public String addCluberApplyView(@PathVariable int clubNum, Model model){
        Club club = clubService.getClub(clubNum);
        model.addAttribute("club",club);
        return "/view/club/addCluberApply.jsp";
    }

    @RequestMapping(value = "addCluberApply", method = RequestMethod.POST)
    public String addCluberApply(@ModelAttribute("cluber") Cluber cluber, HttpSession session){
        cluber.setUser((User)session.getAttribute("user"));
        clubService.addCluberApply(cluber);
        return "redirect:/club/getClub/"+cluber.getClubNum();
    }

    @RequestMapping(value = "updateCluberApply/{clubNum}", method = RequestMethod.GET)
    public String updateCluberApplyView(@PathVariable int clubNum, HttpSession session, Model model){
        User user = (User) session.getAttribute("user");
        Club club = clubService.getClub(clubNum);
        Cluber cluber = new Cluber();
        cluber.setUser(user);
        cluber.setClubNum(clubNum);
        cluber = clubService.getCluberApplyUpdate(cluber);
        model.addAttribute("club",club);
        model.addAttribute("cluber",cluber);
        return "/view/club/updateCluberApply.jsp";
    }

    @RequestMapping(value = "updateCluberApply", method = RequestMethod.POST)
    public String updateCluberApply(@ModelAttribute("cluber") Cluber cluber){
        clubService.updateCluberApply(cluber);
        return "redirect:/club/getClub/"+cluber.getClubNum();
    }

    @RequestMapping(value = "deleteCluberApply", method = RequestMethod.POST)
    public String deleteCluberApply(@ModelAttribute("cluber") Cluber cluber){
        clubService.deleteCluberApply(cluber.getClubUserNum());
        return "redirect:/club/getClub/"+cluber.getClubNum();
    }

    @RequestMapping(value = "listCluberApply/{clubNum}", method = RequestMethod.GET)
    public String listCluberApply(@PathVariable int clubNum, Model model){
        model.addAttribute("list", clubService.listCluberApply(clubNum));
        return "/view/club/listCluberApply.jsp";
    }

    @RequestMapping(value = "listCluber/{clubNum}", method = RequestMethod.GET)
    public String listCluber(@PathVariable int clubNum, Model model){
        model.addAttribute("clubNum",clubNum);
        model.addAttribute("list",clubService.listCluber(clubNum));
        return "/view/club/listCluber.jsp";
    }

    @RequestMapping(value = "getCluber/{clubUserNum}", method = RequestMethod.GET)
    public String getCluber(@PathVariable int clubUserNum, Model model){
        model.addAttribute("cluber", clubService.getCluber(clubUserNum));
        return "/view/club/getCluber.jsp";
    }

    @RequestMapping(value = "updateCluber/{clubUserNum}", method = RequestMethod.GET)
    public String updateCluberView(@PathVariable int clubUserNum, Model model){
        model.addAttribute("cluber", clubService.getCluber(clubUserNum));
        return "/view/club/updateCluber.jsp";
    }

    @RequestMapping(value = "updateCluber", method = RequestMethod.POST)
    public String updateCluber(@ModelAttribute("cluber") Cluber cluber){
        clubService.updateCluber(cluber);
        return "redirect:/club/getCluber/"+cluber.getClubUserNum();
    }

    @RequestMapping(value = "deleteCluber/{kickoutCheck}", method = RequestMethod.GET)
    public String deleteCluberView(@RequestParam(value = "clubNum", defaultValue = "0") int clubNum, @RequestParam(value = "clubUserNum", defaultValue = "0") int clubUserNum, @PathVariable String kickoutCheck, HttpSession session, Model model){
        if(clubUserNum==0){
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
    public String deleteCluber(@ModelAttribute("cluber") Cluber cluber, @RequestParam("kickoutCheck") String kickoutCheck){
        clubService.deleteCluber(cluber,kickoutCheck);
        if (kickoutCheck.equals("T")){
            return "redirect:/club/getCluber/"+cluber.getClubUserNum();
        }else {
            return "redirect:/club/getClub/"+cluber.getClubNum();
        }
    }

    @RequestMapping(value = "addClubBlacklist/{clubNum}", method = RequestMethod.GET)
    public String addClubBlacklistView(@PathVariable int clubNum, @RequestParam(value = "userId", required = false) String userId, Model model){
        model.addAttribute("userId", userId);
        model.addAttribute("clubNum", clubNum);
        return "/view/club/addClubBlacklist.jsp";
    }

    @RequestMapping(value = "addClubBlacklist", method = RequestMethod.POST)
    public String addClubBlacklist(@ModelAttribute("cluber") Cluber cluber,@ModelAttribute("blackUser") User blackUser){
        cluber.setUser(blackUser);
        clubService.addClubBlacklist(cluber);
        return "redirect:/club/listClubBlacklist/"+cluber.getClubNum();
    }

    @RequestMapping(value = "listClubBlacklist/{clubNum}", method = RequestMethod.GET)
    public String listClubBlacklist(@PathVariable int clubNum, Model model){
        model.addAttribute("list",clubService.listClubBlacklist(clubNum));
        model.addAttribute("clubNum",clubNum);
        return "/view/club/listClubBlacklist.jsp";
    }

    @RequestMapping(value = "addClubMasterBoard/{clubNum}", method = RequestMethod.GET)
    public String addClubMasterBoardView(@PathVariable int clubNum, Model model){
        model.addAttribute("clubNum", clubNum);
        return "/view/club/addClubMasterBoard.jsp";
    }

    @RequestMapping(value = "addClubMasterBoard", method = RequestMethod.POST)
    public String addClubMasterBoard(@ModelAttribute("clubMasterBoard") ClubMasterBoard clubMasterBoard, @RequestParam("fileName") List<String> fileNames){
        List<File> files = new ArrayList<>();
        for(String str : fileNames){
            File file = new File();
            file.setFileName(str);
            files.add(file);
        }
        clubMasterBoard.setFiles(files);
        int boardNum = clubService.addClubMasterBoard(clubMasterBoard);
        return "redirect:/club/getClubMasterBoard/"+boardNum;
    }

    @RequestMapping(value = "getClubMasterBoard/{boardNum}", method = RequestMethod.GET)
    public String getClubMasterBoard(@PathVariable("boardNum") int boardNum, Model model){
        model.addAttribute("clubMasterBoard",clubService.getClubMasterBoard(boardNum));
        return "/view/club/getClubMasterBoard.jsp";
    }

    @RequestMapping(value = "updateClubMasterBoard/{boardNum}", method = RequestMethod.GET)
    public String updateClubMasterBoardView(@PathVariable int boardNum, Model model){
        model.addAttribute("clubMasterBoard", clubService.getClubMasterBoard(boardNum));
        return "/view/club/updateClubMasterBoard.jsp";
    }

    @RequestMapping(value = "updateClubMasterBoard", method = RequestMethod.POST)
    public String updateClubMasterBoard(@ModelAttribute("clubMasterBoard") ClubMasterBoard clubMasterBoard, @RequestParam("fileName") List<String> fileNames){
        List<File> files = new ArrayList<>();
        for(String str : fileNames){
            File file = new File();
            file.setBoardNum(clubMasterBoard.getBoardNum());
            file.setFileName(str);
            files.add(file);
        }
        clubMasterBoard.setFiles(files);
        clubService.updateClubMasterBoard(clubMasterBoard);
        return "redirect:/club/getClubMasterBoard/"+clubMasterBoard.getBoardNum();
    }

    @RequestMapping(value = "deleteClubMasterBoard/{clubMasterBoardNum}/{clubNum}", method = RequestMethod.GET)
    public String deleteClubMasterBoard(@PathVariable int clubMasterBoardNum, @PathVariable int clubNum){
        clubService.deleteClubMasterBoard(clubMasterBoardNum);
        return "redirect:/club/listClubMasterBoard/"+clubNum;
    }

    @RequestMapping(value = "listClubCalendarApply/{clubCalendarNum}", method = RequestMethod.GET)
    public String listClubCalendarApply(@PathVariable int clubCalendarNum, Model model){
        model.addAttribute("list", clubService.listClubCalendarApply(clubCalendarNum,"0"));
        return "/view/club/listClubCalendarApply.jsp";
    }

    @RequestMapping(value = "listCalendarCluber/{clubCalendarNum}", method = RequestMethod.GET)
    public String listCalendarCluber(@PathVariable int clubCalendarNum, Model model){
        model.addAttribute("list",clubService.listClubCalendarApply(clubCalendarNum,"1"));
        return "/view/club/listCalendarCluber.jsp";
    }

    @RequestMapping("updateClubMaster/{clubUserNum}")
    public String updateClubMaster(@PathVariable int clubUserNum){
        clubService.updateClubMaster(clubService.getCluber(clubUserNum));
        return "redirect:/club/getCluber/"+clubUserNum;
    }

    @RequestMapping("addClubManager/{clubUserNum}")
    public String addClubManager(@PathVariable int clubUserNum){
        clubService.addClubManager(clubUserNum);
        return "redirect:/club/getCluber/"+clubUserNum;
    }

    @RequestMapping("deleteClubManager/{clubUserNum}")
    public String deleteClubManager(@PathVariable int clubUserNum){
        clubService.deleteClubManager(clubUserNum);
        return "redirect:/club/getCluber/"+clubUserNum;
    }

    @RequestMapping("updateClubBlacklist/{process}")
    public String updateClubBlacklist(@PathVariable String process, @RequestParam("clubUserNum") List<Integer> clubUserNumList, @RequestParam("clubNum") int clubNum){
        clubService.updateClubBlacklist(process, clubUserNumList);
        return "redirect:/club/listClubBlacklist/"+clubNum;
    }

    //확인용

    @RequestMapping(value = "listClubMasterBoard/{clubNum}", method = RequestMethod.GET)
    public String listClubMasterBoard(Model model, @PathVariable("clubNum") int clubNum){
        model.addAttribute("list",clubService.listClubMasterBoard(clubNum));
        return "/view/club/listClubMasterBoard.jsp";
    }
}
