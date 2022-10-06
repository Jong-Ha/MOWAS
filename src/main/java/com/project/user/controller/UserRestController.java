package com.project.user.controller;

import com.project.domain.User;
import com.project.domain.UserInterList;
import com.project.user.service.UserService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import java.util.HashMap;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;


    @RequestMapping(value = "json/getUser", method = RequestMethod.POST)
    public User getUser(@RequestBody User user, Model model)throws Exception{
        System.out.println("json/getUser : POST 실행");
        userService.getUser(user.getRrd());
        model.addAttribute("user", user);
        return user;
    }


    @RequestMapping(value = "interListControl", method=RequestMethod.POST)
    public void interListControl(@ModelAttribute(value="interList") UserInterList interList)throws  Exception{
        System.out.println("여기는 interListControl 시작이다");
        System.out.println("interList의 값은 ? :"+interList);
        userService.addInterList(interList);
    }


    @RequestMapping(value = "smsSend",method = RequestMethod.POST)
    public void smsSend(@RequestParam(value="sms", required = false)String phone) throws Exception{
        System.out.println("여기는 smsSend 컨트롤러 시작이다");
        System.out.println("sms의 값은 ? : "+phone);

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
