package com.project.deal.controller;

import com.project.deal.service.DealService;
import com.project.domain.Deal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/deal/*")
public class DealController {
@Autowired
    @Qualifier("dealServiceImpl")
    private DealService dealService;
public DealController(){
    System.out.println(this.getClass());
}
@Value("#{commonProperties['pageUnit']}")
    int pageUnit;

    @Value("#{commonProperties['pageSize']}")
    int pageSize;

}
