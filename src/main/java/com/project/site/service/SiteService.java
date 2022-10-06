package com.project.site.service;

import com.project.common.Page;
import com.project.common.Search;
import com.project.domain.CommunityReport;
import com.project.domain.MasterBoard;

import java.util.List;
import java.util.Map;

public interface SiteService {

    //공지사항 CRUD
    public void addMasterBoard(MasterBoard masterBoard) throws Exception;

    public void updateMasterBoard(MasterBoard masterBoard) throws Exception;
    public MasterBoard getMasterBoard(int masterBoardNo) throws Exception;

    public Map<String, Object> listMasterBoard(Search search) throws Exception;

    public void deleteMasterBoard(int masterBoardNo) throws Exception;

    //커뮤니티 신고 CRUD
    public void addCommunityReport(CommunityReport communityReport) throws Exception;

    public  CommunityReport getCommunityReport(int reportNo) throws Exception;

    public Map<String, Object> listCommunityReport(int reportNo) throws Exception;
    public void processCommunityReport(CommunityReport communityReport) throws Exception;

    public   Map<String, Object> listCommunityReportProcess(int reportNo) throws Exception;

    public CommunityReport getCommunityReportProcess(int reportNo) throws Exception;

}
