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

    @RequestMapping("addOneChat/{userId}")
    public String addOneChat(@PathVariable String userId, Model model) {

        model.addAttribute("roomId", UUID.randomUUID().toString());

        return "/chat/getChat.jsp";
    }

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
