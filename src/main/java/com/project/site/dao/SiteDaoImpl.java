package com.project.site.dao;


import com.project.common.Page;
import com.project.common.Search;
import com.project.domain.ClubReport;
import com.project.domain.CommunityReport;
import com.project.domain.File;
import com.project.domain.MasterBoard;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
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
    public void addMasterBoardFiles(File file) {

        sqlSession.insert("SiteMapper.addMasterBoardFiles", file);
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
    public List<CommunityReport> listCommunityReport(Search search) throws Exception {
        return sqlSession.selectList("SiteMapper.listCommunityReport", search);

    }
    @Override
    public void processCommunityReport(CommunityReport communityReport) throws Exception {
        sqlSession.update("SiteMapper.processCommunityReport", communityReport);
    }

    @Override
    public  List<CommunityReport>listCommunityReportProcess(Search search) throws Exception {
       return sqlSession.selectList("SiteMapper.listCommunityReportProcess", search);
    }

    @Override
    public CommunityReport getCommunityReportProcess(int reportNo) throws Exception {
        return sqlSession.selectOne("SiteMapper.getCommunityReportProcess", reportNo);
    }

    @Override
    public void deleteCommunityReport(int reportNo) throws Exception {
        sqlSession.delete("SiteMapper.deleteCommunityReport", reportNo);
    }

    //모임 신고 CRUD
    @Override
    public void addClubReport(ClubReport clubReport) throws Exception {
        sqlSession.insert("SiteMapper.addClubReport", clubReport);
    }
    @Override
    public  ClubReport getClubReport(int clubReportNo) throws Exception {
        return sqlSession.selectOne("SiteMapper.getClubReport", clubReportNo);
    }

    @Override
    public List<ClubReport> listClubReport(Search search) throws Exception {
        return sqlSession.selectList("SiteMapper.listClubReport", search);
    }

    @Override
    public void processClubReport(ClubReport clubReport) throws Exception {
        sqlSession.update("SiteMapper.processClubReport", clubReport);
    }

    @Override
    public void processClubRereport(ClubReport clubReport) throws Exception {
        sqlSession.update("SiteMapper.processClubRereport", clubReport);
    }

    @Override
    public void deleteClubReport(int clubReportNo) throws Exception {
        sqlSession.delete("SiteMapper.deleteClubReport", clubReportNo);
    }

    @Override
    public int getTotalCount(Map<String,Object> map) throws Exception {
        return sqlSession.selectOne("SiteMapper.getTotalCount", map);
    }
}
