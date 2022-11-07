package com.project.common.util;


import com.project.domain.User;
import com.project.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;

    @RequestMapping("addOneChat")
    public String addOneChat(@RequestParam("userId") String userId
            , @RequestParam(value = "boardNum", defaultValue = "0") String boardNum
            , @RequestParam(value = "roomName") String roomName
            , Model model
            , @RequestParam("chatNameSpace") String chatNameSpace, HttpSession session) throws Exception {

        model.addAttribute("roomId", UUID.randomUUID().toString());

        model.addAttribute("userId", userId);
        model.addAttribute("userImage", userService.getUser(userId).getUserImage().replaceAll("\\\\", "/"));
        model.addAttribute("chatNameSpace", chatNameSpace);
        model.addAttribute("roomName", roomName);


        if (!boardNum.equals("0")) {

            model.addAttribute("boardNum", boardNum);

        }

        System.out.println(chatNameSpace);

        User user = (User) session.getAttribute("user");

        user.setUserImage(user.getUserImage().replaceAll("\\\\", "/"));

        return "/chat/getChat.jsp";
    }

    @RequestMapping("chatList")
    public String chatList(@RequestParam(value = "chatCategory", defaultValue = "onebyone") String chatCategory
            , Model model, HttpSession session) {

        model.addAttribute("chatCategory", chatCategory);

        System.out.println(chatCategory);

        User user = null;

        if (session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");

            user.setUserImage(user.getUserImage().replaceAll("\\\\", "/"));
        }

        return "/chat/chatList.jsp";
    }

    //채팅 navigation
    @RequestMapping("getChat")
    public String getChat(@RequestParam("roomId") String roomId
            , @RequestParam("chatNameSpace") String chatNameSpace
            , Model model, HttpSession session) {


        model.addAttribute("roomId", roomId);
        model.addAttribute("chatNameSpace", chatNameSpace);

        System.out.println(chatNameSpace);

        User user = (User) session.getAttribute("user");

        user.setUserImage(user.getUserImage().replaceAll("\\\\", "/"));

        return "/chat/getChat.jsp";

    }


}
