


package com.project.deal.service;

import com.project.common.Search;
import com.project.deal.dao.DealDao;
import com.project.domain.ClubMasterBoard;
import com.project.domain.Deal;
import com.project.domain.File;
import com.project.site.dao.SiteDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
    public int addDeal(Deal deal) throws Exception {
        dealDao.addDeal(deal);
        System.out.println("addDeal serviceImpl");
        System.out.println("addDeal serviceImpl" + deal);
        System.out.println("addDeal serviceImpl");
        deal.setVillCode(deal.getUser().getVillCode());
        // System.out.println("뭔데 ㅜㅜ"+dealDao.getDealNum(deal.getUser().getUserId()));
        int dealBoardNum = dealDao.getDealNum(deal.getUser().getUserId());
        String boardCategory = deal.getBoardCategory();
        List<File> files = deal.getFiles();
        for (File file : files) {
            file.setFileName(file.getFileName());
            file.setBoardNum(dealBoardNum);
            file.setBoardCategory(boardCategory);
            dealDao.addDealBoardFile(file);
        }
        System.out.println(dealBoardNum);
        return dealBoardNum;

    }

    @Override
    public void updateDeal(Deal deal, List<String> deleteFileNames) throws Exception {
        dealDao.updateDeal(deal);

        //삭제된 파일 날리기
        Map<String, Object> map = new HashMap<>();
        map.put("boardNum", deal.getDealBoardNum());
        map.put("deleteFileNames", deleteFileNames);
        map.put("boardCategory", deal.getBoardCategory());
        if (deleteFileNames != null) {
            dealDao.deleteDealBoardFile(map);
        }

        //새로운 파일 등록
        List<File> files = deal.getFiles();
        for (File file : files) {
            file.setBoardNum(deal.getDealBoardNum());
            file.setBoardCategory(deal.getBoardCategory());
            dealDao.addDealBoardFile(file);
        }
        System.out.println("updateDeal serviceImpl");
    }

    @Override
    public List<String> deleteDeal(int dealBoardNum) throws Exception {
        dealDao.deleteDeal(dealBoardNum);
        System.out.println("deleteDeal serviceImpl");
        //파일 날리기
        Map<String, Object> map = new HashMap<>();
        List<String> deleteFileNames = new ArrayList<>();
        map.put("boardNum", dealBoardNum);
        map.put("deleteFileNames", deleteFileNames);
        //deleteFileNames가 널이면 실행 안됨
        //deleteFileNames.size가 0이면 모든 파일 삭제
        List<String> deleteFiles = dealDao.listDealBoardFile(dealBoardNum);
        dealDao.deleteDealBoardFile(map);
        return deleteFiles;
    }

    @Override
//    public Map<String, Object> getListDeal(Search search, String boardCategory, List<String> searchTag) throws Exception {
        public List<Deal> getListDeal(Search search, String boardCategory,String searchCondition,String searchKeyword) throws Exception {
        Map<String, Object> map = new HashMap<>();

        map.put("search", search);
        System.out.println("이것은 서치입니다 "+search);
        map.put("boardCategory", boardCategory);

        //int totalCount = dealDao.getTotalCount(map);
        List<Deal> list = dealDao.getListDeal(map);
        //map.put("totalCount", totalCount);
        map.put("list", list);
        System.out.println(list + "되는건가요 list");
        return dealDao.getListDeal(map);


//        Map<String, Object> map2=new HashMap<>();
        //      map2.put("search", search);
        //    map2.put("boardCategory",boardCategory);
//        List<Deal> list=dealDao.getListDeal(map2);
//        int totalCount = dealDao.getTotalCount(search);
//        System.out.println("여기까지는 옴 ?");
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("list", list );
//        map.put("totalCount", new Integer(totalCount));

        //return map;
    }

    @Override
    public Deal getUserId(int dealBoardNum) throws Exception {
        System.out.println("serviceImpl" + dealBoardNum);

        return dealDao.getDeal(dealBoardNum);
    }

    @Override
    public void updateReview(Deal deal) throws Exception {
        System.out.println("왜 안가 ? " + deal);
        dealDao.updateReview(deal);
    }


//    @Override
//    public List<String> addReview(Deal dea) throws Exception {
//        dealDao.addReview
//        return ;
//
//    }

    @Override
    public Deal getDeal(int dealBoardNum) throws Exception {
        System.out.println("getDeal serviceImpl");

        return dealDao.getDeal(dealBoardNum);

    }

    public int getReviewPt(Deal deal) throws Exception {
        System.out.println("service Impl reviewPt");
        System.out.println(deal.getReviewPt());
        return dealDao.getReviewPt(deal);
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
    @Override
    public int getViewCount(int dealBoardNum, String boardCategory) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("dealBoardNum", dealBoardNum);
        map.put("boardCategory", boardCategory);
        return dealDao.getViewCount(map);

    }
    @Override
    public void updateViewCount(int dealBoardNum,int viewCount,String boardCategory) {
        Map<String,Object>map = new HashMap<String,Object>();
        map.put("dealBoardNum", dealBoardNum);
        map.put("viewCount", viewCount);
        map.put("boardCategory", boardCategory);
        System.out.println(map);
        dealDao.updateViewCount(map);
    }

    @Override
    public String getImage(String userId) {
        return dealDao.getImage(userId);
    }

}