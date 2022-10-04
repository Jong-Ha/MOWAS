package com.project.site.service;

import com.project.domain.MasterBoard;

import java.util.Map;

public interface SiteService {

    public MasterBoard findMasterBoard(int materBoardNo) throws Exception;

    //public Map<String, Object> getMaterBoardList(Search search) throws Exception;

    public void addMasterBoard(MasterBoard masterBoard) throws Exception;

    public void updateMasterBoard(MasterBoard masterBoard) throws Exception;

}
