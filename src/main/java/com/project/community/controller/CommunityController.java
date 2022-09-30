package com.project.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commu/*")
public class CommunityController {

    @RequestMapping("/")
    public String Calender(){

        return "/view/community/calender.jsp";
    }
}
