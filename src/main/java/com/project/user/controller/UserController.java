package com.project.user.controller;

import com.project.common.Search;
import com.project.domain.User;
import com.project.user.service.UserService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Properties;


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

    @RequestMapping(value = "addUser",method = RequestMethod.GET)
    public String addUser() throws Exception{
        System.out.println("/user/addUser : GET 실행");
        return "forward:/view/user/addUser.jsp";
    }

    @RequestMapping(value = "addUser",method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user) throws Exception{
        System.out.println("/user/addUser : POST 실행");
        userService.addUser(user);
        return "forward:/view/user/main.jsp";
    }

    @RequestMapping(value = "getUser", method = RequestMethod.GET)
    public String getUser(@RequestParam("userId")String userId, Model model)throws Exception{
        System.out.println("/user/getUser : GET 실행");
        User user = userService.getUser(userId);
        model.addAttribute("user", user);
        return "forward:/view/user/getUser.jsp";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login() throws Exception{
        System.out.println("/user/login : GET 실행");
        return "redirect:/view/user/login.jsp";
    }

    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(@ModelAttribute("user") User user, Model model, HttpSession session)throws Exception{
        System.out.println("/user/login : POST 실행");
        System.out.println("user의 값은? : "+user);
        System.out.println("userId의 값은? : " + user.getUserId());

        User dbUser = userService.getUser(user.getUserId());
        System.out.println("dbUser의 값은? : "+dbUser);
        if(user.getPassword().equals(dbUser.getPassword())){
            session.setAttribute("user",dbUser);
        }
        System.out.println("session 값 : "+session);
        return "redirect:/view/user/main.jsp";
    }

    @RequestMapping(value = "logout",method = RequestMethod.GET)
    public String logout(HttpSession session)throws Exception{
        System.out.println("/user/logout : POST");
        session.invalidate();
        return "redirect:/view/user/main.jsp";
    }

    @RequestMapping(value="listUser")
    public String listUser(@ModelAttribute("search")Search search, Model model)throws Exception{

        return "forward:/view/user/listUser.jsp";
    }



    @RequestMapping(value = "mailSender",method = RequestMethod.POST)
    public void mailSender(HttpServletRequest request, ModelMap mo,@RequestParam(value="email", required = false)String email) throws AddressException, MessagingException {

        System.out.println("여기는 mailSender 컨트롤러 시작이다");
        System.out.println("email의 값은? : "+email);

        // 네이버일 경우 smtp.naver.com 을 입력합니다.
        // Google일 경우 smtp.gmail.com 을 입력합니다.
        String host = "smtp.naver.com";

        final String username = "apf2013";       //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요.
        final String password = "dnjfdighkseka21!";  //네이버 이메일 비밀번호를 입력해주세요.
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
        mimeMessage.setFrom(new InternetAddress("apf2013@naver.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음


        mimeMessage.setSubject(subject);  //제목셋팅
        mimeMessage.setText(body);        //내용셋팅
        Transport.send(mimeMessage); //javax.mail.Transport.send() 이용

        System.out.println("여기는 mailSender 컨트롤러 종료이다");
    }

}
