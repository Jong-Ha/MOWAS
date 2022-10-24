package com.project.deal.dao;

import com.project.common.Search;
import com.project.domain.Deal;
import com.project.domain.File;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import javax.naming.directory.SearchControls;
import java.util.List;
import java.util.Map;

@Repository("dealDaoImpl")
public class DealDaoImpl implements DealDao{
    @Autowired
    @Qualifier(value = "sqlSessionTemplate")
    private SqlSession sqlSession;

    public DealDaoImpl(){

    }


    @Override
    public void addDeal(Deal deal)throws Exception{
            sqlSession.insert("DealMapper.addDeal", deal);
    }

    @Override
    public void updateDeal(Deal deal)throws Exception {
        sqlSession.update("DealMapper.updateDeal", deal);
    }


    @Override
    public void deleteDeal(int dealBoardNum)throws Exception {
sqlSession.delete("DealMapper.deleteDeal", dealBoardNum);
    }

    public Deal getDeal(int dealBoradNum) throws Exception {
        System.out.println("DAOIMPL"+dealBoradNum);
        return sqlSession.selectOne("DealMapper.getDeal", dealBoradNum);
    }

    @Override
    public List<Deal> getListDeal(Map<String, Object> map) throws Exception {
        System.out.println("이거 맞아요 ?");
        System.out.println(map+"getlistDeal daoimpl");
        return sqlSession.selectList("DealMapper.getListDeal", map);
    }

    @Override
    public int getTotalCount(Map<String, Object> map) throws Exception {
        return sqlSession.selectOne("DealMapper.getTotalCount",map);
    }
    @Override
    public void addDealBoardFile(File file) {
        sqlSession.insert("DealMapper.addDealBoardFile", file);
    }

    @Override
    public void deleteDealBoardFile(Map<String, Object> map) {
        sqlSession.delete("DealMapper.deleteDealBoardFile", map);
    }
    @Override
    public List<String> listDealBoardFile(int dealBoardNum) {
        return sqlSession.selectList("DealMapper.listDealBoardFile", dealBoardNum);
    }
    @Override
    public int getDealNum(String userId) {
        System.out.println(userId);
        return sqlSession.selectOne("DealMapper.getDealNum", userId);
    }

    @Override
    public Deal getUserId(int dealBoardNum) {
        return sqlSession.selectOne("DealMapper.getUserId", dealBoardNum);
    }

    public void updateReview(Deal deal){
     sqlSession.update("DealMapper.updateReview",deal);
    }

    public int getReviewPt(Deal deal){
        System.out.println("dealDao get reViewPt"+deal);
        return sqlSession.selectOne("DealMapper.getReviewPt",deal);
    }
    @Override
    public int getViewCount(Map<String, Object> map) {
        return sqlSession.selectOne("DealMapper.getViewCount", map);
    }
    @Override
    public void updateViewCount(Map<String,Object> map) {
        System.out.println(map);
        sqlSession.update("DealMapper.updateViewCount", map);
    }


}
