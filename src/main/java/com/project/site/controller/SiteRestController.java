package com.project.site.controller;

import com.project.domain.CommunityReport;
import com.project.domain.File;
import com.project.domain.MasterBoard;
import com.project.domain.User;
import com.project.site.service.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpSession;

import java.util.*;

import static com.project.common.KakaoMapApi.*;

@RestController
@RequestMapping("/site/json/*")
public class SiteRestController {

    @Autowired
    @Qualifier("siteServiceImpl")
    private SiteService siteService;

    public SiteRestController() {
        System.out.println(this.getClass());
    }

    @Value("#{commonProperties['commuReportPath']}")
    String commuReportPath;

    //좌표를 RequestParam으로 받아서 RestController에서 Call한 예제
    @RequestMapping( value="clubMap" , method= RequestMethod.POST, produces = "application/text; charset=UTF-8")
    public String clubMap(@RequestParam String longitude, @RequestParam String latitude)  throws Exception {

        String vilCode = "";
        //리턴값 : 행정동
        //vilCode = coordToRegioncode(longitude, latitude);
        //리턴값 : 법정동
        vilCode = coordToAddress(longitude, latitude, 1);
        return vilCode;
    }

    @RequestMapping( value="calendarMap" , method= RequestMethod.POST, produces = "application/text; charset=UTF-8")
    public String calendarMap(@RequestParam String longitude, @RequestParam String latitude)  throws Exception {

        String vilCode = "";
        vilCode = coordToAddress(longitude, latitude, 2);
        return vilCode;
    }

    @RequestMapping( value="calendarLocation" , method=RequestMethod.POST)
    public Map<String, String> calendarLocation(@RequestParam String address)  throws Exception {

        Map<String, String> mapInfo = getJsonAddress(address);
        return mapInfo;
    }

    @RequestMapping( value="addCommunityReport" , method= RequestMethod.POST, produces = "application/text; charset=UTF-8")
    public String addCommunityReport(@RequestBody CommunityReport communityReport,
                                     MultipartHttpServletRequest uploadFile)  throws Exception {
        System.out.println("커뮤니티 신고 등록");
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

        String result = "신고되었습니다.";
        return result;
    }

    @RequestMapping( value="getMasterBoard/{masterBoardNo}", method=RequestMethod.GET )
    public MasterBoard getMasterBoard(@PathVariable int masterBoardNo ) throws Exception {

        System.out.println("/site/json/getMasterBoard : GET");
        MasterBoard masterBoard = siteService.getMasterBoard(masterBoardNo);
        return masterBoard;
    }
}
