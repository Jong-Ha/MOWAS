package com.project.common.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.*;

@EnableWebMvc
@RestController
@RequestMapping("/chat/json/*")
public class chatRestController {


    @Value("#{commonProperties['resourcesPath']}")
    String resourcesPath;

    @RequestMapping("chatFile")
    public Map<String, Object> chatfileUpload(@RequestParam("form") List<MultipartFile> file
                                ,HttpServletRequest request, HttpServletResponse response){


        System.out.println("파일 업로드 실행");
        List<Map<String, String>> fileList = new ArrayList<>();

        List<Map<String, String>> charImg = new ArrayList<>();

        File folder = new File(resourcesPath+"/uploadFiles/chatImg/");
        if(!folder.exists()){
            folder.mkdir();
        }

        for (int i = 0; i < file.size(); i++) {
            String fileName = file.get(i).getOriginalFilename();
            System.out.println("파일 이름 : " + fileName);
            Map<String, String> map = new HashMap<>();
            map.put("fileName", fileName);
            fileList.add(map);

            try {
                String chatName = "/uploadFiles/chatImg/"+ UUID.randomUUID() + fileList.get(i).get("fileName");
                file.get(i).transferTo(new File(chatName));
                System.out.println("업로드 성공 : "+chatName);

                map.put("fileName", chatName);
                charImg.add(map);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        Map<String,Object> map2 = new HashMap<>();

        map2.put("list", charImg);

        return map2;
    }
}
