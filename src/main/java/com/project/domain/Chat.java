package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class Chat {
    public Chat() {
    }

    private int chatNum;
    private String chatCategoryNum;
    private List<Chatter> chatters;
    private String lastChat;
    private Date lastChatDate;
    private int clubNum;
    private int dealBoardNum;

}
