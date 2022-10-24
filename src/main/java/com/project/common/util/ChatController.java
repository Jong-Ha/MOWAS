package com.project.common.util;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
@RequestMapping("/chat/*")
public class ChatController {

    @RequestMapping("addOneChat")
    public String addOneChat(@RequestParam("userId")String userId
                            ,@RequestParam(value = "boardNum", defaultValue = "0") String  boardNum
                            ,Model model
                            ,@RequestParam("chatNameSpace")String chatNameSpace) {

        model.addAttribute("roomId", UUID.randomUUID().toString());

        model.addAttribute("userId", userId);
        model.addAttribute("chatNameSpace", chatNameSpace);


        if (! boardNum.equals("0")){

            model.addAttribute("boardNum", boardNum);

        }

        System.out.println( chatNameSpace );

        return "/chat/getChat.jsp";
    }

    @RequestMapping("chatList")
    public String chatList(@RequestParam(value = "chatCategory", defaultValue = "onebyone") String chatCategory
                            ,Model model, HttpSession session) {

        model.addAttribute("userId",  session.getAttribute("user"));
        model.addAttribute("chatCategory", chatCategory);

        System.out.println(chatCategory);

        return "/chat/chatList.jsp";
    }
    //채팅 navigation
    @RequestMapping("getChat")
    public String getChat( @RequestParam("roomId")String roomId
                            ,@RequestParam("chatNameSpace")String chatNameSpace
                            , Model model) {


            model.addAttribute("roomId", roomId);
            model.addAttribute("chatNameSpace", chatNameSpace);

            System.out.println(chatNameSpace);

            return "/chat/getChat.jsp";

    }


}
