package com.project.deal.dao;

import com.project.domain.Deal;

import javax.naming.directory.SearchControls;
import java.util.List;

public interface DealDao {
    public void addDeal(Deal deal) throws Exception;

    public Deal getDeal(int dealBoardNum) throws Exception;

    public List<Deal> ListDeal(SearchControls search) throws Exception;

    public Deal updateDeal(Deal deal) throws Exception;
    public void deleteDeal(Deal deal) throws Exception;

}
