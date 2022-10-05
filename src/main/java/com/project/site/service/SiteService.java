package com.project.site.service;

import com.project.common.Search;
import com.project.domain.MasterBoard;

import java.util.Map;

public interface SiteService {

    public void addMasterBoard(MasterBoard masterBoard) throws Exception;

    public void updateMasterBoard(MasterBoard masterBoard) throws Exception;
    public MasterBoard getMasterBoard(int masterBoardNo) throws Exception;

    public Map<String, Object> listMasterBoard(Search search) throws Exception;

    public void deleteMasterBoard(int masterBoardNo) throws Exception;
}
