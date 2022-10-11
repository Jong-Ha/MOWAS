package com.project.user.service;

import com.project.domain.User;
//import com.project.domain.UserInterList;
import com.project.domain.UserInterList;
import com.project.user.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
        userDao.addInterList(interList);
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




}
