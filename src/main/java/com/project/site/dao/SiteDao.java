package com.project.site.dao;

import com.project.domain.MasterBoard;

import java.util.List;

public interface SiteDao {

    // MaterBoard CRUD
    public void addMasterBoard(MasterBoard masterBoard) throws Exception;
    public void updateMasterBoard(MasterBoard masterBoard) throws Exception;
    public MasterBoard getMasterBoard(int materBoardNo) throws Exception;
    //public List<MasterBoard> listMaterBoard() throws Exception;

    //public int getTotalCount(Search search) throws Exception ;

}
