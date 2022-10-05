package com.project.club.controller;

import com.project.club.service.ClubService;
import com.project.domain.Club;
import com.project.domain.User;
import com.project.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "addClub", method = RequestMethod.GET)
    public String addClubView(){
        return "/view/club/addClub.jsp";
    }

    @RequestMapping(value = "addClub", method = RequestMethod.POST)
    public String addClub(@ModelAttribute("club") Club club) throws Exception{
        club.setClubMasterId("user02");
        club = clubService.addClub(club);
        return "redirect:/club/getClub/"+club.getClubNum();
    }

    @RequestMapping(value = "listClub")
    public String listClub(Model model){
        String userId = "user01";
        List<Club> list = clubService.listClub(userId);
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

//    @RequestMapping(value = "updateClub", method = RequestMethod.POST)
//    public String updateClub(@ModelAttribute("club") Club club) throws Exception{
//        club.setClubMasterId("user02");
//        club = clubService.updateClub(club);
//        return "redirect:/club/getClub/"+club.getClubNum();
//    }
//
//    @RequestMapping(value = "delete/{clubNum}")
//    public String deleteClub(@PathVariable int clubNum){
//        Club club = new Club();
//        club.setClubNum(clubNum);
//        clubService.deleteClub(club);
//        return "redirect:/club/listClub";
//    }
}
