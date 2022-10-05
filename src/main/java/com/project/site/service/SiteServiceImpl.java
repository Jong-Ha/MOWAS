package com.project.site.service;

import com.project.common.Search;
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
        List<MasterBoard> list = siteDao.listMasterBoard(search);
        int totalCount = siteDao.getTotalCount(search);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mbList", list);
        map.put("totalCount", new Integer(totalCount));

        return map;
    }
}
