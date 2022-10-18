package com.project.user.controller;

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

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
    public String addUser(@ModelAttribute User user,@ModelAttribute UserInterList interList,
                          @RequestParam(value = "file") MultipartFile file,HttpSession session
                          ) throws Exception{
        System.out.println("/user/addUser : POST 실행");
        System.out.println("user 값은 ? :"+user);
        System.out.println("interList의 값은 ? :"+interList);

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

            String uploadLocation = uploadFolder + "\\" + uniqueName + fileRealName;
            System.out.println("uploadLocation의 값 :" + uploadLocation);

            File saveFile = new File(uploadLocation);
            try {
                file.transferTo(saveFile);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

            String userImage = userImagePath+uniqueName+fileRealName;
            user.setUserImage(userImage);
            userService.addUser(user);

            session.setAttribute("user", user);

        }else{
            String userImage = userImagePath+"pngwing.png";
            user.setUserImage(userImage);
            userService.addUser(user);
            session.setAttribute("user", user);
        }

        System.out.println("/user/addUser : POST 종료");
        return "forward:/view/user/main.jsp";
    }

    @RequestMapping(value = "getUser", method = RequestMethod.GET)
    public String getUser(@RequestParam("userId")String userId, Model model)throws Exception{
        System.out.println("/user/getUser : GET 실행");
        User user = userService.getUser(userId);
        model.addAttribute("user", user);
        return "forward:/view/user/getUserDetail.jsp";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(@CookieValue(value = "keepId",required = false)String userId,@CookieValue(value = "keepLogin",required = false)String password, HttpSession session){
        User user = new User();
        user.setUserId(userId);
        user.setPassword(password);
        try{
            User dbVO=userService.loginUser(user);
            session.setAttribute("user",dbVO);
        }catch (Exception e){
            System.out.println("로그인 실패");
        }
        return "forward:/view/user/main.jsp";
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
        return "redirect:/view/user/main.jsp";
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
    @RequestMapping(value="listUser", method = RequestMethod.GET)
    public String listUser(@ModelAttribute("user")User user, Model model)throws Exception{
        System.out.println("여기는 lisrUser 컨트롤러 시작이다");
        System.out.println("user의 값은? : "+user);

        Map<String, Object> userList = userService.listUser(user);
        System.out.println("userList의 값 ???: "+userList);
        model.addAttribute("user",userList);
        return "forward:/view/user/listUser.jsp";
    }

    @RequestMapping(value="listUserDetail", method = RequestMethod.GET)
    public String listUserDetail(@RequestParam(value = "userId") String userId,Model model)throws Exception{
        System.out.println("여기는 listUserDetailil 컨트롤러 시작이다");
        System.out.println("userId 값은? : "+userId);

        Map<String, Object> map =userService.getUserDetail(userId);
        System.out.println("유저 컨트롤러 map 값은? :"+map);
        model.addAttribute("map", map);
        return "forward:/view/user/getUserDetail.jsp";
    }

    @RequestMapping(value="updatePsd", method = RequestMethod.GET)
    public String updatePsd(@RequestParam(value = "userId") String userId,Model model)throws Exception{
        System.out.println("여기는 updatePsd 컨트롤러 시작이다");


        Map<String, Object> map =userService.getUserDetail(userId);
        System.out.println("유저 updatePsd 컨트롤러 map 값은? :"+map);
        model.addAttribute("map", map);
        System.out.println("여기는 updatePsd 컨트롤러 종료이다");
        return "forward:/view/user/updatePsd.jsp";
    }

    @RequestMapping(value = "listupdatedUser", method = RequestMethod.POST)
    public String listupdatedUser(@ModelAttribute User user, UserInterList interList, Model model)throws Exception{
        System.out.println("user"+user);
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

    @RequestMapping(value = "mailSender",method = RequestMethod.POST)
    public void mailSender(HttpServletRequest request, ModelMap mo,@RequestParam(value="email", required = false)String email) throws AddressException, MessagingException {

        System.out.println("여기는 mailSender 컨트롤러 시작이다");
        System.out.println("email의 값은? : "+email);

        // 네이버일 경우 smtp.naver.com 을 입력합니다.
        // Google일 경우 smtp.gmail.com 을 입력합니다.
        String host = "smtp.gmail.com";

        final String username = "gmltjs6550";       //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요.
        final String password = "fbbetmkwbszeacug";  //네이버 이메일 비밀번호를 입력해주세요.
        int port=465; //포트번호


        // 메일 내용
        String recipient = email;    //받는 사람의 메일주소를 입력해주세요.
        String subject = "MOWAS 이메일 인증코드입니다"; 	  //메일 제목 입력해주세요.
        String body = "MOWAS님으로 부터 메일을 받았습니다. " +
                "인증번호는 [1234]입니다"; //메일 내용 입력해주세요.

        Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성

        // SMTP 서버 정보 설정
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", host);

        //Session 생성
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            String un=username;
            String pw=password;
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(un, pw);
            }
        });
        session.setDebug(true); //for debug

        Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
        mimeMessage.setFrom(new InternetAddress("gmltjs6550@gmail.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음


        mimeMessage.setSubject(subject);  //제목셋팅
        mimeMessage.setText(body);        //내용셋팅
        Transport.send(mimeMessage); //javax.mail.Transport.send() 이용

        System.out.println("여기는 mailSender 컨트롤러 종료이다");
    }

    @RequestMapping(value="kakaoLogin", method=RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
        System.out.println("#########" + code);
        String access_Token = userService.getAccessToken(code);

        HashMap<String, Object> userInfo = userService.getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###email#### : " + userInfo.get("email"));
        System.out.println("###userImage#### : " + userInfo.get("userImage"));
        System.out.println("###gender#### : " + userInfo.get("gender"));

        return "forward:/view/user/main.jsp";
    }

    @RequestMapping(value="callBack", method=RequestMethod.GET)
    public String callBack(){
        return "/view/user/callBack.jsp";
    }

}


