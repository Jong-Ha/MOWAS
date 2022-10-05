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
    @Qualifier("sqlSessionTemplate")
    private SqlSession sqlSession;
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession=sqlSession;
    }

    public DealDaoImpl(){
        System.out.println(this.getClass());
    }




//    @Override
    //public List<Deal> ListDeal(Search search) throws Exception {
    //    return null;
    //}

    @Override
    public void addDeal(Deal deal)  {
        sqlSession.insert("DealMapper.addDeal",deal);
    }

    @Override
    public Deal getDeal(int dealBoardNum){
        return sqlSession.selectOne("DealMapper.getDeal", dealBoardNum);
    }

    @Override
    public void updateDeal(Deal deal) {
        sqlSession.update("DealMapper.updateDeal", deal);
    }

    @Override
    public void deleteDeal(Deal deal) {
        sqlSession.delete("DealMapper.deleteDeal", deal);
    }

    @Override
    public List<Deal> getListDeal(Search search) {
        return sqlSession.selectList("DealMapper.getListDeal",search);
    }
}
