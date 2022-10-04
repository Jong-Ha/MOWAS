package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Voter {
    public Voter() {
    }

    private int voterNum;
    private int voteNum;
    private int voteItem;
    private String userId;
}
