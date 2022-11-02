package com.project.myPage.dao;

import com.project.common.Search;
import com.project.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    public List<ClubCalendarReview> getMyClubCalendarReview(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyClubCalendarReview", userId);
    }

    public List<Deal> getMydealBoard(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMydealBoard", userId);
    }

    public List<Comment> getMyComment(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyComment", userId);
    }

    public List<Recomment> getMyRecomment(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyRecomment", userId);
    }
/////////////////
    public List<VilBoard> getMyvillBoardLike(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyvillBoardLike", userId);
    }

    public List<ClubCalendarReview> getMyclubCalendarReviewLike(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyclubCalendarReviewLike", userId);
    }

    public List<Deal> getMydealBoardLike(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMydealBoardLike", userId);
    }

    public Club getMyClub(Map<String, Object> map)throws Exception{
        return sqlSession.selectOne("MyPageMapper.getMyClub", map);
    }

    @Override
    public List<Cluber> getMyCluber(Map<String, Object> map) throws Exception {
        return sqlSession.selectList("MyPageMapper.getMyCluber", map);
    }

    @Override
    public int getTotalMyCluber(Map<String, Object> map) throws Exception {
        return sqlSession.selectOne("MyPageMapper.getTotalMyCluber", map);
    }

    public List<Deal> getMyDeal(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyDeal", userId);
    }

    public List<CommunityReport> getMyReport(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyReport", userId);
    }

    public int getTotalCount(Search search)throws Exception{
        return sqlSession.selectOne("MyPageMapper.getTotalCount", search);
    }

    public int getTotalCmt(Search search)throws Exception{
        return sqlSession.selectOne("MyPageMapper.getTotalCmt", search);
    }

    public List<CommunityReport> getMyPpt(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyPpt", userId);
    }

    @Override
    public List<String> listDealBoardFile(int dealBoardNum) {
        return sqlSession.selectList("DealMapper.listDealBoardFile", dealBoardNum);
    }



}
