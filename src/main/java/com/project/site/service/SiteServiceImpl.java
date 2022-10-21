package com.project.site.service;

import com.project.common.Page;
import com.project.common.Search;
import com.project.domain.ClubReport;
import com.project.domain.CommunityReport;
import com.project.domain.File;
import com.project.domain.MasterBoard;
import com.project.site.dao.SiteDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("siteServiceImpl")
public class SiteServiceImpl implements SiteService {

    @Autowired
    @Qualifier("siteDaoImpl")
    private SiteDao siteDao;

    public void setSiteDao(SiteDao siteDao) {

        this.siteDao = siteDao;
    }

    public SiteServiceImpl() {

        System.out.println(this.getClass());
    }

    // 공지사항 CRUD
    @Override
    public void addMasterBoard(MasterBoard masterBoard) throws Exception {
        siteDao.addMasterBoard(masterBoard);
        System.out.println(masterBoard.getMasterBoardNo());

        List<File> files = masterBoard.getFiles();

        if(files != null) {
            for (File file : files) {
                file.setBoardNum(masterBoard.getMasterBoardNo());
                siteDao.addMasterBoardFiles(file);
            }
        }
    }

    @Override
    public void updateMasterBoard(MasterBoard masterBoard) throws Exception {
        siteDao.updateMasterBoard(masterBoard);
    }

    @Override
    public MasterBoard getMasterBoard(int masterBoardNo) throws Exception {
        return siteDao.getMasterBoard(masterBoardNo);
    }

    @Override
    public void deleteMasterBoard(int masterBoardNo) throws Exception {
        siteDao.deleteMasterBoard(masterBoardNo);
    }

    @Override
    public Map<String, Object> listMasterBoard(Search search) throws Exception {
        List<MasterBoard> mblist = siteDao.listMasterBoard(search);
        int totalCount = siteDao.getMbTotalCount(search);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", mblist);
        map.put("totalCount", new Integer(totalCount));

        return map;
    }

    //커뮤니티 신고 CRUD
    @Override
    public void addCommunityReport(CommunityReport communityReport) throws Exception {
        siteDao.addCommunityReport(communityReport);
    }

    @Override
    public  CommunityReport getCommunityReport(int reportNo) throws Exception {
        return siteDao.getCommunityReport(reportNo);
    }

    @Override
    public Map<String, Object> listCommunityReport(Search search) throws Exception {
        List<CommunityReport> list = siteDao.listCommunityReport(search);

        Map<String,Object> totalCountmap = new HashMap<String, Object>();
        totalCountmap.put("where", "communityReportList");
        int totalCount = siteDao.getTotalCount(totalCountmap);

        Map<String,Object> map = new HashMap<String, Object>();

        map.put("list", list);
        map.put("totalCount", new Integer(totalCount));

        return map;
    }

    @Override
    public void processCommunityReport(CommunityReport communityReport) throws Exception {
        siteDao.processCommunityReport(communityReport);
    }

    @Override
    public   Map<String, Object> listCommunityReportProcess(Search search) throws Exception {
        List<CommunityReport> list = siteDao.listCommunityReportProcess(search);

        Map<String,Object> totalCountmap = new HashMap<String, Object>();
        totalCountmap.put("where", "communityReportProcessList");

        int totalCount = siteDao.getTotalCount(totalCountmap);

        Map<String,Object> map = new HashMap<String, Object>();

        map.put("list", list);
        map.put("totalCount", new Integer(totalCount));

        return map;
    }

    public CommunityReport getCommunityReportProcess(int reportNo) throws Exception {
        return siteDao.getCommunityReportProcess(reportNo);
    }

    @Override
    public void deleteCommunityReport(int reportNo) throws Exception {
        siteDao.deleteCommunityReport(reportNo);
    }

    //모임 신고 CRUD
    @Override
    public void addClubReport(ClubReport clubReport) throws Exception {
        siteDao.addClubReport(clubReport);
    }

    @Override
    public  ClubReport getClubReport(int clubReportNo) throws Exception {
        return siteDao.getClubReport(clubReportNo);
    }

    @Override
    public Map<String, Object> listClubReport(Search search) throws Exception {
        List<ClubReport> list = siteDao.listClubReport(search);

        Map<String,Object> totalCountmap = new HashMap<String, Object>();
        totalCountmap.put("where", "clubReportList");
        int totalCount = siteDao.getTotalCount(totalCountmap);

        System.out.println("++++totalCount:: " +totalCount+ "++++++");


        Map<String,Object> map = new HashMap<String, Object>();

        map.put("list", list);
        map.put("totalCount", new Integer(totalCount));

        return map;
    }

    @Override
    public Map<String, Object> listClubReportProcess(Search search) throws Exception {
        List<ClubReport> list = siteDao.listClubReportProcess(search);

        Map<String,Object> totalCountmap = new HashMap<String, Object>();
        totalCountmap.put("where", "clubReportList");
        int totalCount = siteDao.getTotalCount(totalCountmap);

        System.out.println("++++totalCount:: " +totalCount+ "++++++");

        Map<String,Object> map = new HashMap<String, Object>();

        map.put("list", list);
        map.put("totalCount", new Integer(totalCount));

        return map;
    }

    @Override
    public void processClubReport(ClubReport clubReport) throws Exception {
        siteDao.processClubReport(clubReport);
    }

    @Override
    public void processClubRereport(ClubReport clubReport) throws Exception {
        siteDao.processClubRereport(clubReport);
    }
    @Override
    public void deleteClubReport(int clubReportNo) throws Exception {
        siteDao.deleteClubReport(clubReportNo);
    }
}
