package com.project.user.service;

import com.project.domain.User;
import com.project.domain.UserInterList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
//import com.project.domain.UserInterList;


public interface UserService {
    //회원가입
    public void addUser(User user)throws Exception;

    //관심목록 추가
    public void addInterList(UserInterList interList)throws Exception;

    public void deleteInterList(UserInterList interList)throws Exception;

    //회원상세보기, 내정보 보기
    public User getUser(String userId)throws Exception;

    //로그인
    public User loginUser(User user)throws Exception;

    public void updateLcd(String msg)throws Exception;

    //회원정보 수정
    public void updateUser(User user)throws Exception;

    //회원 아이디 중복 확인
    public boolean checkDupId(String userId)throws Exception;

    //회원 주민등록번호 중복 확인
    public boolean checkDupRrd(String rrd)throws Exception;

    public Map<String, Object> listUser(User user)throws Exception;

    public User getUserDetail(String userId)throws Exception;

    public String getAccessToken(String code)throws Exception;

    public HashMap<String, Object> getUserInfo(String access_Token)throws Exception;
/*

    //로그아웃
    public void logout(User user)throws Exception;

    */
}
