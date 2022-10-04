package com.project.community.dao;

import com.project.domain.ClubCalendar;
import com.project.domain.Comment;
import com.project.domain.Recomment;
import com.project.domain.VilBoard;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("communityDaoImpl")
public class CommunityDaoImpl implements CommunityDao {

    @Autowired
    @Qualifier("sqlSessionTemplate")
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    };

    /*모임 일정*/
    @Override
    public void addClubCalender(ClubCalendar commu) throws Exception {
        sqlSession.insert("ClubCalenderMapper.addClubCalender", commu);
    }

    /*우리 동네 게시판*/
    @Override
    public void addVillBoard(VilBoard villBoard) {
        sqlSession.insert("CommunityMapper.addVillBoard", villBoard);
    }

    /*댓글*/
    @Override
    public void addComment(Comment comment) {
        sqlSession.insert("CommunityMapper.addComment", comment);
    }

    @Override
    public void addRecomment(Recomment recomment) {
        sqlSession.insert("CommunityMapper.addRecomment", recomment);
    }

}
