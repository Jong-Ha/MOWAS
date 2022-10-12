package com.project.club.dao;

import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    public ClubCalendar getCalender(int clubCalenderNum) {
        return sqlSession.selectOne("ClubCalenderMapper.getClubCalender", clubCalenderNum);
    }

    @Override
    public void addCalenderReview(ClubCalendarReview calenderReview) {
        sqlSession.insert("ClubCalenderMapper.addCalenderReview", calenderReview);
    }


    @Override
    public void updateCalenderReview(ClubCalendarReview calenderReview) {
        sqlSession.update("ClubCalenderMapper.updateCalenderReview", calenderReview);
    }

    @Override
    public void deleteCalenderReview(int calenderNum) {
        sqlSession.delete("ClubCalenderMapper.deleteCalenderReview", calenderNum);
    }

    @Override
    public List<ClubCalendarReview> listCalenderReview(int boardCategory) {
        return sqlSession.selectList("ClubCalenderMapper.listCalenderReview", boardCategory);
    }

    @Override
    public ClubCalendarReview getCalenderReview(int clubCalenderReviewNum) {
        return sqlSession.selectOne("ClubCalenderMapper.getCalenderReview", clubCalenderReviewNum);
    }

    @Override
    public List<ClubCalendar> getListCalender(ClubCalendar calender) {
        return sqlSession.selectList("ClubCalenderMapper.getListCalender", calender);
    }

}
