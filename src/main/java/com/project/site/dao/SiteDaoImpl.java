package com.project.site.dao;


import com.project.common.Page;
import com.project.common.Search;
import com.project.domain.CommunityReport;
import com.project.domain.MasterBoard;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    //공지사항 CRUD
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

    @Override
    public List<MasterBoard> listMasterBoard(Search search) throws Exception {
        return sqlSession.selectList("SiteMapper.listMasterBoard", search);
    }
    @Override
    public int getMbTotalCount(Search search) throws Exception {
        return sqlSession.selectOne("SiteMapper.getMbTotalCount", search);
    }
    //커뮤니티 신고 CRUD
    @Override
    public void addCommunityReport(CommunityReport communityReport) throws Exception {
        sqlSession.insert("SiteMapper.addCommunityReport", communityReport);
    }
    @Override
    public  CommunityReport getCommunityReport(int reportNo) throws Exception {
        return sqlSession.selectOne("SiteMapper.getCommunityReport", reportNo);
    }
    @Override
    public List<CommunityReport> listCommunityReport(int reportNo) throws Exception {
        return sqlSession.selectList("SiteMapper.listCommunityReport");

    }
    @Override
    public void processCommunityReport(CommunityReport communityReport) throws Exception {
        sqlSession.update("SiteMapper.processCommunityReport", communityReport);
    }

    @Override
    public  List<CommunityReport>listCommunityReportProcess(int reportNo) throws Exception {
        return sqlSession.selectList("SiteMapper.listCommunityReportProcess");
    }

    @Override
    public CommunityReport getCommunityReportProcess(int reportNo) throws Exception {
        return sqlSession.selectOne("SiteMapper.getCommunityReportProcess", reportNo);
    }

    @Override
    public int getTotalCount(Map<String,Object> map) throws Exception {
        return sqlSession.selectOne("SiteMapper.getTotalCount", map);
    }
}
