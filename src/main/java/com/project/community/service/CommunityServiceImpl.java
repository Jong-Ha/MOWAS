package com.project.community.service;

import com.project.community.dao.CommunityDao;
import com.project.domain.ClubCalendar;
import com.project.domain.Comment;
import com.project.domain.Recomment;
import com.project.domain.VilBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    @Qualifier("communityDaoImpl")
    private CommunityDao commuDao;

    @Override
    public void addClubCalender(ClubCalendar commu) throws Exception {
        commuDao.addClubCalender(commu);
    }

    @Override
    public void addVillBoard(VilBoard villBoard) {
        commuDao.addVillBoard(villBoard);
    }

    @Override
    public void addComment(Comment comment) {
        commuDao.addComment(comment);
    }

    @Override
    public void updateComment(Comment comment) {
        commuDao.updateComment(comment);
    }

    @Override
    public void deleteComment(Comment comment) {
        commuDao.deleteComment(comment);
    }

    @Override
    public void addRecomment(Recomment recomment) {
        commuDao.addRecomment(recomment);
    }

    @Override
    public void updateRecomment(Recomment recomment) {
        commuDao.updateRecomment(recomment);
    }

    @Override
    public void deleteRecomment(int recommentNum) {
        commuDao.deleteRecomment(recommentNum);
    }


    @Override
    public Map<String, Object> listVillBoard(String villCode) {
        List<VilBoard> list = commuDao.listVillBoard(villCode);

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("list", list);

        return map;
    }

    @Override
    public VilBoard getVillBoard(int villBoardNum) {
        return commuDao.getVillBoard(villBoardNum);
    }

    @Override
    public Map<String, Object> listComment(int villBoardNum, int boardCategory) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("boardNum", villBoardNum);
        map.put("boardCategory", boardCategory);

        List<Comment> list = commuDao.listComment(map);

        for (Comment comment : list) {
            comment.setRecommentList(commuDao.listRecomment(comment.getCommentNum()));
        }

        map.put("list", list);

        return map;
    }

    @Override
    public void updateViewCount(int boardNun,int viewCount,int boardCategory) {
        Map<String,Object>map = new HashMap<String,Object>();
        map.put("boardNum", boardNun);
        map.put("viewCount", viewCount);
        map.put("boardCategory", boardCategory);

        commuDao.updateViewCount(map);
    }


    @Override
    public int getLikeCount(int boardNum, int boardCategory) {
        Map<String,Object>map = new HashMap<String,Object>();
        map.put("boardNum", boardNum);
        map.put("boardCategory", boardCategory);

        return commuDao.getLikeCount(map);
    }

    @Override
    public void addLike(String userId, int boardNum, int boardCategory) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("userId", userId);
        map.put("boardNum", boardNum);
        map.put("boardCategory", boardCategory);
        map.put("likeCheck", "y");

        commuDao.addLike(map);
    }

    @Override
    public String getLikeCheck(String userId, int boardNum, int boardCategory) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("userId", userId);
        map.put("boardNum", boardNum);
        map.put("boardCategory", boardCategory);

        return commuDao.getLikeCheck(map);
    }

    @Override
    public void updateLike(String userId, int boarddNum, int boardCategory, String likeCheck) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("userId", userId);
        map.put("boardNum", boarddNum);
        map.put("boardCategory", boardCategory);
        map.put("likeCheck", likeCheck);

        commuDao.updateLike(map);
    }

    @Override
    public void deleteLikeCount(int boardNnm, int boardCategory, int likeCount) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("boardNum", boardNnm);
        map.put("boardCategory", boardCategory);
        map.put("likeCount", likeCount);

        commuDao.deleteLikeCount(map);
    }

    @Override
    public void updateLikeCount(int boardNum, int boardCategory, int likeCount) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("boardNum", boardNum);
        map.put("boardCategory", boardCategory);
        map.put("likeCount", likeCount);

        commuDao.updateLikeCount(map);
    }

    @Override
    public int getViewCount(int boardNum, int boardCategory) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardNum", boardNum);
        map.put("boardCategory", boardCategory);
        return commuDao.getViewCount(map);
    }

    @Override
    public void updateVillBoard(VilBoard vilBoard) {
        commuDao.updateVillBoard(vilBoard);
    }

    @Override
    public void deleteBoard(int boardNum, int boardCategory) {
        Map<String,Object>map = new HashMap<String,Object>();
        map.put("boardNum", boardNum);
        map.put("boardCategory", boardCategory);
        commuDao.deleteBoard(map);
    }


}
