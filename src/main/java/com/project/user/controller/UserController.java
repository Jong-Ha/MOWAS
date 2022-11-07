package com.project.user.controller;

import com.project.common.Page;
import com.project.common.Search;
import com.project.domain.User;
import com.project.domain.UserInterList;
import com.project.user.service.UserService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;


@Controller
@RequestMapping("/user/*")
public class UserController {

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;


    public UserController(){
        System.out.println(this.getClass());
    }

    @Value("#{commonProperties['pageUnit']}")
    int pageUnit;
    @Value("#{commonProperties['pageSize']}")
    int pageSize;
    @Value("#{commonProperties['resourcesPath']}")
    String resourcesPath;
    @Value("#{commonProperties['userImagePath']}")
    String userImagePath;

    @RequestMapping(value = "addUser",method = RequestMethod.GET)
    public String addUser() throws Exception{
        System.out.println("/user/addUser : GET 실행");
        return "forward:/view/user/addUser.jsp";
    }

    @RequestMapping(value = "addUser",method = RequestMethod.POST)
    public String addUser(@ModelAttribute User user,
                          @RequestParam(value = "file") MultipartFile file,HttpSession session,
                          Model model) throws Exception{
        System.out.println("/user/addUser : POST 실행");
        System.out.println("user 값은 ? :"+user);


        if(Objects.requireNonNull(file.getContentType()).substring(0, file.getContentType().indexOf("/")).equals("image")) {

            System.out.println("file.getContentType() : "+file.getContentType());
            String fileRealName = file.getOriginalFilename();
            long size = file.getSize();

            System.out.println("파일명 : " + fileRealName);
            System.out.println("용량크기(byte) : " + size);

            String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
            String uploadFolder = "C:\\Project\\MOWAS\\src\\main\\webapp\\resources\\uploadFiles\\userImages";

            UUID uuid = UUID.randomUUID();
            System.out.println(uuid.toString());
            String[] uuids = uuid.toString().split("-");

            String uniqueName = uuids[0];
            System.out.println("생성된 고유 문자열 " + uniqueName);
            System.out.println("확장자명 " + fileExtension);

            String uploadLocation = uploadFolder + "\\" + uniqueName + fileExtension;
            System.out.println("uploadLocation의 값 :" + uploadLocation);

            File saveFile = new File(uploadLocation);
            try {
                file.transferTo(saveFile);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

            String userImage = userImagePath+uniqueName+fileExtension;
            user.setUserImage(userImage);
            userService.addUser(user);

            session.setAttribute("user", user);
            model.addAttribute("user", user);

        }else{
            String userImage = userImagePath+"pngwing.png";
            user.setUserImage(userImage);
            userService.addUser(user);

            session.setAttribute("user", user);
            model.addAttribute("user", user);
        }

        System.out.println("/user/addUser : POST 종료");
        return "forward:/view/user/addInterList.jsp";
    }

    @RequestMapping(value = "updateSNSUserInfor",method = RequestMethod.POST)
    public String updateSNSUserInfor(@ModelAttribute User user,
                          HttpSession session) throws Exception{
        System.out.println("/user/updateSNSUserInfor : POST 실행");
        System.out.println("user 값은 ? :"+user);

            userService.updateSNSUserInfor(user);

            session.setAttribute("user", user);


        System.out.println("/user/updateSNSUserInfor : POST 종료");
        return "forward:/view/user/main.jsp";
    }

    @RequestMapping(value = "getUser", method = RequestMethod.GET)
    public String getUser(@RequestParam("userId")String userId, Model model)throws Exception{
        System.out.println("/user/getUser : GET 실행");
        User user = userService.getUser(userId);
        model.addAttribute("user", user);
        return "forward:/view/user/getUserDetail.jsp";
    }

    @RequestMapping(value = "getMyId", method = RequestMethod.POST)
    public String getMyId(@ModelAttribute User user,  Model model)throws Exception{
        System.out.println("/user/getMyId : GET 실행");
        System.out.println("getMyId의 user값 :"+user);

            User findUser = userService.getMyId(user);

        model.addAttribute("findUser", findUser);
        return "forward:/view/user/getMyIdEnd.jsp";
    }


    @RequestMapping(value = "getMyPassword", method = RequestMethod.POST)
    public String getMyPassword(@ModelAttribute User user, Model model)throws Exception{
        System.out.println("/user/getMyPassword : POST 실행");
        System.out.println("getMyPwd의 user값 :"+user);

        User findPwd = userService.getMyPassword(user);

        model.addAttribute("findUser", findPwd);
        return "forward:/view/user/getMyPasswordEnd.jsp";
    }
    @RequestMapping(value="loginNow", method=RequestMethod.GET)
    public String loginNow(HttpServletRequest request,
                           @CookieValue(value = "keepId",required = false)String userId,
                           @CookieValue(value = "keepLogin",required = false)String password,
                           HttpSession session, Model model) {
        String referer = request.getHeader("referer");
        System.out.println("referer  의 값?!?!?!"+referer);
        //referer.substring(referer.lastIndexOf("/view"),referer.length());
        int a = referer.lastIndexOf(":")+5;
        System.out.println("인트a의 값? : "+a);
        String loginNow= referer.substring(a, referer.length());
        System.out.println("loginNow의 값...."+loginNow);
        System.out.println("referer  의 값....."+referer);

        User user = new User();
        user.setUserId(userId);
        user.setPassword(password);
        try{
            User dbVO=userService.loginUser(user);
            session.setAttribute("user",dbVO);
        }catch (Exception e){
            System.out.println("로그인 실패");
        }
        return "forward:"+loginNow;
    }



        @RequestMapping(value = "login", method = RequestMethod.GET)
        public String login(@CookieValue(value = "keepId",required = false)String userId,
                            @CookieValue(value = "keepLogin",required = false)String password,
                            HttpSession session){
        User user = new User();
        user.setUserId(userId);
        user.setPassword(password);
        try{
            User dbVO=userService.loginUser(user);
            session.setAttribute("user",dbVO);
        }catch (Exception e){
            System.out.println("로그인 실패");
        }
        return "forward:/";
    }
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
        session.removeAttribute("user");
        session.removeAttribute("naverUser");
        session.removeAttribute("naverUser2");
        System.out.println("로그아웃된 세션 user의 값은? : "+session.getAttribute("user"));
        System.out.println("로그아웃된 세션 naverUser의 값은? : "+session.getAttribute("naverUser"));
        System.out.println("로그아웃된 세션 naverUser2의 값은? : "+session.getAttribute("naverUser2"));
///*
        Cookie cookie = new Cookie("keepLogin", null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        System.out.println("keepLogin 쿠키의 네임keepLogin 값"+cookie.getName().equals("keepLogin"));
        System.out.println("keepLogin 쿠키의 벨류 값"+cookie.getValue());
        response.addCookie(cookie);


        String referer = request.getHeader("referer");
        System.out.println("로그아웃 referer 의 값?"+referer);
        //referer.substring(referer.lastIndexOf("/view"),referer.length());
        int a = referer.lastIndexOf(":")+5;
        System.out.println("인트a의 값? : "+a);
        String logoutNow= referer.substring(a, referer.length());
        System.out.println("logoutNow의 값...."+logoutNow);



        ///*/
        /* 모든 쿠키 삭제
        Cookie[] cookies = request.getCookies(); // 모든 쿠키의 정보를 cookies에 저장

        if(cookies != null){ // 쿠키가 한개라도 있으면 실행

            for(int i=0; i< cookies.length; i++){

                cookies[i].setMaxAge(0); // 유효시간을 0으로 설정

                response.addCookie(cookies[i]); // 응답 헤더에 추가

            }

        }
        */
        if(!logoutNow.contains("chat")){
            return "redirect:/";
        }else {
            return "redirect:/chat/chatList";
        }
    }

    /*
    @RequestMapping(value="index", method = RequestMethod.GET)
    public String index(@CookieValue(value = "keepId",required = false)String userId,@CookieValue(value = "keepLogin",required = false)String password, HttpSession session){
        User user = new User();
        user.setUserId(userId); 
        user.setPassword(password);
        try{
            User dbVO=userService.loginUser(user);
            session.setAttribute("user",dbVO);
        }catch (Exception e){
            System.out.println("로그인 실패");
        }
        return "forward:/main.jsp";
    }
*/
    @RequestMapping(value="listUsers")
    public String listUsers(Model model,@ModelAttribute("search") Search search)throws Exception{
        System.out.println("여기는 lisrUsers 컨트롤러 시작이다");
        System.out.println("컨트롤러 search의 값???"+search);

        if (search.getCurrentPage() == 0) {
            search.setCurrentPage(1);
        }
        if (search.getPageSize() == 0) {
            search.setPageSize(pageSize);
        }
        if (search.getSearchKeyword() == null) {
            search.setSearchKeyword("");
        }
        System.out.println("컨트롤러 search 2 의 값???"+search);

        Map<String , Object> map=userService.listUsers(search);
        Page resultPage = new Page(search.getCurrentPage(), (Integer) map.get("totalCount"), pageUnit, pageSize);
        System.out.println("resultPage의 값은???"+resultPage);

        List<User> listUser = (List<User>)map.get("list");
        System.out.println("listUser의 값"+listUser);
        for(User user: listUser){
            user.loginStatusChk();
        }

        model.addAttribute("list", map.get("list"));
        model.addAttribute("resultPage", resultPage);
        model.addAttribute("search", search);

        return "forward:/view/user/listUser.jsp";
    }

    @RequestMapping(value="listUserDetail", method = RequestMethod.GET)
    public String listUserDetail(@RequestParam(value = "userId") String userId,Model model)throws Exception{
        System.out.println("여기는 listUserDetailil 컨트롤러 시작이다");
        System.out.println("userId 값은? : "+userId);

        Map<String, Object> map =userService.getUserDetail(userId);
        System.out.println("유저 컨트롤러 map 값은? :"+map);
        List<UserInterList> abcd = (List<UserInterList>)map.get("listInterList");
        String interList = "";
        String listInter = "";
        for(int i=0; i<abcd.size();i++) {
            switch (Integer.parseInt(abcd.get(i).getInterList())){
                case 1:
                    interList = "독서";

                    break;
                case 2:
                    interList = "자동차";

                    break;
                case 3:
                    interList = "반려동물";

                    break;
                case 4:
                    interList = "공예";

                    break;
                case 5:
                    interList = "스포츠";

                    break;
                case 6:
                    interList = "댄스";

                    break;
                case 7:
                    interList = "여행";

                    break;
                case 8:
                    interList = "사진";

                    break;
                case 9:
                    interList = "육아";

                    break;
                case 10:
                    interList = "공연";

                    break;
                case 11:
                    interList = "음악";

                    break;
                case 12:
                    interList = "게임";

                    break;
                case 13:
                    interList = "그외";

                    break;
            }
            listInter += interList+" ";
            System.out.println("lisInter의값..."+listInter);
            map.put("listInter",listInter);
        }
        User userDetail = (User)map.get("userDetail");
        userDetail.loginStatusChk();
        userDetail.loginTypeChk();

        System.out.println("모델넘기기전 마지막 map의값"+map);
        model.addAttribute("map", map);
        return "forward:/view/user/getUserDetail.jsp";
    }

    @RequestMapping(value="updatePsd", method = RequestMethod.GET)
    public String updatePsd(@RequestParam(value = "userId") String userId,Model model)throws Exception{
        System.out.println("여기는 updatePsd 컨트롤러 시작이다");


        Map<String, Object> map =userService.getUserDetail(userId);
        System.out.println("유저 updatePsd 컨트롤러 map 값은? :"+map);
        List<UserInterList> abcd = (List<UserInterList>)map.get("listInterList");
        String interList = "";
        String listInter = "";
        for(int i=0; i<abcd.size();i++) {
            switch (Integer.parseInt(abcd.get(i).getInterList())){
                case 1:
                    interList = "독서";

                    break;
                case 2:
                    interList = "자동차";

                    break;
                case 3:
                    interList = "반려동물";

                    break;
                case 4:
                    interList = "공예";

                    break;
                case 5:
                    interList = "스포츠";

                    break;
                case 6:
                    interList = "댄스";

                    break;
                case 7:
                    interList = "여행";

                    break;
                case 8:
                    interList = "사진";

                    break;
                case 9:
                    interList = "육아";

                    break;
                case 10:
                    interList = "공연";

                    break;
                case 11:
                    interList = "음악";

                    break;
                case 12:
                    interList = "게임";

                    break;
                case 13:
                    interList = "그외";

                    break;
            }
            listInter += interList+"\n\r";
            System.out.println("lisInter의값..."+listInter);
            map.put("listInter",listInter);
        }
        model.addAttribute("map", map);
        System.out.println("여기는 updatePsd 컨트롤러 종료이다");
        return "forward:/view/user/updatePsd.jsp";
    }

    @RequestMapping(value = "listupdatedUser", method = RequestMethod.POST)
    public String listupdatedUser(@ModelAttribute User user, UserInterList interList, Model model)throws Exception{
        System.out.println("listupdatedUser의 컨트롤러 시작~~~~");
        System.out.println("user의 값!!"+user);
        System.out.println("interlis 의 값"+interList);
        //System.out.println("userId"+userId);

        userService.updatePsd(user);
        userService.updatePed(user);
        Map<String, Object> map =userService.getUserDetail(user.getUserId());
        System.out.println("유저 updatePsd 컨트롤러 map 값은? :"+map);
        model.addAttribute("map", map);
        System.out.println("여기는 listupdatedUser 컨트롤러 종료이다");

        return "forward:/view/user/getUserDetail.jsp";
    }

    @RequestMapping(value="kickoutUser", method = RequestMethod.GET)
    public String kickoutUser(@RequestParam(value = "userId") String userId,Model model)throws Exception{
        System.out.println("여기는 kickoutUser 컨트롤러 시작이다");
        System.out.println("userId의갑은?"+userId);

       userService.updateUserStatus(userId);

        System.out.println("유저현황 업데이트 완료");
        Map<String, Object> map =userService.getUserDetail(userId);
        System.out.println("유저 컨트롤러 map 값은? :"+map);
        model.addAttribute("map", map);
        return "forward:/view/user/getUserDetail.jsp";
    }

    @RequestMapping(value="userPhoto", method = RequestMethod.GET)
    public String userPhoto(@RequestParam("userPhoto")String userPhoto, Model model)throws Exception{
        System.out.println("여기는 userPhoto 컨트롤러 시작이다");
        System.out.println("userPhoto 값은? : "+userPhoto);

        String userPhotoLink = "localHost:8080/resources/"+userImagePath+userPhoto;

        model.addAttribute("userPhotoLink",userPhotoLink);
        return "forward:/view/user/userPhoto.jsp";
    }

    @RequestMapping(value="kakaoLogin", method=RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code,
                             HttpSession session, Model model) throws Exception {
        System.out.println("#########" + code);

            String access_Token = userService.getAccessToken(code);

            User userInfo = userService.getUserInfo(access_Token);
            System.out.println("###access_Token#### : " + access_Token);
            System.out.println("###email#### : " + userInfo.getEmail());
            System.out.println("###userImage#### : " + userInfo.getUserImage());
            System.out.println("###gender#### : " + userInfo.getGender());
            System.out.println("###userId#### : " + userInfo.getUserId());

            User kakaoUser = userService.getUser(userInfo.getUserId());
            session.setAttribute("user", kakaoUser);
            model.addAttribute("kakaoUser", kakaoUser);

            return "forward:/view/user/updateSNSUserInfor.jsp";

    }

    @RequestMapping(value="callBack", method=RequestMethod.GET)
    public String callBack(){
        return "/view/user/callBack.jsp";
    }

}


