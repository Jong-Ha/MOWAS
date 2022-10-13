package com.project.common.util;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.Session;
import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/chat/*")
public class chat {

    @RequestMapping("chatList")
    public String chatList(Model model, HttpSession session) {

        model.addAttribute("userId",  session.getAttribute("user"));

        return "/chat/chatList.jsp";
    }
    //채팅 navigation
    @RequestMapping("getChat")
    public String getChat(@RequestParam("chatCategory") int chatCategory
                            ,@RequestParam("roomId")String roomId
                            , Model model) {




        if (chatCategory == 1) {

            model.addAttribute("roomId", roomId);

            return "/chat/getChat.jsp";
        }else if (chatCategory == 2) {
            return "/chat/clubChat.jsp";
        }else if (chatCategory == 3) {
            return "/chat/dealChat.jsp";
        }else if (chatCategory == 4) {
            return "/chat/siteChat.jsp";
        }
        return null;
    }


}
