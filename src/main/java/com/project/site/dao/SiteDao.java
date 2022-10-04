package com.project.site.dao;

import com.project.domain.MasterBoard;

public interface SiteDao {

    public MasterBoard findMasterBoard(int materBoardNo) throws Exception;

   // public List<MasterBoard> getMaterBoardList(Search search) throws Exception;

    public void updateMasterBoard(MasterBoard masterbBoard) throws Exception;

    public void addMasterBoard(MasterBoard masterBoard);

    //public int getTotalCount(Search search) throws Exception ;

}
