package com.project.deal.controller;

import com.project.deal.service.DealCalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dealCalender")
public class DealCalendarController {

    @Autowired
    @Qualifier("dealCalenderServiceImpl")
    private DealCalendarService calendeService;
}
