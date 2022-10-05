package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class File {
    public File() {
    }

    private int fileNum;
    private int boardNum;
    private String boardCategory;
    private String fileName;
}
