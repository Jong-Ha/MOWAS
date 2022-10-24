package com.project.myPage.service;

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
        String tm = "";
        ArrayList tmlist = null;
        for (int i = 0; i < inList.size(); i++) {
            String abc = inList.get(i).getInterList().trim();
            System.out.println("abc의 값...." + abc);
            String interList = "";
            String str = "";
            switch (Integer.parseInt(abc)) {
                case 1:
                    interList = "독서";
                    str += interList;
                    break;
                case 2:
                    interList = "자동차";
                    str += interList;
                    break;
                case 3:
                    interList = "반려동물";
                    str += interList;
                    break;
                case 4:
                    interList = "공예";
                    str += interList;
                    break;
                case 5:
                    interList = "스포츠";
                    str += interList;
                    break;
                case 6:
                    interList = "댄스";
                    str += interList;
                    break;
                case 7:
                    interList = "여행";
                    str += interList;
                    break;
                case 8:
                    interList = "사진";
                    str += interList;
                    break;
                case 9:
                    interList = "육아";
                    str += interList;
                    break;
                case 10:
                    interList = "공연";
                    str += interList;
                    break;
                case 11:
                    interList = "음악";
                    str += interList;
                    break;
                case 12:
                    interList = "게임";
                    str += interList;
                    break;
                case 13:
                    interList = "그외";
                    str += interList;
                    break;
            }
            System.out.println("str의 값..?" + str);
            tm += str+", ";
            System.out.println("tm의값.....! " + tm);
            tmlist = new ArrayList<>();
            tmlist.add(tm);

            map.put("interList", tmlist);
        }

        map.put("user", user);

        return map;
    }

    public Map<String, Object> getMyBoard(String userId)throws Exception{

        System.out.println("getMyBoard 서비스임플 시작이다 ");
        Map<String, Object> map = new HashMap<String, Object>();
        List<VilBoard> villBoard = myPageDao.getMyVillBoard(userId);
        List<ClubMasterBoard> clubBoard = myPageDao.getMyClubBoard(userId);
        List<ClubCalendarReview> clubCalendarReview = myPageDao.getMyClubCalendarReview(userId);
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

    public Map<String, Object> getMyClub(String userId)throws Exception{
        System.out.println("getMyClub 서비스임플 시작이다 ");
        Map<String, Object> map = new HashMap<String, Object>();
        List<Club> getMyClub = myPageDao.getMyClub(userId);

        System.out.println("getMyClub 값??"+getMyClub);

        map.put("getMyClub", getMyClub);

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
