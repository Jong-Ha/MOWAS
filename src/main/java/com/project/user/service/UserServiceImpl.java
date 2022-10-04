package com.project.user.service;

import com.project.domain.User;
import org.springframework.stereotype.Service;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService{
    public void addUser(User user)throws Exception{

    };

    public User getUser(String userId)throws Exception{
    return null;
    };

    //public List<User> getUserList(Search search)throws Exception{


    public void updateUser(User user)throws Exception{

    };

    public boolean checkDuplication(String userId)throws Exception{
        return false;
    };

    public boolean checkDupRrd(String rrd)throws Exception{
        return false;
    };

    public void sendEmail(String email)throws Exception{

    };

    public void sendPhone(String phone)throws Exception{

    };

    public void logout(User user)throws Exception{

    };
}
