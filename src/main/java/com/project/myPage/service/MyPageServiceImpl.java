package com.project.myPage.service;

import com.project.common.Search;
import com.project.domain.*;
import com.project.myPage.dao.MyPageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service ("myPageServiceImpl")
public class MyPageServiceImpl implements MyPageService {

    @Autowired
    @Qualifier("myPageDaoImpl")
    private MyPageDao myPageDao;
    public void setMyPageDao(MyPageDao myPageDao){
        this.myPageDao = myPageDao;
    }
    public MyPageServiceImpl() {
        System.out.println(this.getClass());
    }

    public User getMyPage(String userId)throws Exception{
        return myPageDao.getMyPage(userId);
    }

    public Map<String, Object> getMyInfor(String userId)throws Exception {
//////////////관심목록 한글로 변환 해야 함//////////////////
        Map<String, Object> map = new HashMap<String, Object>();
        User user = myPageDao.getMyInfor(userId);
        List<UserInterList> inList = myPageDao.getMyInforInterList(userId);

        map.put("interList", inList);
        map.put("user", user);

        return map;
    }

    public Map<String, Object> getMyBoard(String userId, Search search)throws Exception{

        System.out.println("getMyBoard 서비스임플 시작이다 ");
        Map<String, Object> map = new HashMap<String, Object>();

        List<VilBoard> villBoard = myPageDao.getMyVillBoard(userId);

        List<ClubMasterBoard> clubBoard = myPageDao.getMyClubBoard(userId);


        Map<String,Object> map2 = new HashMap<>();

        map2.put("userId", userId);
        map2.put("search", search);
        List<ClubCalendarReview> clubCalendarReview = myPageDao.getMyClubCalendarReview(map2);

        List<Deal> dealBoard = myPageDao.getMydealBoard(userId);

        System.out.println("villBoard 값??"+villBoard);
        System.out.println("clubBoard 값??"+clubBoard);
        System.out.println("clubCalendarReview 값??"+clubCalendarReview);
        System.out.println("dealBoard 값??"+dealBoard);

        map.put("myVillBoard", villBoard);
        map.put("myclubBoard", clubBoard);
        map.put("clubCalendarReview", clubCalendarReview);
        map.put("dealBoard", dealBoard);

        System.out.println("getMyBoard 서비스임플 종료이다 ");
        return map;
    }

    public Map<String, Object> getMyComment(String userId)throws Exception{
        System.out.println("getMyComment 서비스임플 시작이다 ");
        Map<String, Object> map = new HashMap<String, Object>();
        List<Comment> comment = myPageDao.getMyComment(userId);
        List<Recomment> recomment = myPageDao.getMyRecomment(userId);

        System.out.println("comment 값??"+comment);
        System.out.println("Recomment 값??"+recomment);

        map.put("myComment", comment);
        map.put("myRecomment", recomment);

        System.out.println("getMyComment 서비스임플 종료이다 ");
        return map;
    }

    public Map<String, Object> getMyLike(String userId)throws Exception{
        System.out.println("getMyLike 서비스임플 시작이다 ");
        Map<String, Object> map = new HashMap<String, Object>();
        List<VilBoard> villBoardLike = myPageDao.getMyvillBoardLike(userId);
        List<ClubCalendarReview> clubCalendarReviewLike = myPageDao.getMyclubCalendarReviewLike(userId);
        List<Deal> dealBoardLike = myPageDao.getMydealBoardLike(userId);

        System.out.println("villBoardLike 값??"+villBoardLike);
        System.out.println("clubCalendarReviewLike 값??"+clubCalendarReviewLike);
        System.out.println("dealBoardLike 값??"+dealBoardLike);

        map.put("villBoardLike", villBoardLike);
        map.put("clubCalendarReviewLike", clubCalendarReviewLike);
        map.put("dealBoardLike", dealBoardLike);

        System.out.println("getMyLike 서비스임플 종료이다 ");
        return map;
    }

    public Map<String, Object> getMyClub(String applyCheck, String userId, Search search)throws Exception{
        System.out.println("getMyClub 서비스임플 시작이다 ");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("applyCheck",applyCheck);
        map.put("userId",userId);
        map.put("search",search);
        List<Cluber> getMyClub = myPageDao.getMyCluber(map);
        int totalCount = myPageDao.getTotalMyCluber(map);

        System.out.println("getMyClub 값??"+getMyClub);

        List<Map<String ,Object>> list = new ArrayList<>();

        for(Cluber cluber : getMyClub){
            map.put("cluber",cluber);
            Club club = myPageDao.getMyClub(map);
            Map<String,Object> item = new HashMap<>();
            item.put("club",club);
            item.put("cluber",cluber);
            list.add(item);
        }

        map.put("list", list);
        map.put("totalCount", totalCount);

        System.out.println("getMyClub 서비스임플 종료이다 ");
        return map;
    }

    public Map<String, Object> getMyDeal(String userId)throws Exception{
        System.out.println("getMyDeal 서비스임플 시작이다 ");
        Map<String, Object> map = new HashMap<String, Object>();
        List<Deal> getMyDeal = myPageDao.getMyDeal(userId);

        System.out.println("getMyDeal 값??"+getMyDeal);

        map.put("getMyDeal", getMyDeal);

        System.out.println("getMyDeal 서비스임플 종료이다 ");
        return map;
    }

    public Map<String, Object> getMyReport(String userId)throws Exception{
        System.out.println("getMyReport 서비스임플 시작이다 ");
        Map<String, Object> map = new HashMap<String, Object>();
        List<CommunityReport> getMyReport = myPageDao.getMyReport(userId);


        System.out.println("getMyReport 값??"+getMyReport);

        map.put("getMyReport", getMyReport);

        System.out.println("getMyReport 서비스임플 종료이다 ");
        return map;
    }
    public Map<String, Object> getTotalCount(Search search)throws Exception{
        System.out.println("getTotalCount 서비스임플 시작이다 ");
        Map<String, Object> map = new HashMap<String, Object>();
        int totalCount = myPageDao.getTotalCount(search);

        System.out.println("int totalCount 값??"+totalCount);

        map.put("totalCount", totalCount);
        System.out.println("getTotalCount 서비스임플 종료이다 ");
        return map;
    }

    public Map<String, Object> getTotalCmt(Search search)throws Exception{
        System.out.println("getTotalCmt 서비스임플 시작이다 ");
        Map<String, Object> map = new HashMap<String, Object>();
        int totalCount = myPageDao.getTotalCmt(search);

        System.out.println("int totalCount 값??"+totalCount);

        map.put("totalCount", totalCount);
        System.out.println("getTotalCmt 서비스임플 종료이다 ");
        return map;
    }

    public Map<String, Object> getMyPpt(String userId)throws Exception{
        System.out.println("getMyPpt 서비스임플 시작이다 ");
        Map<String, Object> map = new HashMap<String, Object>();
        List<CommunityReport> getMyPpt = myPageDao.getMyPpt(userId);

        System.out.println("getMyPpt 값??"+getMyPpt);

        map.put("getMyPpt", getMyPpt);

        System.out.println("getMyPpt 서비스임플 종료이다 ");
        return map;
    }

}
