package com.project.deal.service;

import com.project.deal.dao.DealDao;
import com.project.domain.Deal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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

    public void addDeal(Deal deal) throws Exception{
        dealDao.addDeal(deal);
    }

    @Override
    public Deal getDeal(int dealBoardNum) throws Exception {
        return dealDao.getDeal(dealBoardNum);
    }

    @Override
    public Deal updateDeal(Deal deal) throws Exception {
        dealDao.updateDeal(deal);

        return null;
    }

    @Override
    public void deleteDeal(Deal deal) throws Exception {
    dealDao.deleteDeal(deal);
    }

//    @Override
//    public Map<String, Object> listDeal(Search search) throws Exception {
//        return null;
//    }


}
