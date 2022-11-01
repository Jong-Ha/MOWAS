
package com.project.deal.service;

import com.project.common.Search;
import com.project.domain.ClubMasterBoard;
import com.project.domain.Deal;

import java.util.List;
import java.util.Map;


public interface DealService {
    public int addDeal(Deal deal) throws Exception;
    public void updateDeal(Deal deal,List<String> deleteFileNames)throws Exception;
    public List<String> deleteDeal(int dealBoardNum) throws Exception;
    public Deal getDeal(int dealBoardNum)throws Exception;
    public List<Deal> getListDeal(Search search, String boardCategory,String searchCondition,String searchKeyword) throws Exception ;
    public Deal getUserId(int dealBoardNum) throws Exception;
    public void updateReview(Deal deal)throws Exception;

    public int getReviewPt(Deal deal) throws Exception;

    int getViewCount(int dealBoardNum, String boardCategory);
    void updateViewCount(int dealBoardNum,int viewCount, String boardCategory);


//    public int addReview(Deal deal) throws Exception;
    //   public List<String> deleteReview(int dealBoardNum) throws Exception;
    //   public Map<String, Object> getListReview(Search search, String boardCategory) throws Exception ;
    // public int addDealBoard(Deal deal);
//   public int addClubMasterBoard(ClubMasterBoard clubMasterBoard);
//    public void updateClubMasterBoard(ClubMasterBoard clubMasterBoard, List<String> deleteFileNames);
//    public List<String> deleteClubMasterBoard(int clubMasterBoardNum);
//    public ClubMasterBoard getClubMasterBoard(int clubMasterBoardNum);
//    public Map<String, Object> listClubMasterBoard(Search search, int clubNum);

}
