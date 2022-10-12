package com.project.deal.dao;

import com.project.common.Search;
import com.project.domain.Deal;

import javax.naming.directory.SearchControls;
import java.util.List;
import java.util.Map;

public interface DealDao {
    public void addDeal(Deal deal) throws Exception;

    public Deal getDeal(int dealBoardNum) throws Exception;

    public void updateDeal(Deal deal)throws Exception;
    public void deleteDeal(Deal deal) throws Exception;

    public List<Deal>  getListDeal(Map<String, Object> map) throws Exception ;
   //public List<Deal> listDeal();
   public int getTotalCount(Search search) throws Exception ;
    // 게시판 currentPage Row 만  return
}
