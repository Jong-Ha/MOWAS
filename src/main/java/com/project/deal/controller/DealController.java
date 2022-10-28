package com.project.deal.controller;

import com.project.common.Page;
import com.project.common.Search;
import com.project.community.service.CommunityService;
import com.project.deal.service.DealService;
import com.project.domain.*;
import com.project.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.File;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;

@Controller
@RequestMapping("/deal/*")
public class DealController {
@Autowired
    @Qualifier("dealServiceImpl")
    private DealService dealService;
    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;
    @Autowired
    @Qualifier("communityServiceImpl")
    private CommunityService commuService;

public DealController(){
    System.out.println(this.getClass());
}
@Value("#{commonProperties['pageUnit']}")
    int pageUnit;

    @Value("#{commonProperties['pageSize']}")
    int pageSize;
    @Value("#{commonProperties['resourcesPath']}")
    String resourcesPath;

    @Value("#{commonProperties['dealImagePath']}")
    String clubImagePath;

    @Value("#{commonProperties['dealBoardPath']}")
    String dealBoardPath;

    @RequestMapping(value = "login")
    public String login(HttpSession session, @RequestParam("userId") String userId,@RequestParam(value = "dealBoardNum", required = false) int dealBoardNum) throws Exception{
        User user = userService.getUser(userId);
        session.setAttribute("user",user);
        return "/deal/getDeal/"+dealBoardNum;
    }

