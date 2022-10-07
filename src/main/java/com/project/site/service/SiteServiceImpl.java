package com.project.site.service;

import com.project.common.Page;
import com.project.common.Search;
import com.project.domain.CommunityReport;
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

    @Override
    public void addMasterBoard(MasterBoard masterBoard) throws Exception {
        siteDao.addMasterBoard(masterBoard);
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

    @Override
    public void addCommunityReport(CommunityReport communityReport) throws Exception {
        siteDao.addCommunityReport(communityReport);
    }

    @Override
    public  CommunityReport getCommunityReport(int reportNo) throws Exception {
        return siteDao.getCommunityReport(reportNo);
    }

    @Override
    public Map<String, Object> listCommunityReport(int reportNo) throws Exception {
        List<CommunityReport> list = siteDao.listCommunityReport(reportNo);
        Map<String,Object> map = new HashMap<String, Object>();

        map.put("list", list);

        return map;
    }

    @Override
    public void processCommunityReport(CommunityReport communityReport) throws Exception {
        siteDao.processCommunityReport(communityReport);
    }

    @Override
    public   Map<String, Object> listCommunityReportProcess(int reportNo) throws Exception {
        List<CommunityReport> list = siteDao.listCommunityReportProcess(reportNo);
        Map<String,Object> map = new HashMap<String, Object>();

        map.put("list", list);

        return map;
    }

    public CommunityReport getCommunityReportProcess(int reportNo) throws Exception {
        return siteDao.getCommunityReportProcess(reportNo);
    }
}
