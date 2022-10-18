package com.project.myPage.dao;

import com.project.domain.ClubMasterBoard;
import com.project.domain.User;
import com.project.domain.UserInterList;
import com.project.domain.VilBoard;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("myPageDaoImpl")
public class MyPageDaoImpl implements MyPageDao{

    @Autowired
    @Qualifier("sqlSessionTemplate")
    private SqlSession sqlSession;
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }

    public MyPageDaoImpl() {
        System.out.println(this.getClass());
    }

    public User getMyPage(String userId)throws Exception{
        return sqlSession.selectOne("MyPageMapper.getMyPage",userId);
    }

    public User getMyInfor(String userId)throws Exception{
        return sqlSession.selectOne("MyPageMapper.getMyInfor",userId);
    }

    public List<UserInterList> getMyInforInterList(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyInforInterList",userId);
    }

    public List<VilBoard> getMyVillBoard(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyVillBoard", userId);
    }

    public List<ClubMasterBoard> getMyClubBoard(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyClubBoard", userId);
    }
}
