package com.project.deal.dao;

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

    public void addDeal(Deal deal) throws Exception{
        sqlSession.insert("DealMapper.addDeal", deal);
    }
    public Deal getDeal(int dealBoradNum) throws Exception{
        return sqlSession.selectOne("DealMapper.getDeal", dealBoradNum);
    }

    @Override
    public List<Deal> ListDeal(SearchControls search) throws Exception {
        return null;
    }

    @Override
    public void updateDeal(Deal deal) throws Exception {
        sqlSession.update("DealMapper.updateDeal", deal);
    }

    @Override
    public void deleteDeal(Deal deal) throws Exception {
sqlSession.delete("DealMapper.deleteDeal", deal);
    }
}
