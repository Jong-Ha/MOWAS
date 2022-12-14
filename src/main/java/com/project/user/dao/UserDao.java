package com.project.user.dao;

import com.project.common.Search;
import com.project.domain.User;
import com.project.domain.UserInterList;

import java.util.HashMap;
import java.util.List;
//import com.project.domain.UserInterList;

public interface UserDao {

    public void addUser(User user)throws Exception;

    public void addInterList(UserInterList interList)throws Exception;

    public void updateSNSUserInfor(User user)throws Exception;

    public void deleteInterList(UserInterList interList)throws Exception;

    public User getUser(String userId)throws Exception;

    public User getUserEmail(String email)throws Exception;

    public User getUser2(String email)throws Exception;

    public User getMyId(User user)throws Exception;

    public User getMyPassword(User user) throws Exception;

    public void addKakaoUser(User userInfo)throws Exception;

    public User getUserEmailKakao(User userInfo)throws Exception;

    public void updateLcd(String msg)throws Exception;

    public User checkDupRrd(String rrd)throws Exception;

    public void updateUser(User user)throws Exception;

    public void updatePsd(User user)throws Exception;

    public void updateKakaoUser(User user)throws Exception;

    public void updateNaverUser(User user)throws Exception;

    public void updateUserStatus(String userId)throws Exception;

    public void updatePed(User user)throws Exception;

    public List<User> listUsers(Search search)throws Exception;

    public int getTotalCount(Search search)throws Exception;

    public User getUserDetail(String userId)throws Exception;

    public List<UserInterList> listInterList(String userId)throws Exception;

    public void addNaverUser(User user)throws Exception;

    public void userOut(String userId)throws Exception;

}
