package com.project.community.service;

import com.project.club.dao.ClubCalendarDao;
import com.project.common.Search;
import com.project.community.dao.CommunityDao;
import com.project.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    @Qualifier("communityDaoImpl")
    private CommunityDao commuDao;

    @Autowired
    @Qualifier("clubCalenderDaoImpl")
    private ClubCalendarDao clubCalendarDao;

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
    public void deleteRecomment(int commentNum) {
        commuDao.deleteRecomment(commentNum);
    }


    @Override
    public Map<String, Object> listVillBoard(String villCode, Search search) {
        Map<String, Object> map2 = new HashMap<>();
        map2.put("villCode", villCode);
        map2.put("search", search);


        List<VilBoard> list = commuDao.listVillBoard(map2);

        Map<String, Object> map = new HashMap<String, Object>();

        int i = 0;
        for (VilBoard villBoard : list){

            villBoard.setFile(clubCalendarDao.getListFile(list.get(i).getVillBoardNum(),
                    list.get(i).getBoardCategory()));

            System.out.println("/n 우동 넘버의 정보 " + list.get(i).getVillBoardNum());
            i += 1;
        }

        map.put("list", list);

        return map;
    }

    @Override
    public VilBoard getVillBoard(int villBoardNum) {
        VilBoard villBoard = new VilBoard();

        villBoard = commuDao.getVillBoard(villBoardNum);

        villBoard.setFile(clubCalendarDao.getListFile(villBoard.getVillBoardNum(),
                villBoard.getBoardCategory()));

        return villBoard;
    }

    @Override
    public Map<String, Object> listComment(int villBoardNum, int boardCategory, Search search) {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("boardNum", villBoardNum);
        map.put("boardCategory", boardCategory);
        map.put("search", search);

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

    @Override
    public List<Map<String, Object>> getListDealCalender(String userId) {

        List<Deal> list = commuDao.getListDealCalender(userId);

        Map<String, Object> map = null;

        List<Map<String,Object>> list2 = new ArrayList<>();

        for (int i = 0; i < list.size(); i++) {
            map = new HashMap<>();

            map.put("id" , list.get(i).getDealBoardNum());
            map.put("start", list.get(i).getDealDate());
            map.put("title", list.get(i).getDealCalenderTitle());
            map.put("allDay", "ture");
            map.put("color", "purple");
            map.put("groupId", "2");

            list2.add(map);

        }

        return list2;
    }


    @Override
    public void deleteAllComment(int boardNum, int boardCategory) {
        Map<String,Object>map = new HashMap<>();

        map.put("boardNum", boardNum);
        map.put("boardCategory", boardCategory);

        commuDao.deleteAllComment(map);
    }

    @Override
    public void deleteAllLike(int boardNum, int boardCategory) {
        Map<String,Object> map = new HashMap<>();

        map.put("boardNum",boardNum);
        map.put("boardCategory", boardCategory);

        commuDao.deleteAllLike(map);

    }

    @Override
    public Map<String, Object> allListComment(int boardNum, int boardCategory) {
        Map<String, Object>map = new HashMap<>();

        map.put("boardNum", boardNum);
        map.put("boardCategory", boardCategory);

        List<Comment> list = commuDao.allListComment(map);

        for (Comment comment : list) {
            comment.setRecommentList(commuDao.listRecomment(comment.getCommentNum()));
        }

        map.put("list", list);

        return map;



    }


}