    @RequestMapping(value = "/addDeal", method = RequestMethod.GET)
    public String addDeal() throws Exception{
        System.out.println("");
        System.out.println("daifjd;alsflk'dsd");
        return "forward:/view/deal/addDeal.jsp";
    }
    @RequestMapping(value = "/addDeal", method =RequestMethod.POST)
    public String addDeal(@ModelAttribute("deal")Deal deal, MultipartHttpServletRequest multi,HttpSession session)throws Exception{
        System.out.println("/deal/addDeal : post");
        deal.setUser((User) session.getAttribute("user"));

        System.out.println("sefdaj'ejw'gkfdsgda dfda"+session.getAttribute("user"));
        String a=deal.getUser().getVillCode();
        System.out.println(a);
        deal.setVillCode(a);

        ////파일 업로드
        //파일 추출
        List<MultipartFile> mfs = multi.getFiles("file");
        System.out.println(mfs);
        //저장할 파일이 있는지 validation check
        if(mfs.size()>0 && !mfs.get(0).getOriginalFilename().equals("")){
            //저장할 리스트 생성
            List<com.project.domain.File> files = new ArrayList<>();
            //추출된 파일 업로드
            for (MultipartFile mf : mfs) {
                //파일이 이미지인지 validation check
                if (Objects.requireNonNull(mf.getContentType()).substring(0, mf.getContentType().indexOf("/")).equals("image")) {
                    //파일 경로 및 이름 유니크하게 생성
                    String fileName = dealBoardPath + UUID.randomUUID() + mf.getOriginalFilename();
                    java.io.File uploadFile = new java.io.File(fileName);
                    //파일 업로드
                    mf.transferTo(uploadFile);
                    //리스트에 파일 저장
                    com.project.domain.File file = new com.project.domain.File();
                    file.setFileName(fileName);
                    files.add(file);
                }
            }
            //domain 객체에 리스트 저장
            deal.setFiles(files);
        }

        //모임 공지사항 등록
       dealService.addDeal(deal);




//
//        System.out.println("판매 구매 입니다" + deal);
//        List<MultipartFile> mfs = multi.getFiles("file");
//        System.out.println(mfs);
//        //저장할 파일이 있는지 validation check
//        if(mfs.size()>0 && !mfs.get(0).getOriginalFilename().equals("")) {
//            //저장할 리스트 생성
//            List<com.project.domain.File> files = new ArrayList<>();
//            //추출된 파일 업로드
//            for (MultipartFile mf : mfs) {
//                //파일이 이미지인지 validation check
//                if (Objects.requireNonNull(mf.getContentType()).substring(0, mf.getContentType().indexOf("/")).equals("image")) {
//                    //파일 경로 및 이름 유니크하게 생성
//                    String fileName = dealBoardPath + UUID.randomUUID() + mf.getOriginalFilename();
//                    java.io.File uploadFile = new java.io.File(fileName);
//                    //파일 업로드
//                    mf.transferTo(uploadFile);
//                    //리스트에 파일 저장
//                    //리스트에 파일 저장
//                    com.project.domain.File file = new com.project.domain.File();
//                    file.setFileName(fileName);
//                    files.add(file);
//                }
//            }
//            //domain 객체에 리스트 저장
//            deal.setFiles(files);
//        }
//            User user =new User();
//            session.getAttribute("user");
//            deal.setUser((User)session.getAttribute("user"));
//            //  deal.setUserId(((User)session.getAttribute("user")).getUserId());
//            dealService.addDeal(deal);
//            System.out.println(deal);
//            model.addAttribute("deal",deal);
//






//       System.out.println("파일 업로드 진입 : " + file);
//
//       List<Map<String, String>> fileList = new ArrayList<>();
//       for (int i = 0; i < file.size(); i++) {
//           String fileName = file.get(i).getOriginalFilename();
//           System.out.println("파일 이름 : " + fileName);
//           Map<String, String> map = new HashMap<>();
//           map.put("fileName", fileName);
//           fileList.add(map);
//
//           try {
//               file.get(i).transferTo(new File("/uploadFiles/" + fileList.get(i).get("fileName")));
//               System.out.println("업로드 성공");
//           } catch (Exception e) {
//               e.printStackTrace();
//           }
//       }
            return "forward:/deal/getListDeal";
        }
    @RequestMapping(value = "getDeal/{dealBoardNum}")
    public String getDeal(Model model, @PathVariable int dealBoardNum, HttpSession session, HttpServletResponse response, @CookieValue(value = "history",required = false)String history,HttpServletRequest request) throws Exception {
       //쿠키 추가
//      쿠키관리
        if(history!=null) {
            history = URLDecoder.decode(history,"EUC_KR");
        }else {
            history = "";
        }

        String[] histories = history.split(",");
        history = "";
        if(histories.length>0) {
            for(String str : histories) {
                if(str!=null && str.length()>4 && Integer.parseInt(str) != dealBoardNum ) {
                    history+= (history.length()==0?"":",")+str;
                }
            }
        }

        history+= (history.length()==0?"":",")+dealBoardNum;

        Cookie cookie = new Cookie("history", URLEncoder.encode(history,"EUC_KR"));
        cookie.setMaxAge(30*60);
        cookie.setPath("/");
        response.addCookie(cookie);

        System.out.println("내가 만든 쿠키 ~"+ cookie.getValue());

       //getdeal 기본
        Deal deal = dealService.getDeal(dealBoardNum);

//Object User=session.getAttribute("userId");
        //String boardCategory = String.valueOf(deal.getBoardCategory());
        System.out.println(deal.getBoardCategory());
//String likeCheck =commuService.getLikeCheck((String)session.getAttribute("userId"),dealBoardNum, (Integer.parseInt(deal.getBoardCategory())));
       String likeCheck =commuService.getLikeCheck(deal.getUser().getUserId(),dealBoardNum, (Integer.parseInt(deal.getBoardCategory())));

        int reviewPt=dealService.getReviewPt(deal);

        System.out.println("리뷰포인트를 얻기위한 노력"+deal);
        System.out.println("likecheck"+likeCheck);
        if(reviewPt==0) {
            reviewPt=0;
            model.addAttribute("reviewPt", reviewPt);
        }else{

            model.addAttribute("reviewPt",reviewPt);
        }
        model.addAttribute("deal", deal);
        model.addAttribute("likeCheck",likeCheck);
        //쿠키넣기
        Cookie[] cookies = request.getCookies();

        for(Cookie c : cookies) {
            if(c.getName().equals("history")) {
                history = URLDecoder.decode(c.getValue(),"EUC_KR");
            }
        }

        if(!history.equals("")) {
            List<String> listcook = new ArrayList<String>();

            String[] records = history.trim().split(",");
            for(String str : records) {
                listcook.add(0,str);
            }
            System.out.println(listcook);
            model.addAttribute("listcook", listcook);
        }
        return "/view/deal/getDeal.jsp";
    }
    @RequestMapping(value = "history")
    public String history(HttpServletRequest request, Model model) throws Exception {

        Cookie[] cookies = request.getCookies();
String history="";
        for(Cookie c : cookies) {
            if(c.getName().equals("history")) {
                history = URLDecoder.decode(c.getValue(),"EUC_KR");
            }
        }

        if(!history.equals("")) {
            List<String> listcook = new ArrayList<String>();

            String[] records = history.trim().split(",");
            for(String str : records) {
                listcook.add(0,str);
            }
            System.out.println(listcook);
            model.addAttribute("listcook", listcook);
        }


        return "forward:/view/deal/history.jsp";
    }




