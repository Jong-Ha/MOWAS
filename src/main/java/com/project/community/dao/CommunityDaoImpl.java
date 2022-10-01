package com.project.community.dao;

import com.project.domain.ClubCalendar;
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

    @Override
    public void addClubCalender(ClubCalendar commu) throws Exception {
        sqlSession.insert("ClubCalenderMapper.addClubCalender", commu);
    }

}
