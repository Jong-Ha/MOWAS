package com.project.myPage.dao;

import com.project.common.Search;
import com.project.domain.*;

import java.util.List;
import java.util.Map;

public interface MyPageDao {

    public User getMyPage(String userId)throws Exception;

    public User getMyInfor(String userId)throws Exception;

    public List<UserInterList> getMyInforInterList(String userId)throws Exception;

    public List<VilBoard> getMyVillBoard(String userId)throws Exception;

    public List<ClubMasterBoard> getMyClubBoard(String userId)throws Exception;

    public List<ClubCalendarReview> getMyClubCalendarReview(String userId)throws Exception;

    public List<Deal> getMydealBoard(String userId)throws Exception;

    public List<Comment> getMyComment(String userId)throws Exception;

    public List<Recomment> getMyRecomment(String userId)throws Exception;

    public List<VilBoard> getMyvillBoardLike(String userId)throws Exception;

    public List<ClubCalendarReview> getMyclubCalendarReviewLike(String userId)throws Exception;

    public List<Deal> getMydealBoardLike(String userId)throws Exception;

    public Club getMyClub(Map<String, Object> map)throws Exception;

    public List<Cluber> getMyCluber(Map<String, Object> map)throws Exception;

    public int getTotalMyCluber(Map<String, Object> map)throws Exception;

    public List<Deal> getMyDeal(String userId)throws Exception;

    public List<CommunityReport> getMyReport(String userId)throws Exception;

    public int getTotalCount(Search search)throws Exception;

    public int getTotalCmt(Search search)throws Exception;

    public List<CommunityReport> getMyPpt(String userId)throws Exception;

}
