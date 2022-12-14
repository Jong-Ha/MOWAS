package com.project.club.dao;

import com.project.domain.ClubCalendar;
import com.project.domain.ClubCalendarReview;
import com.project.domain.Deal;
import com.project.domain.File;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
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
    public List<ClubCalendarReview> listCalenderReview(Map<String, Object> map) {
        return sqlSession.selectList("ClubCalenderMapper.listCalenderReview", map);
    }

    @Override
    public ClubCalendarReview getCalenderReview(int clubCalenderReviewNum) {
        return sqlSession.selectOne("ClubCalenderMapper.getCalenderReview", clubCalenderReviewNum);
    }

    @Override
    public List<ClubCalendar> getListCalender(ClubCalendar calender) {
        return sqlSession.selectList("ClubCalenderMapper.getListCalender", calender);
    }

    @Override
    public void addFileUpload(Map<String, String> map) {
        sqlSession.insert("ClubCalenderMapper.addFileUpload", map);
    }


    @Override
    public void deleteFile(int boardNum) {
        sqlSession.delete("ClubCalenderMapper.deleteFile", boardNum);
    }

    @Override
    public void updateClubCalender(ClubCalendar clubCalendar) {
        sqlSession.update("ClubCalenderMapper.updateClubCalender", clubCalendar);
    }

    @Override
    public void deleteClubCalender(int boardNum) {
        sqlSession.delete("ClubCalenderMapper.deleteClubCalender", boardNum);
    }

    @Override
    public List<ClubCalendar> getListCluberCalender(int clubCalenderNum) {
        return sqlSession.selectList("ClubCalenderMapper.getListCluberCalender", clubCalenderNum);
    }

    @Override
    public List<File> getListFile(int boardNum, int boardCategory) {

        Map<String, Object> map = new HashMap<>();

        map.put("boardNum", boardNum);
        map.put("boardCategory", boardCategory);

        System.out.println("?????? ?????? ?????? : " + map);

        return sqlSession.selectList("ClubCalenderMapper.getListFile", map);
    }

    @Override
    public void addDealCalender(Deal deal) {

        sqlSession.insert("DealMapper.addDealCalender", deal);
    }

    @Override
    public void dealUpdateCalender(Deal deal) {
        sqlSession.update("DealMapper.dealUpdateCalender", deal);
    }


    @Override
    public List<ClubCalendarReview> listClubCalendarReview(Map<String, Object> map) {
        return sqlSession.selectList("ClubCalenderMapper.listClubCalendarReview", map);
    }

    @Override
    public int getTotalClubCalendarReview(Map<String, Object> map) {
        return sqlSession.selectOne("ClubCalenderMapper.getTotalClubCalendarReview", map);
    }
}
