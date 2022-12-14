package com.project.community.dao;

import com.project.domain.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("communityDaoImpl")
public class CommunityDaoImpl implements CommunityDao {

    @Autowired
    @Qualifier("sqlSessionTemplate")
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    ;

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
    public void updateComment(Comment comment) {
        sqlSession.update("CommunityMapper.updateComment", comment);
    }

    @Override
    public void deleteComment(Comment comment) {
        sqlSession.update("CommunityMapper.deleteComment", comment);
    }


    @Override
    public void addRecomment(Recomment recomment) {
        sqlSession.insert("CommunityMapper.addRecomment", recomment);
    }

    @Override
    public void updateRecomment(Recomment recomment) {
        sqlSession.update("CommunityMapper.updateRecomment", recomment);
    }

    @Override
    public void deleteRecomment(int commentNum) {
        sqlSession.delete("CommunityMapper.deleteRecomment", commentNum);
    }

    @Override
    public List<Comment> listComment(Map<String, Object> map) {
        return sqlSession.selectList("CommunityMapper.listComment", map);
    }

    @Override
    public List<Recomment> listRecomment(int commentNo) {
        return sqlSession.selectList("CommunityMapper.listRecomment", commentNo);
    }

    @Override
    public List<VilBoard> listVillBoard(Map<String,Object> map) {
        return sqlSession.selectList("CommunityMapper.listVillBoard", map);
    }

    @Override
    public VilBoard getVillBoard(int villBoardNum) {
        return sqlSession.selectOne("CommunityMapper.getVillBoard", villBoardNum);
    }

    @Override
    public void updateViewCount(Map<String,Object> map) {
        sqlSession.update("CommunityMapper.updateViewCount", map);
    }


    @Override
    public int getLikeCount(Map<String,Object>map) {
        return sqlSession.selectOne("CommunityMapper.getLikeCount", map);
    }

    @Override
    public void addLike(Map<String, Object> map) {
        sqlSession.insert("CommunityMapper.addLike", map);
    }

    @Override
    public String getLikeCheck(Map<String, Object> map) {
        return sqlSession.selectOne("CommunityMapper.checkLike", map);
    }

    @Override
    public void updateLike(Map<String, Object> map) {
        sqlSession.update("CommunityMapper.updateLike", map);
    }

    @Override
    public void deleteLikeCount(Map<String, Object> map) {
        sqlSession.update("CommunityMapper.deleteLikeCount", map);
    }

    @Override
    public void updateLikeCount(Map<String, Object> map) {
        sqlSession.update("CommunityMapper.updateLikeCount", map);
    }

    @Override
    public int getViewCount(Map<String, Object> map) {
        return sqlSession.selectOne("CommunityMapper.getViewCount", map);
    }

    @Override
    public void updateVillBoard(VilBoard villBoard) {
        sqlSession.update("CommunityMapper.updateVillBoard",villBoard);
    }

    @Override
    public void deleteBoard(Map<String, Object> map) {
        sqlSession.delete("CommunityMapper.deleteBoard", map);
    }

    @Override
    public List<Deal> getListDealCalender(String userId) {
        return sqlSession.selectList("DealMapper.getListDealCalender", userId);
    }

    @Override
    public void deleteAllComment(Map<String, Object> map) {
        sqlSession.delete("CommunityMapper.deleteAllComment", map);
    }

    @Override
    public void deleteAllLike(Map<String, Object> map) {
        sqlSession.delete("CommunityMapper.deleteAllLike", map);
    }

    @Override
    public List<Comment> allListComment(Map<String, Object> map) {
        return sqlSession.selectList("CommunityMapper.allListComment", map);
    }


}
