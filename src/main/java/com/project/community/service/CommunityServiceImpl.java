package com.project.community.service;

import com.project.community.dao.CommunityDao;
import com.project.domain.ClubCalendar;
import com.project.domain.Comment;
import com.project.domain.Recomment;
import com.project.domain.VilBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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

}
