package com.project.user.dao;

import com.project.domain.User;
import com.project.domain.UserInterList;

public interface UserDao {

    public void addUser(User user)throws Exception;

    public void addInterList(UserInterList userInterListNum)throws Exception;

    public User getUser(String userId)throws Exception;

    public void updateUser(User user)throws Exception;

    public void sendEmail(String email)throws Exception;

}
