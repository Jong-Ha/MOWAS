package com.project.common.util;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@EnableWebMvc
@RestController
@RequestMapping("/chat/json/*")
public class chatRestController {


    @RequestMapping("chatFile")
    public int chatfileUpload(@RequestParam("form") List<MultipartFile> file
                                ,HttpServletRequest request, HttpServletResponse response){


        System.out.println("파일 업로드 실행");
        List<Map<String, String>> fileList = new ArrayList<>();

        for (int i = 0; i < file.size(); i++) {
            String fileName = file.get(i).getOriginalFilename();
            System.out.println("파일 이름 : " + fileName);
            Map<String, String> map = new HashMap<>();
            map.put("fileName", fileName);
            fileList.add(map);

            try {
                file.get(i).transferTo(new File("/uploadFiles/" + fileList.get(i).get("fileName")));
                System.out.println("업로드 성공");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }
}
