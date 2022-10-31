package com.project.site.controller;
import com.project.club.service.ClubCalendarService;
import com.project.club.service.ClubService;
import com.project.common.Page;
import com.project.common.Search;
import com.project.community.service.CommunityService;
import com.project.domain.*;
import com.project.site.service.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/site/*")
public class SiteController {
    @Autowired
    @Qualifier("siteServiceImpl")
    private SiteService siteService;

    @Autowired
    @Qualifier("clubServiceImpl")
    private ClubService clubService;

    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService commuService;

    @Autowired
    @Qualifier("clubCalenderServiceImpl")
    private ClubCalendarService calenderService;

    public SiteController() {
        System.out.println(this.getClass());
    }

    @Value("#{commonProperties['pageUnit']}")
    int pageUnit;

    @Value("#{commonProperties['pageSize']}")
    int pageSize;

    @Value("#{commonProperties['masterBoardPath']}")
    String masterBoardPath;

    @Value("#{commonProperties['clubReportPath']}")
    String clubReportPath;

    @Value("#{commonProperties['commuReportPath']}")
    String commuReportPath;

    @RequestMapping(value="addMasterBoard", method=RequestMethod.GET)
    public String addMasterBoard( ) throws Exception {
        System.out.println("/site/addMasterBoard : GET");

        return "redirect:/view/site/addMasterBoard.jsp";
    }

    @RequestMapping(value = "addMasterBoard", method = RequestMethod.POST)
    public String addMasterBoard(@ModelAttribute("MasterBoard") MasterBoard masterBoard, HttpSession session,
                                 MultipartHttpServletRequest uploadFile) throws Exception {
        System.out.println("/site/addMasterBoard : POST");

        User user = (User) session.getAttribute("user");
        String userId = "admin";
        if(user != null) {
            userId = user.getUserId();
        }
        masterBoard.setAdminId(userId);

        List<MultipartFile> fileList = uploadFile.getFiles("file");
        System.out.println(fileList);

        if(fileList.size() >0 && !fileList.get(0).getOriginalFilename().equals("")) {
            List<File> files = new ArrayList<>();

            for(MultipartFile mfile : fileList) {
                if (Objects.requireNonNull(mfile.getContentType()).substring(0, mfile.getContentType().indexOf("/")).equals("image")) {
                    String fileName = masterBoardPath + UUID.randomUUID() + mfile.getOriginalFilename();
                    java.io.File upFile = new java.io.File(fileName);

                    mfile.transferTo(upFile);

                    File file = new File();
                    file.setFileName(fileName);
                    files.add(file);
                }
            }
            masterBoard.setFiles(files);
        }

        siteService.addMasterBoard(masterBoard);
        return "redirect:/site/listMasterBoard";
    }

    @RequestMapping(value = "getMasterBoard/{masterBoardNo}", method = RequestMethod.GET)
    public String getMasterBoard(@PathVariable int masterBoardNo, Model model) throws Exception {
        System.out.println("/site/getMasterBoard : GET");
        MasterBoard masterBoard = siteService.getMasterBoard(masterBoardNo);
        model.addAttribute("masterBoard", masterBoard);
        return "forward:/view/site/getMasterBoard.jsp";
    }

    @RequestMapping(value = "listMasterBoard")
    public String listMasterBoard(@ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("/site/listMasterBoard : GET / POST");

        if(search.getCurrentPage() == 0 ){
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);
        System.out.println("======================SearchCondition" +search.getSearchCondition());

        Map<String , Object> map = siteService.listMasterBoard(search);

        Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
        System.out.println("resultPage : " + resultPage);
        System.out.println("list : " + map.get("list"));

        model.addAttribute("list", map.get("list"));
        model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);

        return "forward:/view/site/listMasterBoard.jsp";
    }

    @RequestMapping(value="updateMasterBoard/{masterBoardNo}", method=RequestMethod.GET)
    public String updateMasterBoard(@PathVariable int masterBoardNo , Model model) throws Exception {
        System.out.println("/site/updateMasterBoard : GET");

        MasterBoard masterBoard = siteService.getMasterBoard(masterBoardNo);

        siteService.updateMasterBoard(masterBoard);

        model.addAttribute("masterBoard", masterBoard);
        return "forward:/view/site/updateMasterBoard.jsp";
    }

    @RequestMapping(value="updateMasterBoard", method=RequestMethod.POST)
    public String updateMasterBoard(@ModelAttribute("masterBoard") MasterBoard masterBoard) throws Exception {
        System.out.println("/site/updateMasterBoard : POST");

        siteService.updateMasterBoard(masterBoard);

        return "redirect:/site/getMasterBoard/" +masterBoard.getMasterBoardNo();
    }

    @RequestMapping(value="deleteMasterBoard/{masterBoardNo}", method=RequestMethod.GET)
    public String deleteMasterBoard(@PathVariable int masterBoardNo , Model model) throws Exception {
        System.out.println("/site/deleteMasterBoard : GET");

        MasterBoard masterBoard = siteService.getMasterBoard(masterBoardNo);

        siteService.deleteMasterBoard(masterBoardNo);

        model.addAttribute("masterBoard", masterBoard);
        return "redirect:/site/listMasterBoard";
    }

    @RequestMapping(value = "getCommunityReport/{reportNo}", method = RequestMethod.GET)
    public String getCommunityReport(@PathVariable int reportNo, Model model) throws Exception {
        System.out.println("/site/getCommunityReport : GET");
        CommunityReport communityReport = siteService.getCommunityReport(reportNo);

        System.out.println("-------- Board Category : " +communityReport.getBoardCategory());

        if(communityReport.getBoardCategory().equals("1") || communityReport.getBoardCategory().equals("2")) {
            ClubCalendarReview clubCalReview = new ClubCalendarReview();
            clubCalReview = calenderService.getCalenderReview(communityReport.getBoardNo());

            if(clubCalReview != null) {
                model.addAttribute("clubCalReview", clubCalReview);
            }
        }
        else if(communityReport.getBoardCategory().equals("3")) {
            VilBoard villBoard = new VilBoard();
            villBoard = commuService.getVillBoard(communityReport.getBoardNo());

            if (villBoard != null) {
                model.addAttribute("villBoard", villBoard);
            }
        }else if(communityReport.getBoardCategory().equals("10")) {


        }else if(communityReport.getBoardCategory().equals("11")) {

        }


        model.addAttribute("communityReport", communityReport);
        return "forward:/view/site/getCommunityReport.jsp";
    }

    @RequestMapping(value = "listCommunityReport")
    public String listCommunityReport(@ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("/site/listCommunityReport : GET / POST");

        if(search.getCurrentPage() == 0 ){
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String , Object> map = siteService.listCommunityReport(search);

        Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
        System.out.println("resultPage : " + resultPage);
        System.out.println("list : " + map.get("list"));

        model.addAttribute("list", map.get("list"));
        model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);

        return "forward:/view/site/listCommunityReport.jsp";
    }

    @RequestMapping(value="addCommunityReport", method=RequestMethod.GET)
    public String addCommunityReport(@RequestParam String reportedId, @RequestParam String boardCategory,
                                     @RequestParam int boardNo,
                                     @ModelAttribute ("communityReport") CommunityReport communityReport,
                                     Model model,
                                     HttpSession session) throws Exception {
        System.out.println("/site/addCommunityReport : GET");
        System.out.println("Reported Id :" +reportedId);
        System.out.println("boardCategory :" +boardCategory);
        System.out.println("boardNo :" +boardNo);

        String userId = ((User) session.getAttribute("user")).getUserId();

        communityReport.setReportId(userId);
        communityReport.setReportedId(reportedId);
        communityReport.setBoardCategory(boardCategory);
        communityReport.setBoardNo(boardNo);

        model.addAttribute("communityReport", communityReport);

        return "forward:/view/site/addCommunityReport.jsp";
    }

    @RequestMapping(value="addCommunityReport", method=RequestMethod.POST)
    public String addCommunityReport(@ModelAttribute ("communityReport") CommunityReport communityReport,
                                     MultipartHttpServletRequest uploadFile) throws Exception {
        System.out.println("/site/addCommunityReport : POST");

        List<MultipartFile> fileList = uploadFile.getFiles("file");
        System.out.println(fileList);

        if(fileList.size() >0 && !fileList.get(0).getOriginalFilename().equals("")) {
            List<File> files = new ArrayList<>();

            for(MultipartFile mfile : fileList) {
                if (Objects.requireNonNull(mfile.getContentType()).substring(0, mfile.getContentType().indexOf("/")).equals("image")) {
                    String fileName = commuReportPath + UUID.randomUUID() + mfile.getOriginalFilename();
                    java.io.File upFile = new java.io.File(fileName);

                    mfile.transferTo(upFile);

                    File file = new File();
                    file.setFileName(fileName);
                    files.add(file);
                }
            }
            communityReport.setFiles(files);
        }
        siteService.addCommunityReport(communityReport);
        return "redirect:/site/listCommunityReport";
    }

    @RequestMapping(value="updateCommunityReport/{reportNo}", method=RequestMethod.GET)
    public String updateCommunityReport(@PathVariable int reportNo , Model model) throws Exception {
        System.out.println("/site/updateCommunityReport : GET");

        CommunityReport communityReport = siteService.getCommunityReport(reportNo);

        //siteService.processCommunityReport(communityReport);

        model.addAttribute("communityReport", communityReport);
        return "forward:/view/site/updateCommunityReport.jsp";
    }

    @RequestMapping(value="updateCommunityReport", method=RequestMethod.POST)
    public String updateCommunityReport(@ModelAttribute("communityReport") CommunityReport communityReport) throws Exception {
        System.out.println("/site/updateCommunityReport : POST");

        siteService.processCommunityReport(communityReport);

        return "redirect:/site/listCommunityReportProcess";
    }

    @RequestMapping(value="deleteCommunityReport/{reportNo}", method=RequestMethod.GET)
    public String deleteCommunityReport(@PathVariable int reportNo , Model model) throws Exception {
        System.out.println("/site/deleteCommunityReport : GET");

        CommunityReport communityReport = siteService.getCommunityReport(reportNo);

        siteService.deleteCommunityReport(reportNo);

        model.addAttribute("communityReport", communityReport);
        return "redirect:/site/listCommunityReport";
    }

    @RequestMapping(value = "listCommunityReportProcess")
    public String listCommunityReportProcess(@ModelAttribute("search") Search search, HttpServletRequest response, Model model) throws Exception {
        System.out.println("/site/listCommunityReportProcess : GET / POST");

        if(search.getCurrentPage() == 0 ){
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        System.out.println(response);
        Map<String , Object> map = siteService.listCommunityReportProcess(search);

        Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
        System.out.println("resultPage : " + resultPage);
        System.out.println("list : " + map.get("list"));

        model.addAttribute("list", map.get("list"));
        model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);

        return "forward:/view/site/listCommunityReportProcess.jsp";
    }
    //Community Report Controller End

    //Club Report Controller Start
    @RequestMapping(value = "listClubReport")
    public String listClubReport(@ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("/site/listClubReport : GET / POST");

        if(search.getCurrentPage() == 0 ){
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String , Object> map = siteService.listClubReport(search);

        Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
        System.out.println("resultPage : " + resultPage);
        System.out.println("list : " + map.get("list"));

        model.addAttribute("list", map.get("list"));
        model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);

        return "forward:/view/site/listClubReport.jsp";
    }

    @RequestMapping(value = "addClubReport", method = RequestMethod.POST)
    public String addClubReport(@ModelAttribute("clubReport") ClubReport clubReport, HttpSession session,
                                MultipartHttpServletRequest uploadFile) throws Exception {
        System.out.println("/site/addClubReport : POST");

        List<MultipartFile> fileList = uploadFile.getFiles("file");
        System.out.println(fileList);

        if(fileList.size() >0 && !fileList.get(0).getOriginalFilename().equals("")) {
            List<File> files = new ArrayList<>();

            for(MultipartFile mfile : fileList) {
                if (Objects.requireNonNull(mfile.getContentType()).substring(0, mfile.getContentType().indexOf("/")).equals("image")) {
                    String fileName = clubReportPath + UUID.randomUUID() + mfile.getOriginalFilename();
                    java.io.File upFile = new java.io.File(fileName);

                    mfile.transferTo(upFile);

                    File file = new File();
                    file.setFileName(fileName);
                    files.add(file);
                }
            }
            clubReport.setFiles(files);
        }

        siteService.addClubReport(clubReport);
        return "redirect:/site/listClubReport";
    }
    @RequestMapping(value = "getClubReport/{clubReportNo}/{clubNum}", method = RequestMethod.GET)
    public String getClubReport(@PathVariable int clubReportNo, @PathVariable int clubNum, Model model) throws Exception {
        System.out.println("/site/getClubReport : GET");
        Club club = clubService.getClub(clubNum);
        System.out.println(club);
        ClubReport clubReport = siteService.getClubReport(clubReportNo);
        model.addAttribute("clubReport", clubReport);
        model.addAttribute("club", club);
        return "forward:/view/site/getClubReport.jsp";
    }

    @RequestMapping(value="updateClubReport/{clubReportNo}/{clubNum}", method=RequestMethod.GET)
    public String updateClubReport(@PathVariable int clubReportNo, @PathVariable int clubNum, Model model) throws Exception {
        System.out.println("/site/updateClubReport : GET");
        Club club = clubService.getClub(clubNum);
        System.out.println(club);
       ClubReport clubReport = siteService.getClubReport(clubReportNo);

       //siteService.processClubReport(clubReport);

        model.addAttribute("clubReport", clubReport);
        model.addAttribute("club", club);
        return "forward:/view/site/updateClubReport.jsp";
    }

    @RequestMapping(value="updateClubReport", method=RequestMethod.POST)
    public String updateClubReport(@ModelAttribute("clubReport") ClubReport clubReport) throws Exception {
        System.out.println("/site/updateClubReport : POST");
        siteService.processClubReport(clubReport);

        return "redirect:/site/listClubReportProcess?clubNum="+clubReport.getClubNum();
    }

    @RequestMapping(value="updateClubRereport/{clubReportNo}", method=RequestMethod.GET)
    public String updateClubRereport(@PathVariable int clubReportNo , Model model) throws Exception {
        System.out.println("/site/updateClubRereport : GET");

        ClubReport clubReport = siteService.getClubReport(clubReportNo);

        //siteService.processClubRereport(clubReport);

        model.addAttribute("clubReport", clubReport);
        return "forward:/view/site/updateClubRereport.jsp";
    }

    @RequestMapping(value="updateClubRereport", method=RequestMethod.POST)
    public String updateClubRereport(@ModelAttribute("clubReport") ClubReport clubReport) throws Exception {
        System.out.println("/site/updateClubRereport : POST");

        siteService.processClubRereport(clubReport);

        return "redirect:/site/listClubReportProcess";
    }

    @RequestMapping(value="deleteClubReport/{clubReportNo}", method=RequestMethod.GET)
    public String deleteClubReport(@PathVariable int clubReportNo , Model model) throws Exception {
        System.out.println("/site/deleteClubReport : GET");

        ClubReport clubReport = siteService.getClubReport(clubReportNo);

        siteService.deleteClubReport(clubReportNo);

        model.addAttribute("clubReport", clubReportNo);
        return "redirect:/site/listClubReport";
    }

    @RequestMapping(value = "listClubReportProcess")
    public String listClubReportProcess(@ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("/site/listClubReportProcess : GET / POST");

        if(search.getCurrentPage() == 0 ){
            search.setCurrentPage(1);
        }
        search.setPageSize(pageSize);

        Map<String , Object> map = siteService.listClubReportProcess(search);

        Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
        System.out.println("resultPage : " + resultPage);
        System.out.println("list : " + map.get("list"));

        model.addAttribute("list", map.get("list"));
        model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);

        return "forward:/view/site/listClubReportProcess.jsp";
    }

    //Club Report End
}
