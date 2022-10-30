package com.project.common;


import lombok.ToString;

@ToString
public class Search {
    private String searchCondition;
    private String searchKeyword;
    private int currentPage;
    private int pageSize;
    private int startRowNum;
    private int endRowNum;


    public Search() {
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

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getStartRowNum() {
        return (getCurrentPage()-1)*getPageSize()+1;
    }
    public int getEndRowNum() {
        return getCurrentPage()*getPageSize();
    }
}
