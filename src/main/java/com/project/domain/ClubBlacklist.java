package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class ClubBlacklist {
    public ClubBlacklist() {
    }

    private User user;
    private String blacklistCheck;
    private int clubNum;
    private String blacklistText;
    private Date blacklistDate;
}
