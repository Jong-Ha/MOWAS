package com.project.site.dao;

import com.project.common.Page;
import com.project.common.Search;
import com.project.domain.ClubReport;
import com.project.domain.CommunityReport;
import com.project.domain.File;
import com.project.domain.MasterBoard;

import java.util.List;
import java.util.Map;

public interface SiteDao {

    // MaterBoard CRUD
    public void addMasterBoard(MasterBoard masterBoard) throws Exception;

    public void addMasterBoardFiles(File file) throws Exception;
    public void updateMasterBoard(MasterBoard masterBoard) throws Exception;

    public MasterBoard getMasterBoard(int materBoardNo) throws Exception;

    public List<MasterBoard> listMasterBoard(Search search) throws Exception;

    public int getMbTotalCount(Search search) throws Exception;

    public int getTotalCount(Map<String, Object> map) throws Exception;

    public void deleteMasterBoard(int masterBoardNo) throws Exception;

    //Community Report CRUD
    public void addCommunityReport(CommunityReport communityReport) throws Exception;

    public  CommunityReport getCommunityReport(int reportNo) throws Exception;

    public List<CommunityReport> listCommunityReport(Search search) throws Exception;

    public void processCommunityReport(CommunityReport communityReport) throws Exception;

    public  List<CommunityReport> listCommunityReportProcess(Search search) throws Exception;

    public CommunityReport getCommunityReportProcess(int reportNo) throws Exception;

    public void deleteCommunityReport(int reportNo) throws Exception;


    //Club Report CRUD
    public void addClubReport(ClubReport clubReport) throws Exception;

    public void addClubReportFiles(File file) throws Exception;

    public  ClubReport getClubReport(int clubReportNo) throws Exception;

    public List<ClubReport> listClubReport(Search search) throws Exception;

    List<ClubReport> listClubReportProcess(Search search) throws Exception;

    public void processClubReport(ClubReport clubReport) throws Exception;

    public void processClubRereport(ClubReport clubReport) throws Exception;

    public void deleteClubReport(int clubReportNo) throws Exception;
}
