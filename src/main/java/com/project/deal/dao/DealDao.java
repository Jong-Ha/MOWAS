package com.project.deal.dao;

import com.project.common.Search;
import com.project.domain.ClubMasterBoard;
import com.project.domain.Deal;
import com.project.domain.File;

import javax.naming.directory.SearchControls;
import java.util.List;
import java.util.Map;

public interface DealDao {
    public void addDeal(Deal deal) throws Exception;

    public void updateDeal(Deal deal)throws Exception;
    public void deleteDeal(int dealBoardNum) throws Exception;

    public Deal getDeal(int dealBoardNum) throws Exception;

    public List<Deal>  getListDeal(Map<String, Object> map) throws Exception ;
   //public List<Deal> listDeal();
   public int getTotalCount(Map<String, Object> map) throws Exception ;
    // 게시판 currentPage Row 만  return

    public void addDealBoardFile(File file);
    public List<String> listDealBoardFile(int dealBoardNum);
    public void deleteDealBoardFile(Map<String, Object> map);
    public int getDealNum(String userId);

public Deal getUserId(int dealBoardNum);
public void updateReview(Deal deal);
public int getReviewPt(Deal deal);

    int getViewCount(Map<String, Object> map);

    void updateViewCount(Map<String,Object> map);
    //--------------------------------------------------------------------
//    public void addClubMasterBoard(ClubMasterBoard clubMasterBoard);
//    public void updateClubMasterBoard(ClubMasterBoard clubMasterBoard);
//    public void deleteClubMasterBoard(int clubMasterBoardNum);
//    public ClubMasterBoard getClubMasterBoard(int clubMasterBoardNum);
//    public List<ClubMasterBoard> listClubMasterBoard(Map<String, Object> map);
//    public int getTotalClubMasterBoard(Map<String, Object> map);
//    public void addClubMasterBoardFile(File file);
//    public List<String> listClubMasterBoardCurrentFile(int clubMasterBoardNum);
//    public void deleteClubMasterBoardFile(Map<String, Object> map);
//    public int getClubMasterBoardNum(String userId);

}
