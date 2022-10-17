package com.project.user.dao;

import com.project.domain.User;
import com.project.domain.UserInterList;

import java.util.List;
//import com.project.domain.UserInterList;

public interface UserDao {

    public void addUser(User user)throws Exception;

    public void addInterList(UserInterList interList)throws Exception;

    public void deleteInterList(UserInterList interList)throws Exception;

    public User getUser(String userId)throws Exception;

    public User getUserEmail(String email)throws Exception;

    public User getUser2(String email)throws Exception;

    public void updateLcd(String msg)throws Exception;

    public User checkDupRrd(String rrd)throws Exception;

    public void updateUser(User user)throws Exception;

    public void updatePsd(User user)throws Exception;

    public void updateUserStatus(String userId)throws Exception;

    public void updatePed(User user)throws Exception;

    public List<User> listUser(User user)throws Exception;

    public User getUserDetail(String userId)throws Exception;

    public List<UserInterList> listInterList(String userId)throws Exception;

    public void addNaverUser(User user)throws Exception;



}
