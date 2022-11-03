package com.project.myPage.controller;

import com.project.common.Page;
import com.project.common.Search;
import com.project.domain.Club;
import com.project.myPage.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/myPage/json/*")
public class MyPageRestController {

    @Autowired
    @Qualifier("myPageServiceImpl")
    private MyPageService myPageService;

    @Value("#{commonProperties['pageUnit']}")
    int pageUnit;
    @Value("#{commonProperties['pageSize']}")
    int pageSize;
    @Value("#{commonProperties['resourcesPath']}")
    String resourcesPath;
    @Value("#{commonProperties['userImagePath']}")
    String userImagePath;

    public MyPageRestController(){
        System.out.println(this.getClass());
    }



    @RequestMapping(value = "getMyClub", method = RequestMethod.POST)
    public Map<String, Object> getMyClub(@RequestBody Map<String ,Object> data)throws Exception{

        Search search = new Search();

        if(data.get("currentPage")!=null){
            int currentPage = Integer.parseInt((String)data.get("currentPage"));
            search.setCurrentPage(currentPage);
            if (currentPage == 0) {
                search.setCurrentPage(1);
            }
        }

        search.setPageSize(pageSize);
        String userId = (String)data.get("userId");

        Map<String, Object> map = myPageService.getMyClub("join",userId,search);

        for(Map<String ,Object> item : (List<Map<String ,Object>>)map.get("list")) {
            Club club = (Club) item.get("club");
            club.parseInterList();
            String gc = "모집완료";
            if(club.getGatherCheck().equals("1")){
                gc = "모집중";
            }
            club.setGatherCheck(gc);
        }

        System.out.println("getMyClub 컨트롤러 map의 값은?"+map);
        Page resultPage = new Page(search.getCurrentPage(), (Integer) map.get("totalCount"), pageUnit, pageSize);
        map.put("resultPage", resultPage);
        return map;
    }

}
