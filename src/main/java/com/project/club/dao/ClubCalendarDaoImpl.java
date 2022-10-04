package com.project.club.dao;

import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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
    public void addCalenderReview(ClubCalendarReview calenderReview) {
        sqlSession.insert("ClubCalenderMapper.addCalenderReview", calenderReview);
    }

    @Override
    public void addCalenderReviewShort(ClubCalendarReview calenderReview) {
        sqlSession.insert("ClubCalenderMapper.addCalenderReviewShort", calenderReview);
    }

    @Override
    public void updateCalenderReview(ClubCalendarReview calenderReview) {
        sqlSession.update("ClubCalenderMapper.updateCalenderReview", calenderReview);
    }

    @Override
    public void updateCalenderReviewShort(ClubCalendarReview calenderReview) {
        sqlSession.update("ClubCalenderMapper.updateCalenderReviewShort",calenderReview);
    }

    @Override
    public void deleteCalenderReview(int calenderNum) {
        sqlSession.delete("ClubCalenderMapper.deleteCalenderReview", calenderNum);
    }

    @Override
    public List<ClubCalendarReview> listCalenderReview(int boardCategory) {
        return sqlSession.selectList("ClubCalenderMapper.listCalenderReview", boardCategory);
    }
}
