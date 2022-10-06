package com.project.common;

public class Search {
    private int currentPage;        // 현재페이지
    private String searchCondition;
    private String searchKeyword;
    private int endRowNum;
    private int startRowNum;
    private int pageSize;            // 한 페이지당 보여지는 게시물수
    public int getCurrentPage() {
        return currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getEndRowNum() {
        return getCurrentPage()*getPageSize();
    }

    public void setEndRowNum(int endRowNum) {
        this.endRowNum = endRowNum;
    }

    public int getStartRowNum() {
        return (getCurrentPage()-1)*getPageSize()+1;
    }

    public void setStartRowNum(int startRowNum) {
        this.startRowNum = startRowNum;
    }

    public String getSearchCondition() {
        return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
        this.searchCondition = searchCondition;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }
}
