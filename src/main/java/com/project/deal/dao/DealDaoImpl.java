package com.project.deal.dao;

import com.project.common.Search;
import com.project.domain.Deal;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import javax.naming.directory.SearchControls;
import java.util.List;

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

    public Deal getDeal(int dealBoradNum) throws Exception {
        System.out.println("DAOIMPL"+dealBoradNum);
        return sqlSession.selectOne("DealMapper.getDeal", dealBoradNum);
    }


    @Override
    public void updateDeal(Deal deal)throws Exception {
        sqlSession.update("DealMapper.updateDeal", deal);
    }

    @Override
    public void deleteDeal(Deal deal)throws Exception {
sqlSession.delete("DealMapper.deleteDeal", deal);
    }

    @Override
    public List<Deal> getListDeal(Search search) throws Exception {
        System.out.println("이거 맞아요 ?");
        System.out.println(search+"getlistDeal daoimpl");
        return sqlSession.selectList("DealMapper.getListDeal", search);
    }

    @Override
    public int getTotalCount(Search search) throws Exception {
        return sqlSession.selectOne("DealMapper.getTotalCount",search);
    }


}
