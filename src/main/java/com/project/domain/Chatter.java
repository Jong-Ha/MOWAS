package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class Chatter {
    public Chatter() {
    }

    private int chatterNum;
    private int chatNum;
    private User chatter;
    private Date lastChatDate;
    
}
