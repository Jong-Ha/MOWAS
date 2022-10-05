package com.project.community.service;

import com.project.domain.ClubCalendar;
import com.project.domain.Comment;
import com.project.domain.Recomment;
import com.project.domain.VilBoard;

import java.util.Map;

public interface CommunityService {
    public void addClubCalender(ClubCalendar commu) throws  Exception;

    void addVillBoard(VilBoard villBoard);

    void addComment(Comment comment);


    void updateComment(Comment comment);

    void deleteComment(Comment comment);
    void addRecomment(Recomment recomment);
    void updateRecomment(Recomment recomment);

    void deleteRecomment(int recommentNum);

    Map<String, Object> listVillBoard(String villCode);

    VilBoard getVillBoard(int villBoardNum);

    Map<String, Object> listComment(int villBoardNum, int boardCategory);

    void updateViewCount(VilBoard villBoard);

    int getViewCount(int villBoardNum);
}
