package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class ClubMasterBoard {
    public ClubMasterBoard() {
    }

    private int boardNum;
    private int clubNum;
    private String userId;
    private String title;
    private String text;
    private Date regDate;
    private Date updateDate;
    private boolean noticeSendCheck;
    List<File> files;
}
