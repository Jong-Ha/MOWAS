package com.project.user.dao;

import com.project.domain.User;
//import com.project.domain.UserInterList;
//import com.project.user.mail.MailApp;
import com.project.domain.UserInterList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
    @Autowired
    @Qualifier("sqlSessionTemplate")
    private SqlSession sqlSession;
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

    public UserDaoImpl() {
        System.out.println(this.getClass());
    }

    public void addUser(User user)throws Exception{
        System.out.println("여기는 DaoImpl addUser 메서드이다");
        sqlSession.insert("UserMapper.addUser", user);
    }

    public void addInterList(UserInterList interList)throws Exception{
        System.out.println("여기는 addInterList 디에이오임플 시작이다");
        sqlSession.insert("UserMapper.addInterList", interList);
        System.out.println("여기는 addInterList 디에이오임플 종료이다");
    }

    public void deleteInterList(UserInterList interList)throws Exception{
        sqlSession.delete("UserMapper.deleteInterList", interList);
    }

    public User getUser(String userId)throws Exception{
        return sqlSession.selectOne("UserMapper.getUser", userId);
    }

    public void updateLcd(String msg)throws Exception{
        sqlSession.selectOne("UserMapper.updateLcd", msg);
    }

    public void updateUser(User user)throws Exception{
        sqlSession.update("UserMapper.updateUser", user);
    }

    public User checkDupRrd(String rrd)throws Exception{
        return sqlSession.selectOne("UserMapper.checkDupRrd", rrd);
    }

    public List<User> listUser(User user)throws Exception{
       return sqlSession.selectList("UserMapper.listUser", user);
    }

    public User getUserDetail(String userId)throws Exception{
        return sqlSession.selectOne("UserMapper.getUserDetail", userId);
    }


}
