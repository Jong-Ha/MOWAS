package com.project.community.service;

import com.project.common.Search;
import com.project.domain.ClubCalendar;
import com.project.domain.Comment;
import com.project.domain.Recomment;
import com.project.domain.VilBoard;

import java.util.List;
import java.util.Map;

public interface CommunityService {
    public void addClubCalender(ClubCalendar commu) throws Exception;

    void addVillBoard(VilBoard villBoard);

    void addComment(Comment comment);

    void updateComment(Comment comment);

    void deleteComment(Comment comment);

    void addRecomment(Recomment recomment);

    void updateRecomment(Recomment recomment);

    void deleteRecomment(int commentNum);

    Map<String, Object> listVillBoard(String villCode, Search search);

    VilBoard getVillBoard(int villBoardNum);

    Map<String, Object> listComment(int villBoardNum, int boardCategory, Search search);

    void updateViewCount(int boardNUm,int viewCount, int boardCategory);

    int getLikeCount(int villBoardNum, int boardCategory);

    void addLike(String userId, int villBoardNum, int boardCategory);

    String getLikeCheck(String userId, int villBoardNum, int boardCategory);

    void updateLike(String userId, int villBoardNum, int boardCategory, String likeCheck);

    void deleteLikeCount(int boardNum, int boardCategory, int likeCount);

    void updateLikeCount(int boardNum, int boardCategory, int likeCount);

    int getViewCount(int boardNum, int boardCategory);

    void updateVillBoard(VilBoard vilBoard);

    void deleteBoard(int boardNum, int BoardCategory);

    List<Map<String, Object>> getListDealCalender(String userId);


    void deleteAllComment(int boardNum, int boardCategory);

    void deleteAllLike(int boardNum, int boardCategory);

    Map<String, Object> allListComment(int boardNum, int boardCategory);
}
