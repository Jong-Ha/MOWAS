package com.project.deal.service;

import com.project.common.Search;
import com.project.domain.Deal;

import java.util.Map;

public interface DealService {
    public void addDeal(Deal deal) ;

    public Deal getDeal(int dealBoardNum);
    public void updateDeal(Deal deal);

    public void deleteDeal(Deal deal) ;
   public Map<String, Object> getListDeal(Search search);
}
