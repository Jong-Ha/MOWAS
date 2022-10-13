package com.project.site.controller;
import com.project.common.Page;
import com.project.common.Search;
import com.project.domain.File;
import com.project.domain.MasterBoard;
import com.project.domain.User;
import com.project.site.service.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/site/*")
public class SiteController {
    @Autowired
    @Qualifier("siteServiceImpl")
    private SiteService siteService;

    public SiteController() {
        System.out.println(this.getClass());
    }

    @Value("#{commonProperties['pageUnit']}")
    int pageUnit;

    @Value("#{commonProperties['pageSize']}")
    int pageSize;

    @Value("#{commonProperties['masterBoardPath']}")
    String masterBoardPath;


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
}
