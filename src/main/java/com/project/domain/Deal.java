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
public class Deal {
    private User user;
    private int dealBoardNum;
    private String boardCategory;
    private int dealStatus;
    private String dealTitle;
    private String dealText;
    private Date dealRegDate;
    private String productName;
    private int price;
    private String tag;
    private int viewCount;
    private String villCode;
    private String dealId;
    private int dealModeCheck;
    private int chatNum;
    private String review;
    private int reviewPt;
    private String dealCalenderTitle;
    private Date dealEndDate;
    private Date dealDate;
    private String dealLocation;
    List<File> files;
    private String likeCheck;
    private int likeCount;
    private String dealImage;



}
