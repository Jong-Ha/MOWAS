package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class Vote {
    public Vote() {
    }

    private int voteNum;
    private String roomId;
    private String voteMasterId;
    private String voteTitle;
    private String voteText;
    private String multiVoteCheck;
    private String hideVoteCheck;
    private String endDateCheck;
    private Date voteDate;
    private Date endDate;
    private String endCheck;
    private int totalVoter;
    private String voteItem1;
    private String voteItem2;
    private String voteItem3;
    private String voteItem4;
    private String voteItem5;
    private int voter1;
    private int voter2;
    private int voter3;
    private int voter4;
    private int voter5;

}
