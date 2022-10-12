package com.project.user.service;

import com.project.domain.User;
import com.project.domain.UserInterList;

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

    //회원정보 수정
    public void updateUser(User user)throws Exception;

    //회원 아이디 중복 확인
    public boolean checkDupId(String userId)throws Exception;

    //회원 주민등록번호 중복 확인
    public boolean checkDupRrd(String rrd)throws Exception;

    public Map<String, Object> listUser(User user)throws Exception;

    public User getUserDetail(String userId)throws Exception;

/*
    //회원목록 조회
    public List<User> listUser(Search search)throws Exception;



    //회원 주민등록번호 중복 확인
    public boolean checkDupRrd(String rrd)throws Exception;

    //휴대폰번호 인증코드 전송
    public void sendPhone(String phone)throws Exception;
    //로그아웃
    public void logout(User user)throws Exception;

    */
}
