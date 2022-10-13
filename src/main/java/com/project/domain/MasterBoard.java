package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class MasterBoard {
    private int masterBoardNo;
    private String adminId;
    private char mbCategory;
    private String mbTitle;
    private String mbText;
    private Date mbRegDate;
    List<File> files;
}
