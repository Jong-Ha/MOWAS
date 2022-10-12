package com.project.deal.service;

import com.project.common.Search;
import com.project.domain.ClubMasterBoard;
import com.project.domain.Deal;

import java.util.List;
import java.util.Map;


public interface DealService {
    public int addDeal(Deal deal) throws Exception;

    public Deal getDeal(int dealBoardNum)throws Exception;
    public void updateDeal(Deal deal)throws Exception;

    public void deleteDeal(Deal deal) throws Exception;
    public Map<String, Object> getListDeal(Search search, String boardCategory) throws Exception ;
   // public int addDealBoard(Deal deal);
}
