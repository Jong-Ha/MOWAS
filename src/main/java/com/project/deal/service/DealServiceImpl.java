package com.project.deal.service;

import com.project.common.Search;
import com.project.deal.dao.DealDao;
import com.project.domain.Deal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("dealServiceImpl")
public class DealServiceImpl implements DealService {

    @Autowired
    @Qualifier("dealDaoImpl")
    private DealDao dealDao;
    public void setDealDao(DealDao dealDao) {
        this.dealDao = dealDao;
    }



    public DealServiceImpl() {
        System.out.println(this.getClass());
    }


    @Override
    public void addDeal(Deal deal) {
        dealDao.addDeal(deal);
        System.out.println("addDeal serviceImpl");

    }

    @Override
    public Deal getDeal(int dealBoardNum) {
        System.out.println("getDeal serviceImpl");
        return dealDao.getDeal(dealBoardNum);

    }

    @Override
    public void updateDeal(Deal deal) {
        dealDao.updateDeal(deal);
        System.out.println("updateDeal serviceImpl");
    }

    @Override
    public void deleteDeal(Deal deal) {
        dealDao.deleteDeal(deal);
        System.out.println("deleteDeal serviceImpl");
    }

    @Override
    public Map<String, Object> getListDeal(Search search) {
        List<Deal> list=dealDao.getListDeal(search);

        Map<String, Object> map =new HashMap<String,Object>();
        map.put("list",list);

        return map;
    }


}
