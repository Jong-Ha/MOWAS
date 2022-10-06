package com.project.site.dao;

import com.project.common.Page;
import com.project.common.Search;
import com.project.domain.CommunityReport;
import com.project.domain.MasterBoard;

import java.util.List;
import java.util.Map;

public interface SiteDao {

    // MaterBoard CRUD
    public void addMasterBoard(MasterBoard masterBoard) throws Exception;
    public void updateMasterBoard(MasterBoard masterBoard) throws Exception;
    public MasterBoard getMasterBoard(int materBoardNo) throws Exception;
    public List<MasterBoard> listMasterBoard(Search search) throws Exception;

    public int getMbTotalCount(Search search) throws Exception;

    public int getTotalCount(Map<String, Object> map) throws Exception;
    public void deleteMasterBoard(int masterBoardNo) throws Exception;

    //Community Report CRUD
    public void addCommunityReport(CommunityReport communityReport) throws Exception;

    public  CommunityReport getCommunityReport(int reportNo) throws Exception;

    public List<CommunityReport> listCommunityReport(int reportNo) throws Exception;
    public void processCommunityReport(CommunityReport communityReport) throws Exception;

    public  List<CommunityReport> listCommunityReportProcess(int reportNo) throws Exception;

    public CommunityReport getCommunityReportProcess(int reportNo) throws Exception;

}
