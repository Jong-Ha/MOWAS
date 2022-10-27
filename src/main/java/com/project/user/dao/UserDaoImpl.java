package com.project.user.dao;

import com.project.domain.User;
//import com.project.domain.UserInterList;
//import com.project.user.mail.MailApp;
import com.project.domain.UserInterList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
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

    public void updateSNSUserInfor(User user)throws Exception{
        System.out.println("업데이트 SNS 디에이오임플 user"+user);
        sqlSession.update("UserMapper.updateSNSUserInfor", user);
    }

    public void deleteInterList(UserInterList interList)throws Exception{
        sqlSession.delete("UserMapper.deleteInterList", interList);
    }

    public User getUser(String userId)throws Exception{
        return sqlSession.selectOne("UserMapper.getUser", userId);
    }

    public User getUserEmail(String email)throws Exception{
        System.out.println("유저Dao임플 이멜값 :"+email);
         return sqlSession.selectOne("UserMapper.getUserEmail", email);
    }

    public User getUser2(String email)throws Exception{
        return sqlSession.selectOne("UserMapper.getUser2", email);
    }

    public User getMyId(User user)throws Exception{
       if(user.getEmail()!="" || user.getPhone().equals("") ) {
            return sqlSession.selectOne("UserMapper.getMyIdEmail", user);
        } else if(user.getPhone()!=null || user.getEmail()==null) {
            return sqlSession.selectOne("UserMapper.getMyIdPhone", user);
        }else {
            return null;
        }
    }

    public User getMyPassword(User user)throws Exception{
        if(user.getEmail()!="" || user.getPhone().equals("") ) {
            return sqlSession.selectOne("UserMapper.getMyPasswordEmail", user);
        } else if(user.getPhone()!=null || user.getEmail()==null ) {
            return sqlSession.selectOne("UserMapper.getMyPasswordPhone", user);
        }else {
            return null;
        }
    }

    public void addKakaoUser(User userInfo) {
        sqlSession.insert("UserMapper.addKakaoUser",userInfo);
    }

    // 정보 확인
    public User getUserEmailKakao(User userInfo) {

        System.out.println("RN:"+userInfo.getUserId());
        System.out.println("RN:"+userInfo.getEmail());
        System.out.println("RE:"+userInfo.getUserImage());
        System.out.println("RE:"+userInfo.getGender());
        System.out.println("RE:"+userInfo.getLoginType());
        return sqlSession.selectOne("UserMapper.getUserEmailKakao", userInfo);
    }

    public void updateLcd(String msg)throws Exception{
        sqlSession.selectOne("UserMapper.updateLcd", msg);
    }

    public void updateUser(User user)throws Exception{
        sqlSession.update("UserMapper.updateUser", user);
        sqlSession.update("UserMapper.updateClubUser", user);
        sqlSession.update("UserMapper.updateClubCalendarApply", user);
    }

    public void updatePsd(User user)throws Exception{
        System.out.println("유저Dao임플 userId값1"+user.getUserId());
        sqlSession.update("UserMapper.updatePsd", user);
        System.out.println("유저Dao임플 userId값2"+user.getUserId());
    }

    public void updatePed(User user)throws Exception{
        sqlSession.update("UserMapper.updatePed", user);
    }
    public void updateKakaoUser(User user)throws Exception{
        sqlSession.selectOne("UserMapper.updateKakaoUser", user);
    }

    public void updateNaverUser(User user)throws Exception{
        sqlSession.selectOne("UserMapper.updateNaverUser", user);
    }

    public void updateUserStatus(String userId)throws Exception{
        sqlSession.update("UserMapper.updateUserStatus", userId);
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

    public List<UserInterList> listInterList(String userId)throws Exception{

        List<UserInterList> sampleCode =  sqlSession.selectList("UserMapper.listInterList", userId);
        System.out.println("sampleCode의 값은? "+sampleCode);
        return sampleCode;
    }

    public void addNaverUser(User user)throws Exception{
        sqlSession.insert("UserMapper.addNaverUser", user);
    }

}
