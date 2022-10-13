package com.project.deal.service;

import com.project.common.Search;
import com.project.deal.dao.DealDao;
import com.project.domain.Deal;
import com.project.domain.File;
import com.project.site.dao.SiteDao;
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
    public void setDealDaoDao(DealDao dealDao) {

        this.dealDao = dealDao;
    }
    public DealServiceImpl() {

        System.out.println(this.getClass());
    }
    @Override
    public int addDeal(Deal deal) throws Exception{
        dealDao.addDeal(deal);
        System.out.println("addDeal serviceImpl");
        System.out.println("addDeal serviceImpl"+deal);
        System.out.println("addDeal serviceImpl");
        System.out.println("뭔데 ㅜㅜ"+dealDao.getDealNum(deal.getUser().getUserId()));
        int dealBoardNum = dealDao.getDealNum(deal.getUser().getUserId());
        List<File> files = deal.getFiles();
        for(File file : files){
            file.setFileName(file.getFileName());
            file.setBoardNum(dealBoardNum);
            file.setBoardCategory(deal.getBoardCategory());
            file.setFileName(file.getFileName());
            dealDao.addDealBoardFile(file);
        }
        System.out.println(dealBoardNum);
        return dealBoardNum;

    }

    @Override
    public Deal getDeal(int dealBoardNum) throws Exception{
        System.out.println("getDeal serviceImpl");

        return dealDao.getDeal(dealBoardNum);

    }

    @Override
    public void updateDeal(Deal deal) throws Exception{
        dealDao.updateDeal(deal);
        System.out.println("updateDeal serviceImpl");
    }

    @Override
    public void deleteDeal(Deal deal) throws Exception{
        dealDao.deleteDeal(deal);
        System.out.println("deleteDeal serviceImpl");
    }

    @Override
    public Map<String, Object> getListDeal(Search search,String boardCategory) throws Exception {
        Map<String, Object> map2=new HashMap<>();
        map2.put("search", search);
        map2.put("boardCategory",boardCategory);




        List<Deal> list=dealDao.getListDeal(map2);
        int totalCount = dealDao.getTotalCount(search);
        System.out.println("여기까지는 옴 ?");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", list );
        map.put("totalCount", new Integer(totalCount));

        return map;
    }

//    @Override
//    public Map<String, Object> getListDeal(Search search) throws Exception{
//        List<Deal> list=DealDao.getListDeal(search);
//        int totalCount = DealDao.getTotalCount(search);
//
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("list", list );
//        map.put("totalCount", new Integer(totalCount));
//
//        return map;
//    }


}
