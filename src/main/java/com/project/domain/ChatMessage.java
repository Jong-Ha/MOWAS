package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class ChatMessage {
    public ChatMessage() {
    }

    private int chatMessageNum;
    private int chatNum;
    private String chatText;
    private String chatFile;
    private String chatterId;
    private Date chatDate;
}
