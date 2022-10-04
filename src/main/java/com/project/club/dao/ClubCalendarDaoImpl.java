package com.project.club.dao;

import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("clubCalenderDaoImpl")
public class ClubCalendarDaoImpl implements ClubCalendarDao {

    @Autowired
    @Qualifier("sqlSessionTemplate")
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void addCalender(ClubCalendar calender) {
        sqlSession.insert("ClubCalenderMapper.addClubCalender", calender);
    }

    @Override
    public String getCalender(int clubNum) {
        return sqlSession.selectOne("ClubCalenderMapper.getClubCalenderList", clubNum);
    }

    @Override
    public void addCalenderReview(ClubCalendarReview calendeReview) {
        sqlSession.insert("ClubCalenderMapper.addCalenderReview", calendeReview);
    }
}
