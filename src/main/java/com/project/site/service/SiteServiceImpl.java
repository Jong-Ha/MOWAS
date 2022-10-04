package com.project.site.service;

import com.project.domain.MasterBoard;
import com.project.site.dao.SiteDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
    public MasterBoard getMasterBoard(int materBoardNo) throws Exception {
        return siteDao.getMasterBoard(materBoardNo);
    }

    //public Map<String, Object> listMaterBoard(Search search) throws Exception {
    //}
}
