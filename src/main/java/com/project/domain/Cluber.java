package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class Cluber {
    public Cluber() {
    }

    private int clubUserNum;
    private User user;
    private int clubNum;
    private String cluberStatus;
    private Date clubRegDate;
    private Date clubApplyDate;
    private String cluberText;
    private String clubOutText;
    private Date clubOutDate;
    private Date blacklistDate;
    private String blacklistText;
    private String blacklistCheck;

}
