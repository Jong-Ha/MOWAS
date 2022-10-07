package com.project.user.dao;

import com.project.domain.User;
import com.project.domain.UserInterList;
//import com.project.domain.UserInterList;

public interface UserDao {

    public void addUser(User user)throws Exception;

    public void addInterList(UserInterList interList)throws Exception;

    public User getUser(String userId)throws Exception;

    public User checkDupRrd(String rrd)throws Exception;

    public void updateUser(User user)throws Exception;



}
