package com.project.site.dao;

import com.project.common.Search;
import com.project.domain.MasterBoard;

import java.util.List;

public interface SiteDao {

    // MaterBoard CRUD
    public void addMasterBoard(MasterBoard masterBoard) throws Exception;
    public void updateMasterBoard(MasterBoard masterBoard) throws Exception;
    public MasterBoard getMasterBoard(int materBoardNo) throws Exception;
    public List<MasterBoard> listMasterBoard(Search search) throws Exception;

    public int getTotalCount(Search search) throws Exception;

    public void deleteMasterBoard(int masterBoardNo) throws Exception;

}
