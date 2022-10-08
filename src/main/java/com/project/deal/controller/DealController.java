package com.project.deal.controller;

import com.project.common.Page;
import com.project.common.Search;
import com.project.deal.service.DealService;
import com.project.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

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
    @RequestMapping(value = "/addDeal", method = RequestMethod.GET)
    public String addDeal() throws Exception{
        System.out.println("");
        System.out.println("daifjd;alsflk'dsd");
        return "forward:/view/deal/addDeal.jsp";
    }
   @RequestMapping(value = "/addDeal", method =RequestMethod.POST)
    public String addDeal(@ModelAttribute("deal")Deal deal, Model model, HttpSession session)throws Exception{
    System.out.println("/deal/addDeal : post");

        User user =new User();
      session.getAttribute("user");
      deal.setUser((User)session.getAttribute("user"));
      // deal.setUserId(((User)session.getAttribute("user")).getUserId());
    dealService.addDeal(deal);
    System.out.println(deal);
    model.addAttribute("deal",deal);
    return "forward:/view/deal/getListDeal.jsp";
   }
    @RequestMapping(value = "getDeal/{dealBoardNum}")
    public String getDeal(Model model, @PathVariable int dealBoardNum) throws Exception {
        Deal deal = dealService.getDeal(dealBoardNum);
        model.addAttribute("deal", deal);
        return "/view/deal/getDeal.jsp";
    }

    @RequestMapping(value = "getListDeal")
    public String getListDeal(@ModelAttribute("search") Search search, Model model,HttpServletRequest request) throws Exception {
        System.out.println("getListDeal : GET POST");
        if(search.getCurrentPage()==0) {
            search.setCurrentPage(1);
        }
        Map<String , Object> map=dealService.getListDeal(search);

        Page resultPage=new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
        System.out.println(resultPage);

    model.addAttribute("list", (List<Deal>)map.get("list"));
        System.out.println(map.get("list"));
       model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);
        System.out.println("여기까지 ? ? !!1111");
        System.out.println(map);
        return "forward:/view/deal/getListDeal.jsp";
    }

    @RequestMapping(value="updateDeal/{dealBoardNum}", method=RequestMethod.GET)
    public String updateDealView(@PathVariable("dealBoardNum") int dealBoardNum, Model model ) throws Exception {
        Deal deal = dealService.getDeal(dealBoardNum);
        dealService.updateDeal(deal);

        model.addAttribute("deal", deal);
        return "forward:/view/deal/updateDeal.jsp";

    }
    @RequestMapping(value="updateDeal", method=RequestMethod.POST)
    public String updateDeal(@ModelAttribute("deal") Deal deal ,Model model) throws Exception {

        dealService.updateDeal(deal);
        model.addAttribute("dealBoardNum",deal.getDealBoardNum());
        return "forward:/view/deal/getDeal.jsp";
    }
}



//   @RequestMapping(value = "/getListDeal")
   //public String getListDeal(@ModelAttribute("boardCategory")Search search,Model model,HttpServletRequest request) throws Exception{
//       System.out.println("/deal/Listdeal : GET / POST");
//        Page page=new Page();
//        if(page.getCurrentPage() ==0 ){
//           page.setCurrentPage(1);
//       }
//       page.setPageSize(pageSize);
//
//       // Business logic 수행
//       Map<String , Object> map=dealService.getListDeal(search);
//
//       Page resultPage = new Page( page.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//       System.out.println(resultPage);
//
//       // Model 과 View 연결
//       model.addAttribute("list", map.get("list"));
//       model.addAttribute("resultPage", resultPage);
//       model.addAttribute("search", search);
//
//       return "forward:/view/deal/getListDeal.jsp";
//
//
//   }

//    @RequestMapping(value = "addDeal",method = RequestMethod.GET)
//    public String addDeal() {
//        System.out.println("/deal/addDeal: GET");
//        return "redirect:/deal/addDeal.jsp";
//    }
//    @RequestMapping(value = "addDeal",method =RequestMethod.POST)
//    public String addDeal(@ModelAttribute("deal")Deal deal, Model model)throws Exception{
//        System.out.println("/deal/addDeal : POST");
//        dealService.addDeal(deal);
//        System.out.println(deal);
//        model.addAttribute("deal",deal);
//        return "forward:/deal/addDeal.jsp";
//    }
//    @RequestMapping(value = "getDeal")
//    public String getDeal(){
//        return "/view/deal/getDeal.jsp";
//    }
//
//    @RequestMapping(value = "getListDeal")
//    public String getListDeal() {
//
//        return "/view/deal/getListDeal.jsp";
//    }
//    @RequestMapping(value = "addDeal")
//    public String addDeal(@ModelAttribute("deal") Deal deal) throws Exception{
//        System.out.println("거래게시글 진입 : " + deal);
//
//        return "forward:/deal/getListDeal.jsp";
//    }
//    @RequestMapping(value = "getListDeal")
//    public String getListDeal(@ModelAttribute("search") Search search) throws Exception{
//        System.out.println("거래게시글 진입");
//    Map<String, Object> map=dealService.getListDeal(search);
//
//        return "forward:/deal/getListDeal.jsp";
//    }
//
//    @RequestMapping("getListDeal")
//    public String getListDeal(@RequestParam("search")Search search
//            , Model model, HttpServletRequest request) throws Exception{
//
//        Map<String, Object> map = dealService.getListDeal(search);
//
//        model.addAttribute("list", map.get("list"));
//
//
//        if (search.g == 1){
//            return "/view/community/list/clubCalenderReviewList.jsp";
//        } else if (boardCategory == 2) {
//            return "/view/community/list/clubCalenderReviewShortList.jsp";
//        }
//
//        return null;
//
//    }
//    @RequestMapping("listCalenderReview")
//    public String listCalenderReview(@RequestParam("boardCategory")int boardCategory
//            ,Model model,HttpServletRequest request){
//
//        Map<String, Object> map = calenderService.listCalenderReview(boardCategory);
//
//        model.addAttribute("list", map.get("list"));
//
//
//        if (boardCategory == 1){
//            return "/view/community/list/clubCalenderReviewList.jsp";
//        } else if (boardCategory == 2) {
//            return "/view/community/list/clubCalenderReviewShortList.jsp";
//        }
//
//        return null;
//
//    }

