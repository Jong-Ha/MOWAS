package com.project.myPage.dao;

import com.project.common.Search;
import com.project.domain.*;

import java.util.List;
import java.util.Map;

public interface MyPageDao {

    public User getMyPage(String userId)throws Exception;

    public User getMyInfor(String userId)throws Exception;

    public List<UserInterList> getMyInforInterList(String userId)throws Exception;

    public List<VilBoard> getMyVillBoard(Map<String,Object>map)throws Exception;

    public List<ClubMasterBoard> getMyClubBoard(String userId)throws Exception;

    public List<ClubCalendarReview> getMyClubCalendarReview(Map<String,Object> map)throws Exception;

    public List<Deal> getMydealBoard(String userId)throws Exception;

    public List<Comment> getMyComment(Map<String,Object>map)throws Exception;

    public List<Recomment> getMyRecomment(Map<String,Object>map)throws Exception;

    public List<VilBoard> getMyvillBoardLike(Map<String,Object>map)throws Exception;

    public List<ClubCalendarReview> getMyclubCalendarReviewLike(Map<String,Object>map)throws Exception;

    public List<Deal> getMydealBoardLike(Map<String, Object>map)throws Exception;

    public Club getMyClub(Map<String, Object> map)throws Exception;

    public List<Cluber> getMyCluber(Map<String, Object> map)throws Exception;

    public int getTotalMyCluber(Map<String, Object> map)throws Exception;

    public int getTotalMyClubLike(Map<String ,Object> map) throws Exception;

    public List<Club> getMyClubLike(Map<String, Object> map)throws Exception;

    public List<Deal> getMyDeal(String userId)throws Exception;

    public List<CommunityReport> getMyReport(String userId)throws Exception;

    public int getTotalCount(Search search)throws Exception;

    public int getTotalCmt(Search search)throws Exception;

    public List<CommunityReport> getMyPpt(String userId)throws Exception;


    public List<String> listDealBoardFile(int dealBoardNum);

    int clubCalenderTitle(Map<String, Object> map);

    int getTotalComment(Map<String, Object> map);

    int getTotalRecomment(Map<String, Object> map);

    int getTotalVillBoard(Map<String, Object> map);

    int getTotalClubCalender(Map<String, Object> map);

    List<Comment> getMyCommentLike(Map<String, Object> map);

    int getTotalLikeComment(Map<String, Object> map);

    List<Recomment> getMyRecommentList(Map<String, Object> map);

    List<Recomment> getMyLikeRecommentlist(Map<String, Object> map);

    int getTotalLikeRecomment(Map<String, Object> map);

    int getTotalDealBoardTotal(Map<String, Object> map);
}
