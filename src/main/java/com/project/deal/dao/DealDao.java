package com.project.deal.dao;

import com.project.common.Search;
import com.project.domain.Deal;

import javax.naming.directory.SearchControls;
import java.util.List;

public interface DealDao {
    public void addDeal(Deal deal) ;

    public Deal getDeal(int dealBoardNum) ;



    public void updateDeal(Deal deal);
    public void deleteDeal(Deal deal) ;

        public List<Deal> getListDeal(Search search) ;
   //public List<Deal> listDeal();
}
