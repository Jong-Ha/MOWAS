package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Like {

    private int likeNum;
    private String userId;
    private String boardCategory;
    private int boardNum;
    private String likeCheck;
}