    @RequestMapping(value = "getListDeal")
    public String getListDeal(@ModelAttribute("search") Search search, Model model,HttpServletRequest request
                            ,@RequestParam(value = "boardCategory", defaultValue = "99") String boardCategory, @RequestParam(value = "searchTag", required = false) List<String> searchTag) throws Exception {
        System.out.println("getListDeal : GET POST");
        System.out.println(boardCategory);
        Cookie[] cookies = request.getCookies();
        String history="";
        for(Cookie c : cookies) {
            if(c.getName().equals("history")) {
                history = URLDecoder.decode(c.getValue(),"EUC_KR");
            }
        }

        if(!history.equals("")) {
            List<String> listcook = new ArrayList<String>();

            String[] records = history.trim().split(",");
            for(String str : records) {
                listcook.add(0,str);
            }
            System.out.println(listcook);
            model.addAttribute("listcook", listcook);
        }
        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        if (search.getPageSize() == 0) {
            search.setPageSize(pageSize);
        }
        if (search.getSearchKeyword() == null) {
            search.setSearchKeyword("");
        }
        System.out.println(search);

        if(boardCategory == "08"){

            Map<String , Object> map=dealService.getListDeal(search, boardCategory,searchTag);


            Page resultPage=new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
            System.out.println(resultPage);

            System.out.println(map.get("list"));
            model.addAttribute("list", (List<Deal>)map.get("list"));
            model.addAttribute("resultPage", resultPage);
            model.addAttribute("search", search);
            model.addAttribute("boardCategory",boardCategory);
            model.addAttribute("searchTag",searchTag);

        } else if (boardCategory == "09") {

            Map<String , Object> map=dealService.getListDeal(search, boardCategory,searchTag);
            Page resultPage=new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
            System.out.println(resultPage);
            model.addAttribute("list", (List<Deal>)map.get("list"));
            model.addAttribute("resultPage", resultPage);
            model.addAttribute("search", search);
            model.addAttribute("boardCategory",boardCategory);
            model.addAttribute("searchTag",searchTag);

        }else{


        Map<String, Object> map = dealService.getListDeal(search, boardCategory, searchTag);


            Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
            System.out.println(resultPage);


            System.out.println(map.get("list"));
            model.addAttribute("list", (List<Deal>)map.get("list"));
            model.addAttribute("resultPage", resultPage);
            model.addAttribute("search", search);
            model.addAttribute("boardCategory",boardCategory);
            model.addAttribute("searchTag",searchTag);

            System.out.println("여기까지 ? ? !!1111");
            System.out.println(map);
        }
        return "forward:/view/deal/getListDeal.jsp";
    }
//    @RequestMapping(value = "getListDeal")
//    public String getListDeal(@ModelAttribute("search") Search search, Model model,HttpServletRequest request,
//                              @RequestParam("boardCategory") int boardCategory, @ModelAttribute("deal") Deal deal) throws Exception {
//        System.out.println("getListDeal : GET POST");
//        if(search.getCurrentPage()==0) {
//            search.setCurrentPage(1);
//        }
//
//
//        System.out.println(search);
//        Map<String , Object> map=dealService.getListDeal(search);
//
//        Page resultPage=new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
//        System.out.println(resultPage);
//
//        model.addAttribute("list", (List<Deal>)map.get("list"));
//        System.out.println(map.get("list"));
//        model.addAttribute("resultPage", resultPage);
//        model.addAttribute("search", search);
//        System.out.println("여기까지 ? ? !!1111");
//        System.out.println(map);
////if(deal.getBoardCategory()==8) {
////    return "/view/deal/getListDeal.jsp";
////} if(deal.getBoardCategory()==9){
////    return "/view/deal/getListDeal.jsp";
////}
//        return null;
//    }






