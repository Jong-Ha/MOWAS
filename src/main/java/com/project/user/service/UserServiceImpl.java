package com.project.user.service;

import com.project.domain.User;
//import com.project.domain.UserInterList;
import com.project.user.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
 //   public void addInterList(UserInterList userInterListNum)throws Exception{
 //       userDao.addInterList(userInterListNum);
  //  }

    public User getUser(String userId)throws Exception{
        return userDao.getUser(userId);
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

    public void sendEmail(String email)throws Exception{
        userDao.sendEmail(email);
    }


}
