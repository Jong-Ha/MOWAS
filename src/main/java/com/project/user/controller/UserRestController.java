package com.project.user.controller;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.domain.User;
import com.project.domain.UserInterList;
import com.project.user.service.UserService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@RestController
@RequestMapping("/user/json/*")
public class UserRestController {

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @RequestMapping(value = "checkDupRrd", method = RequestMethod.POST)
    public Map<String, Object> checkDupRrd(@RequestParam String rrd) throws Exception {
        System.out.println("json/checkDupRrd : POST 실행");
        System.out.println("rrd의 값1 : " + rrd);
        boolean result = userService.checkDupRrd(rrd);
        System.out.println("rrd의 값2 : " + rrd);
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("result", new Boolean(result));
        System.out.println("result의 값 : " + result);
        map.put("rrd", rrd);
        System.out.println("rrd의 값3 : " + rrd);
        return map;
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public User login(@RequestBody User user, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("/user/json/login : POST 실행");
        System.out.println("user의 값은? : " + user);

        Cookie lastDate= null;
        String msg ="";
        boolean found = false;
        String newValue = ""+System.currentTimeMillis();
        Cookie[] cookies = request.getCookies();
        if(cookies!=null){ //마지막 방문일을 정하고 있는 쿠키를 검색
            for(int i=0; i< cookies.length; i++){
                lastDate=cookies[i];
                if(lastDate.getName().equals("lastdateCookie")){
                    found=true;
                    break;
                }
            }
        }
        if(!found){ //처음 방문일 경우 새 쿠키 생성
            lastDate= new Cookie("lastdateCookie",newValue);
            lastDate.setMaxAge(365*24*60*60);//365일
            lastDate.setPath("/");
            response.addCookie(lastDate);
        }else { //이미 방문한 적이 있는 클라이언트라면
            long conv = new Long(lastDate.getValue()).longValue();

            Date date = new Date(conv);
            String year = date.getYear() + 1900 + "년";
            String month = date.getMonth() + 1 + "월";
            String day = date.getDay() + "일";
            String hour = date.getHours() + "시";
            String minute = date.getMinutes() + "분";
            msg =year + month + day + hour + minute;
            System.out.println(msg);

            lastDate.setValue(newValue);
            response.addCookie(lastDate);
        }

        System.out.println("msg : "+msg);

        try {
            User dbVO = userService.loginUser(user);
            System.out.println("dbVO 값은? : " + dbVO);
            if (user.getPassword().equals(dbVO.getPassword())) {
                //System.out.println("if문 안의 유저의값 : "+user);
                //userService.updateLcd(msg);
                //System.out.println("lcd업데이트 유저 :"+dbVO);
                session.setAttribute("user", dbVO);
                user = dbVO;

            }
            System.out.println("session 값 : " + session);
        } catch (Exception e) {
            System.out.println("catch문 안의 유저의값 : "+user);
            user = null;
            System.out.println("로그인 실패");
        }



        return user;
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public void logout(HttpSession session) throws Exception {
        System.out.println("/user/json/logout : Get");
        session.removeAttribute("user");
    }

    @RequestMapping(value = "interListControl", method = RequestMethod.POST)
    public void interListControl(@RequestBody UserInterList interList) throws Exception {
        System.out.println("여기는 interListControl 시작이다");
        System.out.println("interList의 값은 ? :" + interList);

        userService.addInterList(interList);
        System.out.println("여기는 interListControl 종료이다");
    }

    @RequestMapping(value = "deleteInter", method = RequestMethod.POST)
    public void deleteInter(@RequestBody UserInterList interList) throws Exception {
        System.out.println("여기는 deleteInter 시작이다");
        System.out.println("interList의 값은 ? :" + interList);

        userService.deleteInterList(interList);
        System.out.println("여기는 deleteInter 종료이다");
    }

    @RequestMapping(value = "mailSender", method = RequestMethod.POST)
    public void mailSender(HttpServletRequest request, ModelMap mo, @RequestParam(value = "email", required = false) String email) throws AddressException, MessagingException {

        System.out.println("여기는 mailSender 컨트롤러 시작이다");
        System.out.println("email의 값은? : " + email);

        // 네이버일 경우 smtp.naver.com 을 입력합니다.
        // Google일 경우 smtp.gmail.com 을 입력합니다.
        String host = "smtp.gmail.com";

        final String username = "gmltjs6550";       //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요.
        final String password = "fbbetmkwbszeacug";  //네이버 이메일 비밀번호를 입력해주세요.
        int port = 465; //포트번호


        // 메일 내용
        String recipient = email;    //받는 사람의 메일주소를 입력해주세요.
        String subject = "MOWAS 이메일 인증코드입니다";      //메일 제목 입력해주세요.
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
            String un = username;
            String pw = password;

            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(un, pw);
            }
        });
        session.setDebug(true); //for debug

        javax.mail.Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
        mimeMessage.setFrom(new InternetAddress("gmltjs6550@gmail.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
        mimeMessage.setRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음


        mimeMessage.setSubject(subject);  //제목셋팅
        mimeMessage.setText(body);        //내용셋팅
        Transport.send(mimeMessage); //javax.mail.Transport.send() 이용

        System.out.println("여기는 mailSender 컨트롤러 종료이다");
    }


    @RequestMapping(value = "smsSend", method = RequestMethod.POST)
    public void smsSend(@RequestParam(value = "phone", required = false) String phone) throws Exception {
        System.out.println("여기는 smsSend 컨트롤러 시작이다");
        System.out.println("sms의 값은 ? : " + phone);

        String api_key = "NCS8DGDOVVDHWMZB";
        String api_secret = "SDJQN3WYN4QUGY8Q5QFM8MNHC9RQHPWI";
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", "01064440516");
        params.put("from", phone);
        params.put("type", "SMS");
        params.put("text", "MOWAS 문자인증입니다. 인증번호는[1234]입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
        System.out.println("여기는 smsSend 컨트롤러 종료이다");

    }


}


