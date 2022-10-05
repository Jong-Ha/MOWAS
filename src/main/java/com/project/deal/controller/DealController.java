package com.project.deal.controller;

import com.project.deal.service.DealService;
import com.project.domain.Deal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "addDeal",method = RequestMethod.GET)
    public String addDeal() {
        System.out.println("/deal/addDeal: GET");
        return "redirect:/deal/addDeal.jsp";
    }
    @RequestMapping(value = "addDeal",method =RequestMethod.POST)
    public String addDeal(@ModelAttribute("deal")Deal deal, Model model){
        System.out.println("/deal/addDeal : POST");
        dealService.addDeal(deal);
        System.out.println(deal);
        model.addAttribute("deal",deal);
        return "forward:/deal/addDeal.jsp";
    }
}
