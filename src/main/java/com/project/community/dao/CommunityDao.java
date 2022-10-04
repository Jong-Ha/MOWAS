package com.project.community.dao;

import com.project.domain.ClubCalendar;
import com.project.domain.Comment;
import com.project.domain.Recomment;
import com.project.domain.VilBoard;

public interface CommunityDao {
    public void addClubCalender(ClubCalendar commu)throws Exception;

    void addVillBoard(VilBoard villBoard);

    void addComment(Comment comment);
    void updateComment(Comment comment);

    void addRecomment(Recomment recomment);

    void deleteComment(Comment comment);

    void updateRecomment(Recomment recomment);

    void deleteRecomment(int recommentNum);
}
