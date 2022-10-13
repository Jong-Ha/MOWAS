package com.project.user.service;

import com.project.domain.User;
import com.project.domain.UserInterList;
import com.project.user.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import java.io.*;
import java.net.*;
import com.google.gson.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service ("userServiceImpl")
public class UserServiceImpl implements UserService{
    @Autowired
    @Qualifier("userDaoImpl")
    private UserDao userDao;
    public void setUserDao(UserDao userDao){
        this.userDao = userDao;
    }

    public UserServiceImpl() {
        System.out.println(this.getClass());
    }

    public void addUser(User user)throws Exception{
        userDao.addUser(user);
    };

    //관심목록 추가
      public void addInterList(UserInterList interList)throws Exception{
        System.out.println("여기는 addInterList 서비스임플 시작이다");
        userDao.addInterList(interList);
        System.out.println("여기는 addInterList 서비스임플 종료이다");
    }

    public void deleteInterList(UserInterList interList)throws Exception{
          userDao.deleteInterList(interList);
    }

    public User getUser(String userId)throws Exception{
        return userDao.getUser(userId);
    }

    public User loginUser(User user)throws Exception{
          User dbUser = userDao.getUser(user.getUserId());
          return dbUser;
    }

    public void updateLcd(String msg)throws Exception{
          userDao.updateLcd(msg);
    }

    public void updateUser(User user)throws Exception{
        userDao.updateUser(user);
    }

    public boolean checkDupId(String userId)throws Exception{
        boolean result=true;
        User user = userDao.getUser(userId);
        if(user !=null){
            result=false;
        }
        return result;
    }

    public boolean checkDupRrd(String rrd)throws Exception{
          boolean result=true;
          User user = userDao.checkDupRrd(rrd);
          System.out.println("유저임플 user값 : "+user);
          if(user !=null){
              result=false;

          }
          return result;
    }

    public Map<String, Object> listUser(User user)throws Exception{
          List userList = userDao.listUser(user);
          Map<String, Object> map = new HashMap<String, Object>();
          map.put("userList",userList);
        return map;
    }

    public User getUserDetail(String userId)throws Exception{
          User userDetail = userDao.getUserDetail(userId);
          return userDetail;
    }

    public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");

            sb.append("&client_id=6230abede953ee2dbfed27975e15f04a"); //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8080/user/kakaoLogin"); // 본인이 설정한 주소

            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return access_Token;
    }

    public HashMap<String, Object> getUserInfo(String access_Token) {

        // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";//현재 로그인한 사용자의 정보를 가져오는것
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            JsonObject profile_image = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject gender = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            String userImage = profile_image.getAsJsonObject().get("profile_image").getAsString();
            String gender1 = gender.getAsJsonObject().get("gender").getAsString();


            userInfo.put("email", email);
            userInfo.put("userImage", userImage);
            userInfo.put("gender", gender1);

        } catch (IOException e) {
            e.printStackTrace();
        }


        return userInfo;
    }



}
