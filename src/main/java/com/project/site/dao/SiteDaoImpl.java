package com.project.site.dao;


import com.project.common.Search;
import com.project.domain.MasterBoard;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("siteDaoImpl")
public class SiteDaoImpl implements SiteDao{

    @Autowired
    @Qualifier(value = "sqlSessionTemplate")
    private SqlSession sqlSession;
    //public void setSqlSession(SqlSession sqlSession) {
    //    this.sqlSession = sqlSession;
    //}

    public SiteDaoImpl() {
        System.out.println(this.getClass());
        // TODO Auto-generated constructor stub
    }

    @Override
    public void addMasterBoard(MasterBoard masterBoard) {

        sqlSession.insert("SiteMapper.addMasterBoard", masterBoard);
    }

    @Override
    public void updateMasterBoard(MasterBoard masterBoard) throws Exception {
        sqlSession.update("SiteMapper.updateMasterBoard", masterBoard);
    }

    @Override
    public MasterBoard getMasterBoard(int masterBoardNo) throws Exception {
        return sqlSession.selectOne("SiteMapper.getMasterBoard", masterBoardNo);
    }

    @Override
    public void deleteMasterBoard(int masterBoardNo) throws Exception {
        sqlSession.delete("SiteMapper.deleteMasterBoard", masterBoardNo);
    }


    public List<MasterBoard> listMasterBoard(Search search) throws Exception {
        return sqlSession.selectList("SiteMapper.listMaterBoard", search);
    }

    public int getTotalCount(Search search) throws Exception {
        return sqlSession.selectOne("SiteMapper.getTotalCount", search);
    }
}
