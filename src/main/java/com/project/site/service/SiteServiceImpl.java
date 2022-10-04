package com.project.site.service;

import com.project.domain.MasterBoard;
import com.project.site.dao.SiteDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("siteServiceImpl")
public class SiteServiceImpl implements SiteService{

    @Autowired
    @Qualifier("siteDaoImpl")
    private SiteDao siteDao;

    public void setSiteDao(SiteDao siteDao) {

        this.siteDao = siteDao;
    }

    public SiteServiceImpl() {

        System.out.println(this.getClass());
    }
    public MasterBoard findMasterBoard(int materBoardNo) throws Exception {
        return siteDao.findMasterBoard(materBoardNo);
    }

    //public Map<String, Object> getMaterBoardList(Search search) throws Exception;

    public void addMasterBoard(MasterBoard masterBoard) throws Exception {
        siteDao.addMasterBoard(masterBoard);
    }

    public void updateMasterBoard(MasterBoard masterBoard) throws Exception {
        siteDao.updateMasterBoard(masterBoard);

    }
}
