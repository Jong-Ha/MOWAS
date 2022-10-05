package com.project.site.controller;
import com.project.common.Search;
import com.project.domain.MasterBoard;
import com.project.site.service.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/site/*")
public class SiteController {
    @Autowired
    @Qualifier("siteServiceImpl")
    private SiteService siteService;

    public SiteController() {
        System.out.println(this.getClass());
    }
    @RequestMapping(value = "addMasterBoard", method = RequestMethod.POST)
    public String addMasterBoard(@ModelAttribute("MasterBoard")MasterBoard masterBoard,
                                 @RequestParam("file") List<MultipartFile> file) throws Exception {
        siteService.addMasterBoard(masterBoard);
        return null;
    }

    @RequestMapping(value = "getMasterBoard")
    public String getMasterBoard(@RequestParam("masterBoardNo") int masterBoardNo) throws Exception {
        MasterBoard masterBoard = siteService.getMasterBoard(masterBoardNo);
        return null;
    }

    @RequestMapping(value = "listMasterBoard")
    public String listMasterBoard(@ModelAttribute("search") Search search, Model model) throws Exception {
        Map<String , Object> map=siteService.listMasterBoard(search);

        //model.addAttribute("list", map.get("mbList"));
        //model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);
        return null;
    }

    @RequestMapping(value="updateMasterBoard", method=RequestMethod.GET)
    public String updateMasterBoard(@RequestParam("masterBoardNo") int masterBoardNo , Model model ) throws Exception {
        MasterBoard masterBoard = siteService.getMasterBoard(masterBoardNo);
        siteService.updateMasterBoard(masterBoard);

        model.addAttribute("masterBoard", masterBoard);
        return null;
    }
}
