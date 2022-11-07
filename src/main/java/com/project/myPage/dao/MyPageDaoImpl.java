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

    public List<VilBoard> getMyVillBoard(Map<String,Object>map)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyVillBoard", map);
    }

    public List<ClubMasterBoard> getMyClubBoard(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyClubBoard", userId);
    }

    public List<ClubCalendarReview> getMyClubCalendarReview(Map<String,Object> map)throws Exception{
        System.out.println("================================" + map.get("userId"));



        return sqlSession.selectList("MyPageMapper.getMyClubCalendarReview", map);
    }

    public List<Deal> getMydealBoard(String userId)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMydealBoard", userId);
    }

    public List<Comment> getMyComment(Map<String,Object> map)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyComment", map);
    }

    public List<Recomment> getMyRecomment(Map<String,Object> map)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyRecommentlist", map);
    }
/////////////////
    public List<VilBoard> getMyvillBoardLike(Map<String,Object>map)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyVillBoardLike", map);
    }

    public List<ClubCalendarReview> getMyclubCalendarReviewLike(Map<String,Object>map)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMyclubCalendarReviewLike", map);
    }

    public List<Deal> getMydealBoardLike(Map<String,Object> map)throws Exception{
        return sqlSession.selectList("MyPageMapper.getMydealBoardLike", map);
    }

    public Club getMyClub(Map<String, Object> map)throws Exception{
        return sqlSession.selectOne("MyPageMapper.getMyClub", map);
    }

    @Override
    public List<Cluber> getMyCluber(Map<String, Object> map) throws Exception {
        return sqlSession.selectList("MyPageMapper.getMyCluber", map);
    }

    @Override
    public int getTotalMyClubLike(Map<String, Object> map) throws Exception {
        return sqlSession.selectOne("MyPageMapper.getTotalMyClubLike", map);
    }

    @Override
    public List<Club> getMyClubLike(Map<String, Object> map) throws Exception {
        return sqlSession.selectList("MyPageMapper.getMyClubLike", map);
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

    @Override
    public int clubCalenderTitle(Map<String, Object> map) {
        return sqlSession.selectOne("MyPageMapper.getClubCalenderReviewTotal", map);
    }

    @Override
    public int getTotalComment(Map<String, Object> map) {
        return sqlSession.selectOne("MyPageMapper.getMyCommentTotal", map);
    }

    @Override
    public int getTotalRecomment(Map<String, Object> map) {
        return sqlSession.selectOne("MyPageMapper.getMyRecommentTotal", map);
    }

    @Override
    public int getTotalVillBoard(Map<String, Object> map) {
        return sqlSession.selectOne("MyPageMapper.getMyVillBoardTotal", map);
    }

    @Override
    public int getTotalClubCalender(Map<String, Object> map) {
        return sqlSession.selectOne("MyPageMapper.getMyclubCalendarReviewLikeTotal",map);
    }

    @Override
    public List<Comment> getMyCommentLike(Map<String, Object> map) {
        return sqlSession.selectList("MyPageMapper.getMyCommentLike",map);
    }

    @Override
    public int getTotalLikeComment(Map<String, Object> map) {
        return sqlSession.selectOne("MyPageMapper.getMyCommentLikeTotal", map);
    }

    @Override
    public List<Recomment> getMyRecommentList(Map<String, Object> map) {
        return sqlSession.selectList("MyPageMapper.getMyRecommentlist", map);
    }

    @Override
    public List<Recomment> getMyLikeRecommentlist(Map<String, Object> map) {
        return sqlSession.selectList("MyPageMapper.getMyRecommentLike", map);
    }

    @Override
    public int getTotalLikeRecomment(Map<String, Object> map) {
        return sqlSession.selectOne("MyPageMapper.getMyRecommentLikeTotal", map);
    }

    @Override
    public int getTotalDealBoardTotal(Map<String, Object> map) {
        return sqlSession.selectOne("MyPageMapper.getMydealBoardLikeTotal", map);
    }


}
