package com.project.user.controller;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.domain.User;
import com.project.domain.UserInterList;
import com.project.user.service.UserService;
import com.sun.xml.internal.ws.api.message.Attachment;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import javax.activation.*;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;



import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.project.common.KakaoMapApi.coordToAddress;

@RestController
@RequestMapping("/user/json/*")
public class UserRestController {



    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @RequestMapping(value = "checkDupRrd", method = RequestMethod.POST)
    public Map<String, Object> checkDupRrd(@RequestParam String rrd) throws Exception {
        System.out.println("json/checkDupRrd : POST 실행");
        boolean result = userService.checkDupRrd(rrd);

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("result", new Boolean(result));
        System.out.println("result의 값 : " + result);
        map.put("rrd", rrd);
        System.out.println("rrd의 값 : " + rrd);
        return map;
    }

    @RequestMapping(value = "userId", method = RequestMethod.POST)
    public boolean userId(@RequestParam String userId) throws Exception {
        System.out.println("json/userName : POST 실행");
        System.out.println("userId 값 : " + userId);
        boolean result = userService.checkDupId(userId);

        return result;
    }

    @RequestMapping(value = "password", method = RequestMethod.POST)
    public boolean password(@RequestParam String password) throws Exception {
        System.out.println("json/password : POST 실행");
        System.out.println("password 값 : " + password);

        String patten = "^[A-Za-z[0-9]]{8,16}$";
        boolean result = Pattern.matches(patten, password);


        return result;
    }
    @RequestMapping(value = "password2", method = RequestMethod.POST)
    public boolean password2(@RequestParam String password, @RequestParam String password2) throws Exception {
        System.out.println("json/password2 : POST 실행");
        System.out.println("password 값 : " + password);
        System.out.println("password2 값 : " + password2);

        if(password.equals(password2)){
            boolean result =true;
            System.out.println("result값"+result);
            return result;
        }else {
            boolean result =false;
            System.out.println("result값"+result);
            return result;
        }
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public  Map<String, Object> login(@RequestBody User user,
                      HttpSession session, HttpServletRequest request, HttpServletResponse response,
                      Model model) throws Exception {
        System.out.println("/user/json/login : POST 실행");
        System.out.println("user의 값은? : " + user);

/* 마지막접속날짜 쿠키사용 코드
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
*/
        String uri = request.getHeader("Referer");
        if (uri != null && !uri.contains("/user/json/login")) {
            request.getSession().setAttribute("prevPage", uri);
        }
        System.out.println("uri의 값?????????????"+uri);
        Map<String, Object> map = new HashMap<String, Object>();

        boolean result = false;
        try {
            User dbVO = userService.loginUser(user);
            System.out.println("dbVO 값은? : " + dbVO);
            if (user.getPassword().equals(dbVO.getPassword())) {
                //System.out.println("if문 안의 유저의값 : "+user);
                //userService.updateLcd(msg);
                //System.out.println("lcd업데이트 유저 :"+dbVO);
                session.setAttribute("user", dbVO);
                user = dbVO;
                model.addAttribute("user", user);
                result = true;
                System.out.println("session 값 : " + session);
                if(!dbVO.getUserStatus().equals("1")){
                    map.put("cannot","cannot");
                    session.removeAttribute("user");
                }
                map.put("result", result);
                map.put("uri", uri);
                return map;
            }

        } catch (Exception e) {
            System.out.println("catch문 안의 유저의값 : "+user);
            user = null;
            System.out.println("로그인 실패");
        }
        map.put("result", result);
        map.put("uri", uri);
        return map;
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public void logout(HttpSession session) throws Exception {
        System.out.println("/user/json/logout : Get");
        session.removeAttribute("user");
    }

    @RequestMapping(value = "addinterList", method = RequestMethod.POST)
    public boolean addinterList(@RequestBody UserInterList interList) throws Exception {
        System.out.println("여기는 addinterList 시작이다");
        System.out.println("interList의 값은 ? :" + interList);

        userService.addInterList(interList);
        boolean result=true;
        System.out.println("여기는 addinterList 종료이다");
        return result;

    }

        @RequestMapping(value = "deleteInter", method = RequestMethod.POST)
        public boolean deleteInter(@RequestBody UserInterList interList) throws Exception {
            System.out.println("여기는 deleteInter 시작이다");
            System.out.println("interList의 값은 ? :" + interList);

            userService.deleteInterList(interList);
            boolean result=true;
            System.out.println("여기는 deleteInter 종료이다");
            return result;
        }

     @RequestMapping(value = "updateSNSUserInfor",method = RequestMethod.POST)
     public boolean updateSNSUserInfor(@RequestBody User user,
                                     HttpSession session) throws Exception{
        System.out.println("/user/json/updateSNSUserInfor : POST 실행");
        System.out.println("user 값은 ? :"+user);

        userService.updateSNSUserInfor(user);
        User user1 = userService.getUser(user.getUserId());

        session.setAttribute("user", user1);

        boolean result = true;
        System.out.println("/user/json/updateSNSUserInfor : POST 종료");
        return result;
    }

    /*
        @RequestMapping(value = "psd7", method = RequestMethod.POST)
        public Map<String, Object> psd7(@RequestBody Map<String, Object> map) throws Exception {
            System.out.println("여기는 psd7컨트롤 시작이다");
            System.out.println("psd의 값은 ? :" + map.get("psd"));
            System.out.println("pptDate의 값은 ? :" + map.get("pptDate"));
            System.out.println("ped의 값은 ? :" + map.get("ped"));

            String pptDate = map.get("pptDate").toString();

            String psd = map.get("psd").toString().substring(0,11).replace("-","");
            String ped = map.get("ped").toString().substring(0,11).replace("-","");

            System.out.println("psd의 값은? "+psd);
            System.out.println("ped의 값은? "+ped);
            System.out.println("pptDate의 값은? "+pptDate);

            map.put("psd", psd);
            map.put("ped", ped);
            map.put("pptDate", pptDate);
            System.out.println("여기는 psd7컨트롤 종료이다");
            return map;
        }
    */
    @RequestMapping(value = "checkAddress", method = RequestMethod.POST)
    public boolean checkAddress(@RequestBody Map<String, String> map)throws Exception{
        System.out.println("villCode의 값은 ? :"+map.get("villCode"));
        System.out.println("lat의 값은 ? :"+map.get("lat"));
        System.out.println("lon의 값은 ? :"+map.get("lon"));

        String villcode = map.get("villCode");
        String lat = map.get("lat");
        String lon = map.get("lon");

       // String lat = "37.4994558";
       // String lon = "127.0290206";

        String location = "";
        location = coordToAddress(lon, lat,1);
        System.out.println("location 의 값은??? : "+location);

        boolean check = villcode.contains(location);
        System.out.println("check 의 값은 ?? : "+check);
        if(check == true){
            boolean result=true;
            return result;
        }else {
            boolean result=false;
            return result;
        }

    }

    @RequestMapping(value = "mailSender", method = RequestMethod.POST)
    public String mailSender(HttpServletRequest request, Model model, @RequestParam(value = "email", required = false) String email) throws AddressException, MessagingException {

        System.out.println("여기는 mailSender 컨트롤러 시작이다");
        System.out.println("email의 값은? : " + email);

        // 네이버일 경우 smtp.naver.com 을 입력합니다.
        // Google일 경우 smtp.gmail.com 을 입력합니다.
        String host = "smtp.gmail.com";

        final String username = "mowas1226";       //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요.
        final String password = "pfhcwivcgyxjrpro";  //네이버 이메일 비밀번호를 입력해주세요.
        int port = 465; //포트번호

        Random rand = new Random();
        String emailNo="";
        for(int i=0;i<4;i++){
            String ran = Integer.toString(rand.nextInt(10));
            emailNo += ran;
        }
        System.out.println("emailNo의 값은 ::::: "+emailNo);

        StringBuffer sb = new StringBuffer();
        sb.append("<html><body><title>MOWAS</title>");
        sb.append("<meta http-equiv='Content-Type' content='text/html'; charset='euc-kr'><link rel=\"icon\" href=\"/favicon.ico\" type=\"image/x-icon\">");
        sb.append("</head><body> ");
        sb.append("<div class='container-sm'>");
        sb.append("<br><br><div style='border: 1px solid; width: 600px; height: 210px; background-color: #333333;'>");
        sb.append("<img style='margin-left: 75px; border-radius : 50%;' src='https://192.168.0.235:8443/resources/images/MOWAS_T_2.png'></div>");
        sb.append("<br><br><div class='ms-5'; style='margin-left: 130px;'/>");
        sb.append("<span style='font-size: 15px;'>MOWAS</span><br>");
        sb.append(" <span style='font-size: 28px;color: #f56c42;'>메일인증</span><span style='font-size: 28px;'> 안내입니다</span>");
        sb.append("<p style='font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;'>");
        sb.append(" 안녕하세요<br>MOWAS에 가입해 주셔서 진심으로 감사드립니다.<br>아래 인증번호로 인증해주세요<br><br><br></p>");
        sb.append("<span style='font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;'>");
        sb.append("인증번호 [ </span><span style='font-size: 28px; font-weight: bold;'>"+emailNo+"</span>");
        sb.append("<span> ]입니다</span><br><br><br>감사합니다</div>");
        sb.append("<br><br><br><div style='border: 1px solid; width: 600px; height: 10px; background-color: #333333;'>");
        sb.append("</div></body></html>");

        System.out.println("과연 ? 1");
        String str = sb.toString();
        System.out.println("과연 ? 2");

        // 메일 내용
        String recipient = email;    //받는 사람의 메일주소를 입력해주세요.
        String subject = "MOWAS 이메일 인증코드입니다";      //메일 제목 입력해주세요.
        String body = str;
                 //메일 내용 입력해주세요.

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
        mimeMessage.setFrom(new InternetAddress("mowas1226@gmail.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.
        mimeMessage.setRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음


        mimeMessage.setSubject(subject);  //제목셋팅
        mimeMessage.setContent(str, "text/html;charset=UTF-8");        //내용셋팅
        Transport.send(mimeMessage); //javax.mail.Transport.send() 이용

        System.out.println("emailNo의 값은???????????????????"+emailNo);
        model.addAttribute("no",emailNo);
        System.out.println("여기는 mailSender 컨트롤러 종료이다");

        return emailNo;
    }
/*
          //이메일 이미지 전송 도전 1
    @RequestMapping(value = "mailImage",method = RequestMethod.POST)
    public String mailImage(HttpServletRequest request, ModelMap mo,@RequestParam(value="email", required = false)String email) throws Exception,AddressException, MessagingException {
        System.out.println("여기는 mailImage 컨트롤러 시작이다");
        System.out.println("email의 값"+email);

        System.out.println("Sending mail...");
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.startls.enable","true");
        props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth","true");
        props.put("mail.debug","ture");
        props.put("mail.user", "mowas1226@gmail.com");
        props.put("mail.password", "kynmakvpudzstosh");

        //Authenticator auth = new SMTPAuthenticator();
        Session mailSession = Session.getDefaultInstance(props, null);
        mailSession.setDebug(true);
        Transport transport = mailSession.getTransport();

        Random rand = new Random();
        String emailNo="";
        for(int i=0;i<4;i++){
            String ran = Integer.toString(rand.nextInt(10));
            emailNo += ran;
        }
        System.out.println("emailNo의 값은 ::::: "+emailNo);

        StringBuffer sb = new StringBuffer();
        sb.append("<html><body><title>MOWAS</title>");
        sb.append("<meta http-equiv='Content-Type' content='text/html'; charset='euc-kr'>");
        sb.append("</head><body> ");
        sb.append("<div class='container-sm'>");
        sb.append("<br><br><div style='border: 1px solid; width: 600px; height: 10px; background-color: #333333;'></div>");
        sb.append("<br><br><br><br><div style='margin-left: 130px;'/>");
        sb.append("<span style='font-size: 15px;'>MOWAS</span><br>");
        sb.append(" <span style='font-size: 28px;color: #f56c42;'>메일인증</span><span style='font-size: 28px;'> 안내입니다</span>");
        sb.append("<p style='font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;'>");
        sb.append(" 안녕하세요<br>MOWAS에 가입해 주셔서 진심으로 감사드립니다.<br>아래 인증번호로 인증해주세요<br><br><br></p>");
        sb.append("<span style='font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;'>");
        sb.append("인증번호 [ </span><span style='font-size: 28px; font-weight: bold;'>"+emailNo+"</span>");
        sb.append("<span> ]입니다</span><br><br><br>감사합니다</div>");
        sb.append("<br><br><br><br><br><br><div style='border: 1px solid; width: 600px; height: 220px; background-color: #333333;'>");
                sb.append("<img src=/resources/images/MOWAS_T_2.jpg>");
        sb.append("</div></body></html>");

        System.out.println("과연 ? 1");
        String str = sb.toString();
        System.out.println("과연 ? 2");

        MimeMessage message = new MimeMessage(mailSession);
        //message.Attachments.Add(new Attachment(@"C:\\images\\won.jpg"));


        System.out.println("과연 ? 3");
        message.setSubject("[MOWAS] 이메일 인증 안내");
        System.out.println("과연 ? 4");
        message.setFrom(new InternetAddress("mowas1226@gmail.com"));
        System.out.println("과연 ? 5");
        message.setContent(str, "text/html;charset=UTF-8");
        System.out.println("과연 ? 6");
        message.addRecipient(javax.mail.Message.RecipientType.TO,
                new InternetAddress(email));
        System.out.println("과연 ? 7");
        transport.connect("smtp.gmail.com", "mowas1226@gmail.com", "kynmakvpudzstosh");
        System.out.println("과연 ? 8");
        transport.sendMessage(message,
                message.getRecipients(javax.mail.Message.RecipientType.TO));
        System.out.println("과연 ? 9");
        transport.close();


        System.out.println("여기는 mailSender 컨트롤러 종료이다");
        return "forward:/";
    }
  //이메일 이미지 전송 도전 2
    @RequestMapping(value = "mailImage",method = RequestMethod.POST)
    public void mailImage(HttpServletRequest request, ModelMap mo,@RequestParam(value="email", required = false)String email) throws AddressException, MessagingException {

        System.out.println("여기는 mailImage 컨트롤러 시작이다");
        System.out.println("email의 값은? : " + email);

        try{
            final String fromEmail = "mowas1226@gmail.com"; //requires valid gmail id
            final String password = "pfhcwivcgyxjrpro"; // correct password for gmail id
            final String toEmail = email; // can be any email id

            System.out.println("TLSEmail Start");
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
            props.put("mail.smtp.port", "587"); //TLS Port
            props.put("mail.smtp.auth", "true"); //enable authentication
            props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

            //create Authenticator object to pass in Session.getInstance argument
            Authenticator auth = new Authenticator() {
                //override the getPasswordAuthentication method
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            };
            Session session = Session.getInstance(props, auth);

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(toEmail));

            System.out.println("Mail Check 2");

            message.setSubject("Oil Error Report");
            message.setText("emailMessage");

            System.out.println("Mail Check 3");

            Transport.send(message);
            System.out.println("Mail Sent");
        }catch(Exception ex){
            System.out.println("Mail fail");
            System.out.println(ex);
        }



        System.out.println("여기는 mailSender 컨트롤러 종료이다");
    }
*/


    @RequestMapping(value = "smsSend", method = RequestMethod.POST)
    public String smsSend(@RequestParam(value = "phone", required = false) String phone,Model model ) throws Exception {
        System.out.println("여기는 smsSend 컨트롤러 시작이다");
        System.out.println("sms의 값은 ? : " + phone);

        String api_key = "NCS8DGDOVVDHWMZB";
        String api_secret = "SDJQN3WYN4QUGY8Q5QFM8MNHC9RQHPWI";
        Message coolsms = new Message(api_key, api_secret);

        Random rand = new Random();
        String smsNo="";
        for(int i=0;i<4;i++){
            String ran = Integer.toString(rand.nextInt(10));
            smsNo += ran;
        }
        System.out.println("smsNo의 값은 ::::: "+smsNo);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", "01064440516");
        params.put("from", phone);
        params.put("type", "SMS");
        params.put("text", "MOWAS 문자인증입니다. 인증번호는"+smsNo+"입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

        System.out.println("smsNo의 값은???????????"+smsNo);
        model.addAttribute("smsNo", smsNo);
        System.out.println("여기는 smsSend 컨트롤러 종료이다");
    return smsNo;
    }

    @RequestMapping(value="naverSave", method=RequestMethod.POST)
    public @ResponseBody String naverSave(@RequestParam("n_name") String n_name,
        @RequestParam("n_email") String n_email, @RequestParam("n_profilImage") String n_profilImage,
        @RequestParam("n_gender") String n_gender, HttpSession session, Model model ) throws Exception {
        System.out.println("#############################################");
        //System.out.println(n_id);
        System.out.println(n_name);
        System.out.println(n_email);
        System.out.println(n_profilImage);
        System.out.println(n_gender);
        //System.out.println(n_birthday);
        //System.out.println(n_birthyear);
        //System.out.println(phone);

        System.out.println("#############################################");

            User user = new User();
            //user.setUserId(n_id);
            user.setUserName(n_name);
            user.setEmail(n_email);
            user.setUserImage(n_profilImage);
            user.setGender(n_gender);
            user.setLoginType("3");

            String email = n_email;
        User dbEmail = userService.getUserEmail(email);
           System.out.println("dbemail의 값은 ? :"+dbEmail);
        //System.out.println("dbemail의 email값은 ? :"+dbEmail.getEmail());
        System.out.println("인자값 email의 값은? :"+email);
           if(dbEmail==null){

               String no = "";
               Random rand = new Random();

               for (int i = 0; i < 4; i++) {
                   String ran = Integer.toString(rand.nextInt(10));
                   no += ran;
               }
               user.setUserId("naverId" + no);
               System.out.println("네이버 유저 정보 : " + user);
               System.out.println("네이버로그인 겟유저아이디 값 : "+user.getUserId());

               userService.addNaverUser(user);
               User naverUser = userService.getUser(user.getUserId());
               session.setAttribute("user", naverUser);
                model.addAttribute(("naverUser"),naverUser );

                }else{

               System.out.printf("");
               User naverUser2 = userService.getUser2(email);
               session.setAttribute("user", naverUser2);
               model.addAttribute(("naverUser2"),naverUser2 );

           }

            // ajax에서 성공 결과에서 ok인지 no인지에 따라 다른 페이지에 갈 수 있게끔 result의 기본값을 "no"로 선언
        String result = "no";
        User naverUser2 = userService.getUser2(email);
        System.out.println("마지막 user의값 !!"+user);
        if(naverUser2!=null) {
            // user가 비어있지 않는다는건 데이터를 잘 받아왔다는 뜻이므로 result를 "ok"로 설정
            result = "ok";
        }
        return result;
    }

}


