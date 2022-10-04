package com.project.site.service;

import com.project.domain.MasterBoard;

import java.util.Map;

public interface SiteService {

    public void addMasterBoard(MasterBoard masterBoard) throws Exception;

    public void updateMasterBoard(MasterBoard masterBoard) throws Exception;
    public MasterBoard getMasterBoard(int materBoardNo) throws Exception;

    //public Map<String, Object> listMaterBoard(Search search) throws Exception;
}
