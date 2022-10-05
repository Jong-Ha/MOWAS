package com.project.user.dao;

import com.project.domain.User;
//import com.project.domain.UserInterList;
//import com.project.user.mail.MailApp;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
    @Autowired
    @Qualifier("sqlSessionTemplate")
    private SqlSession sqlSession;
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
  //  private MailApp mailApp;
  // public void setMailApp(MailApp mailApp){
  //      this.mailApp = mailApp;
  //  }
//
    public UserDaoImpl() {
        System.out.println(this.getClass());
    }

    public void addUser(User user)throws Exception{
        sqlSession.insert("UserMapper.addUser", user);
    }

 //   public void addInterList(UserInterList userInterListNum)throws Exception{
  //      sqlSession.insert("UserMapper.addInterList", userInterListNum);
  //  }

    public User getUser(String userId)throws Exception{
        return sqlSession.selectOne("UserMapper.getUser", userId);
    }

    public void updateUser(User user)throws Exception{
        sqlSession.update("UserMapper.updateUser", user);
    }

    public void sendEmail(String email)throws Exception{
     //   MailApp mailApp1 = mailApp;
    }
}
