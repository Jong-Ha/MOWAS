package com.project.myPage.dao;

import com.project.domain.ClubMasterBoard;
import com.project.domain.User;
import com.project.domain.UserInterList;
import com.project.domain.VilBoard;

import java.util.List;
import java.util.Map;

public interface MyPageDao {

    public User getMyPage(String userId)throws Exception;

    public User getMyInfor(String userId)throws Exception;

    public List<UserInterList> getMyInforInterList(String userId)throws Exception;

    public List<VilBoard> getMyVillBoard(String userId)throws Exception;

    public List<ClubMasterBoard> getMyClubBoard(String userId)throws Exception;

}
