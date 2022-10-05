package com.project.deal.service;

import com.project.common.Search;
import com.project.domain.Club;
import com.project.domain.Deal;

import java.util.Map;
import java.util.Objects;

public interface DealService {
    public void addDeal(Deal deal) throws Exception;

    public Deal getDeal(int dealBoardNum) throws Exception;
    public Deal updateDeal(Deal deal) throws Exception;
    public void deleteDeal(Deal deal) throws Exception;
    public Map<String, Object> listDeal(Search search) throws Exception;
}
