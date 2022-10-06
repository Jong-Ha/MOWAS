package com.project.community.dao;

import com.project.domain.ClubCalendar;
import com.project.domain.Comment;
import com.project.domain.Recomment;
import com.project.domain.VilBoard;

import java.util.List;
import java.util.Map;

public interface CommunityDao {
    public void addClubCalender(ClubCalendar commu) throws Exception;

    void addVillBoard(VilBoard villBoard);

    void addComment(Comment comment);

    void updateComment(Comment comment);

    void addRecomment(Recomment recomment);

    void deleteComment(Comment comment);

    void updateRecomment(Recomment recomment);

    void deleteRecomment(int recommentNum);

    List<Comment> listComment(Map<String, Object> map);

    List<Recomment> listRecomment(int commentNo);

    List<VilBoard> listVillBoard(String villCode);

    VilBoard getVillBoard(int villBoardNum);


    void updateViewCount(Map<String,Object> map);


    int getLikeCount(Map<String,Object>map);

    void addLike(Map<String, Object> map);

    String getLikeCheck(Map<String, Object> map);

    void updateLike(Map<String, Object> map);

    void deleteLikeCount(Map<String, Object> map);

    void updateLikeCount(Map<String, Object> map);

    int getViewCount(Map<String, Object> map);

    void updateVillBoard(VilBoard vilBoard);

    void deleteBoard(Map<String, Object> map);
}
