package com.project.user.controller;

import com.project.user.service.UserCalenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/userCal/*")
public class UserCalenderController {

    @Autowired
    @Qualifier("userCalenderServiceImpl")
    private UserCalenderService calenderService;

}
