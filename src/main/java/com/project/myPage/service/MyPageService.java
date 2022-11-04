package com.project.myPage.service;

import com.project.common.Search;
import com.project.domain.User;

import java.util.Map;

public interface MyPageService {

    public User getMyPage(String userId)throws Exception;

    public Map<String, Object> getMyInfor(String userId)throws Exception;

    public Map<String, Object> getMyBoard(String userId, Search search)throws Exception;

    public Map<String, Object> getMyComment(String userId)throws Exception;

    public Map<String, Object> getMyLike(String userId)throws Exception;

    public Map<String, Object> getMyClub(String applyCheck, String userId, Search search)throws Exception;

    public Map<String, Object> getMyDeal(String userId)throws Exception;

    public Map<String, Object> getMyReport(String userId)throws Exception;

    public Map<String, Object> getTotalCount(Search search)throws Exception;

    public Map<String, Object> getTotalCmt(Search search)throws Exception;

    public Map<String, Object> getMyPpt(String userId)throws Exception;



}
