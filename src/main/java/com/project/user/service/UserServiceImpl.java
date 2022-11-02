package com.project.user.service;

import com.project.common.Search;
import com.project.common.dao.MongoDbDao;
import com.project.domain.CommunityReport;
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
import java.util.Random;

@Service ("userServiceImpl")
public class UserServiceImpl implements UserService{
    @Autowired
    @Qualifier("userDaoImpl")
    private UserDao userDao;

    @Autowired
    @Qualifier("mongoDbDaoImpl")
    MongoDbDao mongoDbDao;
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

    public void updateSNSUserInfor(User user)throws Exception{
        userDao.updateSNSUserInfor(user);
    }

    public void deleteInterList(UserInterList interList)throws Exception{
          userDao.deleteInterList(interList);
    }

    public User getUser(String userId)throws Exception{
        return userDao.getUser(userId);
    }

    public User getUserEmail(String email)throws Exception{
          return userDao.getUserEmail(email);
    }

    public User getUser2(String email)throws Exception{
          User dbUser2 = userDao.getUser2(email);
          return dbUser2;
    }

    public User getMyId(User user)throws Exception{
          return userDao.getMyId(user);
    }

    public User getMyPassword(User user) throws Exception{
          return userDao.getMyPassword(user);
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
        mongoDbDao.updateUser(user.getUserId(),user.getUserImage());
    }
    public void updatePsd(User user)throws Exception{
          userDao.updatePsd(user);
    }

    public void updatePed(User user)throws Exception{
        userDao.updatePed(user);
    }

    public void updateUserStatus(String userId)throws Exception{
          userDao.updateUserStatus(userId);
    }

    public void updateKakaoUser(User user)throws Exception{
        userDao.updateKakaoUser(user);
    }
    public void updateNaverUser(User user)throws Exception{
        userDao.updateNaverUser(user);
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

    public Map<String, Object> listUsers(Search search)throws Exception{
          List<User> list = userDao.listUsers(search);
        int totalCount = userDao.getTotalCount(search);


          Map<String, Object> map = new HashMap<String, Object>();
          map.put("list",list);
        map.put("totalCount", new Integer(totalCount));
        return map;
    }

    public Map<String, Object> getUserDetail(String userId)throws Exception{
          User userDetail = userDao.getUserDetail(userId);
          List<UserInterList> listInterList = userDao.listInterList(userId);


          Map<String, Object> map = new HashMap<String, Object>();
          System.out.println("유저임플 userDetail값 : "+userDetail);
          System.out.println("유저임플 listInterList값 : "+listInterList);
        map.put("userDetail", userDetail);
          map.put("listInterList", listInterList);

          return map;
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
            sb.append("&redirect_uri=http://192.168.0.235:8080/user/kakaoLogin"); // 본인이 설정한 주소

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

    public User getUserInfo(String access_Token)throws Exception {

        // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        User userInfo = new User();
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


            userInfo.setEmail(email);
            userInfo.setUserImage(userImage);
            userInfo.setGender(gender1);

        } catch (IOException e) {
            e.printStackTrace();
        }

        User result = userDao.getUserEmailKakao(userInfo);

        System.out.println("User의 값 : "+result);
        if(result==null) {
            // result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
            String no = "";
            Random rand = new Random();

            for (int i = 0; i < 4; i++) {
                String ran = Integer.toString(rand.nextInt(10));
                no += ran;
            }
            userInfo.setUserId("kakaoId"+no);
            userInfo.setLoginType("2");

            System.out.println("add카카오유저 하기 전 유저 값 "+userInfo);
            userDao.addKakaoUser(userInfo);
            /////////////문제없음//////////////////////////////////////////

            User userResult = userDao.getUserEmailKakao(userInfo);
            System.out.println("userResult의 값 :"+userResult);

            // 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
            return userResult;
            // 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
            //  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
        } else {
            return result;
            // 정보가 이미 있기 때문에 result를 리턴함.
        }
    }

    public void addNaverUser(User user)throws Exception{

        userDao.addNaverUser(user);

    }



}
