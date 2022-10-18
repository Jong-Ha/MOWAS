package com.project.myPage.controller;

import com.project.domain.User;
import com.project.domain.UserInterList;
import com.project.myPage.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/myPage/*")
public class MyPageController {

    @Autowired
    @Qualifier("myPageServiceImpl")
    private MyPageService myPageService;

    public MyPageController(){
        System.out.println(this.getClass());
    }

    @Value("#{commonProperties['pageUnit']}")
    int pageUnit;
    @Value("#{commonProperties['pageSize']}")
    int pageSize;

    @RequestMapping(value = "getMyPage",method = RequestMethod.GET)
    public String getMyPage(@RequestParam(value = "userId")String userId, Model model)throws Exception{

        System.out.println("getMyPage컨트롤러 userId의 값?"+userId);
        User user = myPageService.getMyPage(userId);
        model.addAttribute("user", user);

        return "forward:/view/myPage/getMyPage.jsp";
    }

    @RequestMapping(value = "getMyInfor",method = RequestMethod.GET)
    public String getMyInfor(@RequestParam(value = "userId")String userId, Model model)throws Exception{
        System.out.println("getMyInfor컨트롤러 userId의 값?"+userId);

        Map<String, Object> map = myPageService.getMyInfor(userId);
        System.out.println("getMyInfor 컨트롤러 map의 값은?"+map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyInfor.jsp";
    }

    @RequestMapping(value = "updateClick",method = RequestMethod.GET)
    public String updateClick(@RequestParam(value = "userId")String userId, Model model)throws Exception{
        System.out.println("updateClick컨트롤러 userId의 값?"+userId);

        Map<String, Object> map = myPageService.getMyInfor(userId);
        System.out.println("updateClick 컨트롤러 map의 값은?"+map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/updateMyInfor.jsp";
    }

    @RequestMapping(value = "updateMyInfor",method = RequestMethod.GET)
    public String updateMyInfor(@RequestParam(value = "userId")String userId)throws Exception{
        System.out.println("updateMyInfor컨트롤러 userId의 값?"+userId);


        return "forward:/view/myPage/getMyInfor.jsp";
    }

    @RequestMapping(value = "getMyBoard", method = RequestMethod.GET)
    public String getMyBoard(@RequestParam(value ="userId")String userId,Model model)throws Exception{
        System.out.println("getMyBoard컨트롤러 userId의 값?"+userId);

        Map<String, Object> map = myPageService.getMyBoard(userId);
        System.out.println("getMyBoard 컨트롤러 map의 값은?"+map);
        model.addAttribute("map", map);
        return "forward:/view/myPage/getMyBoard.jsp";
    }

}
