package com.project.myPage.controller;

import com.project.myPage.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/myPage/json/*")
public class MyPageRestController {

    @Autowired
    @Qualifier("myPageServiceImpl")
    private MyPageService myPageService;


}
