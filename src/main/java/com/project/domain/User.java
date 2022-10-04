package com.project.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString

public class User {
    private String userId;
    private String masterCheck;
    private String userStatus;
    private String password;
    private String userName;
    private int rrd;
    private String gender;
    private String email;
    private int phone;
    private String villCode;
    private String userImage;
    private Date lcd;
    private String loginCheck;
    private Date psd;
    private Date ped;
    private int ppt;
    private int reviewPt;

    public User() {
    }

}