    @RequestMapping(value="updateDeal/{dealBoardNum}", method=RequestMethod.GET)
    public String updateDealView(@PathVariable("dealBoardNum") int dealBoardNum, Model model ) throws Exception {

        Deal deal = dealService.getDeal(dealBoardNum);
        int fileSize = deal.getFiles().size();
       // model.addAttribute("deal", deal);
        model.addAttribute("fileSize", fileSize);
    //    dealService.updateDeal(deal);
        System.out.println("+updatedealvire ="+deal);
        model.addAttribute("deal", deal);
        return "forward:/view/deal/updateDeal.jsp";

    }
    @RequestMapping(value="updateDeal",method = RequestMethod.POST)
    public String updateDeal(@ModelAttribute("deal") Deal deal,MultipartHttpServletRequest multi, @RequestParam(value = "deleteFileName", required = false) List<String> deleteFileNames) throws Exception {
        ////파일 업로드
            //파일 추출
            List<MultipartFile> mfs = multi.getFiles("file");
            System.out.println("여긴어딘가요 ? 파일 들어가나요 ?"+mfs);
            //저장할 리스트 생성
           // List<com.project.domain.File> files = new ArrayList<>();
        List<com.project.domain.File> files = new ArrayList<>();
            //저장할 파일이 있는지 validation check
            if(mfs.size()>0 && !mfs.get(0).getOriginalFilename().equals("")){
                //추출된 파일 업로드
                for (MultipartFile mf : mfs) {
                    //파일이 이미지인지 validation check
                    if (Objects.requireNonNull(mf.getContentType()).substring(0, mf.getContentType().indexOf("/")).equals("image")) {
                        //파일 경로 및 이름 유니크하게 생성
                        String fileName = dealBoardPath + UUID.randomUUID() + mf.getOriginalFilename();
                        java.io.File uploadFile = new java.io.File(fileName);
                        //파일 업로드
                        mf.transferTo(uploadFile);
                        //리스트에 파일 저장
                        com.project.domain.File file = new com.project.domain.File();
                        file.setFileName(fileName);
                        files.add(file);
                    }
                }
            }
            //domain 객체에 리스트 저장
            deal.setFiles(files);

            //모임 공지사항 수정
            //서비스에서 일부러 에러 발생해서 롤백 - 검증용
            try {
                dealService.updateDeal(deal, deleteFileNames);
            }catch (Exception e){
                System.out.println(e.getStackTrace());
            }

            //기존파일 삭제
       System.out.println("deleteFileNames : "+deleteFileNames);
            if (deleteFileNames != null) {
                for(String deleteFileName : deleteFileNames){
                    java.io.File deleteFile = new java.io.File(resourcesPath+deleteFileName);
                    if(deleteFile.exists()){
                        if(deleteFile.delete()){
                            System.out.println("file deleted");
                        }else {
                            System.out.println("cannot delete");
                        }
                    }
                }
            }


      //  model.addAttribute("deal",dealService.getDeal(deal.getDealBoardNum()));
        System.out.println( dealService.getDeal(deal.getDealBoardNum()));
        System.out.println(deal.getDealBoardNum());
        return "redirect:/deal/getDeal/"+deal.getDealBoardNum();
        //        ////파일 업로드
//        //파일 추출
//        List<MultipartFile> mfs = multi.getFiles("file");
//        System.out.println(mfs);
//        //저장할 리스트 생성
//        List<com.project.domain.File> files = new ArrayList<>();
//        //저장할 파일이 있는지 validation check
//        if(mfs.size()>0 && !mfs.get(0).getOriginalFilename().equals("")){
//            //추출된 파일 업로드
//            for (MultipartFile mf : mfs) {
//                //파일이 이미지인지 validation check
//                if (Objects.requireNonNull(mf.getContentType()).substring(0, mf.getContentType().indexOf("/")).equals("image")) {
//                    //파일 경로 및 이름 유니크하게 생성
//                    String fileName = dealBoardPath + UUID.randomUUID() + mf.getOriginalFilename();
//                    java.io.File uploadFile = new java.io.File(fileName);
//                    //파일 업로드
//                    mf.transferTo(uploadFile);
//                    //리스트에 파일 저장
//                    com.project.domain.File file = new com.project.domain.File();
//                    file.setFileName(fileName);
//                    files.add(file);
//                }
//            }
//        }
//        //domain 객체에 리스트 저장
//        deal.setFiles(files);
//
//        //모임 공지사항 수정
//        //서비스에서 일부러 에러 발생해서 롤백 - 검증용
////        try {
////            dealService.updateDeal(deal, deleteFileNames);
////        }catch (Exception e){
////            System.out.println(e.getStackTrace());
////        }
//
//        //기존파일 삭제
////        System.out.println("deleteFileNames : "+deleteFileNames);
//        if (deleteFileNames != null) {
//            for(String deleteFileName : deleteFileNames){
//                java.io.File deleteFile = new java.io.File(resourcesPath+deleteFileName);
//                if(deleteFile.exists()){
//                    if(deleteFile.delete()){
//                        System.out.println("file deleted");
//                    }else {
//                        System.out.println("cannot delete");
//                    }
//                }
//            }
//        }
//
//        dealService.updateDeal(deal);
//        model.addAttribute("dealBoardNum",deal.getDealBoardNum());
//        return "forward:/view/deal/getDeal.jsp";
    }
    @RequestMapping(value = "deleteDeal/{dealBoardNum}")
    public String deleteDeal(@PathVariable int dealBoardNum) throws Exception {
    //    Deal deal = new Deal();
      //  deal.setDealBoardNum(dealBoardNum);
       // deal.
        List<String> deleteFileNames = dealService.deleteDeal(dealBoardNum);
        ////기존파일 삭제
        //확인
       System.out.println("deleteFileNames : "+deleteFileNames);
        //validation check
        if (deleteFileNames != null) {
            //각 항목 삭제
            for (String deleteFileName : deleteFileNames) {
                //파일 설정
                java.io.File deleteFile = new java.io.File(resourcesPath + deleteFileName);
                //파일이 있으면 삭제
                if (deleteFile.exists()) {
                    if (deleteFile.delete()) {
                        System.out.println("file deleted");
                    } else {
                        System.out.println("cannot delete");
                    }
                }
            }

        }
        return "redirect:/deal/getListDeal";
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

