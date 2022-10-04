select *
from USERS;


CREATE TABLE files
(
    file_num       NUMBER  NOT NULL,
    board_num      NUMBER  NOT NULL,
    board_category CHAR(2) NOT NULL,
    file_name      VARCHAR2(100) NOT NULL,
    PRIMARY KEY (file_num)
);

CREATE TABLE club
(
    club_num          NUMBER              NOT NULL,
    club_master_id    VARCHAR2(20) NOT NULL REFERENCES users(user_id),
    inter_list        CHAR(2)             NOT NULL,
    club_name         VARCHAR2(50) NOT NULL,
    club_text         VARCHAR2(1000) NOT NULL,
    vill_code         VARCHAR2(100) NOT NULL,
    current_cluber    NUMBER(2) DEFAULT 1 NOT NULL,
    max_cluber        NUMBER(2) DEFAULT 25 NOT NULL,
    club_create_date  DATE                NOT NULL,
    club_image        VARCHAR2(100),
    gather_check      CHAR(1) DEFAULT '0' NOT NULL,
    club_tag          VARCHAR2(120),
    club_delete_check CHAR(1) DEFAULT '0' NOT NULL,
    PRIMARY KEY (club_num)
);

CREATE TABLE club_user
(
    club_user_num   NUMBER              NOT NULL,
    user_id         VARCHAR2(20) NOT NULL REFERENCES users(user_id),
    user_image      VARCHAR2(100) NOT NULL,
    club_num        NUMBER              NOT NULL REFERENCES club (club_num),
    cluber_status   CHAR(1)             NOT NULL,
    club_reg_date   DATE,
    club_apply_date DATE,
    cluber_text     VARCHAR2(400),
    club_out_text   VARCHAR2(400),
    club_out_date   DATE,
    blacklist_date  DATE,
    blacklist_text  VARCHAR2(400),
    blacklist_check CHAR(1) DEFAULT '0' NOT NULL,
    PRIMARY KEY (club_user_num)
);

CREATE TABLE club_master_board
(
    club_master_board_num NUMBER NOT NULL,
    club_num              NUMBER NOT NULL REFERENCES club (club_num),
    user_id               VARCHAR2(20) NOT NULL REFERENCES users(user_id),
    title                 VARCHAR2(100) NOT NULL,
    text                  VARCHAR2(1000) NOT NULL,
    reg_date              DATE   NOT NULL,
    update_date           DATE,
    PRIMARY KEY (club_master_board_num)
);
CREATE TABLE club_calendar_apply
(
    club_calendar_apply_num NUMBER  NOT NULL,
    club_calendar_num       NUMBER  NOT NULL REFERENCES club_calendar (club_calendar_num),
    user_id                 VARCHAR2(20) NOT NULL REFERENCES users(user_id),
    apply_status            CHAR(1) NOT NULL,
    user_image              VARCHAR2(100),
    apply_date              DATE,
    PRIMARY KEY (club_calendar_apply_num)
);

CREATE TABLE deal
(
    deal_board_num  NUMBER              NOT NULL primary key,
    deal_status     CHAR(1) DEFAULT '0' NOT NULL,
    user_id         VARCHAR2(20) REFERENCES users(user_id),
    deal_title      VARCHAR2(100) NOT NULL,
    deal_text       VARCHAR2(1000) NOT NULL,
    deal_reg_date   DATE                NOT NULL,
    product_name    VARCHAR2(100) NOT NULL,
    price           NUMBER              NOT NULL,
    tag             VARCHAR2(120),
    view_count      NUMBER              NOT NULL,
    vill_code       VARCHAR2(10) NOT NULL,
    deal_id         VARCHAR2(20),
    deal_mode_check CHAR(1) DEFAULT '0' NOT NULL,
    chat_num        NUMBER REFERENCES chat (chat_num),
    review          VARCHAR2(1000),
    review_pt       NUMBER,
    deal_end_date   DATE,
    deal_date       DATE,
    deal_location   VARCHAR2(100)
);

CREATE TABLE club_calender
(
    club_calender_num    NUMBER PRIMARY KEY,
    club_num             NUMBER references club(club_num),
    reg_date             DATE,
    calender_title       VARCHAR2(100),
    calender_text        VARCHAR2(1000),
    club_date            DATE,
    location             VARCHAR2(100),
    notice_check         VARCHAR2(100),
    notice_time          VARCHAR2(100),
    calendar_apply_check CHAR(1),
    apply_auto_check     CHAR(1)
);

CREATE TABLE likes
(
    like_num       NUMBER PRIMARY KEY,
    user_id        VARCHAR2(20) REFERENCES users(user_id),
    board_category CHAR(2),
    board_num      NUMBER,
    like_check     CHAR
);



CREATE TABLE vill_board
(
    vill_board_num NUMBER PRIMARY KEY,
    user_id        VARCHAR2(20) REFERENCES users(user_id),
    vill_code      VARCHAR2(100),
    vill_title     VARCHAR2(100),
    vill_text      VARCHAR2(1000),
    vill_tag       VARCHAR2(100),
    reg_date       DATE,
    view_count     NUMBER,
    like_count     NUMBER,
    board_category CHAR
);

CREATE TABLE comments
(
    comment_num    NUMBER PRIMARY KEY,
    user_id        VARCHAR2(20) REFERENCES users(user_id),
    club_num       NUMBER,
    board_num      NUMBER,
    board_category CHAR(2),
    comment_check  CHAR(1),
    comment_text   VARCHAR2(1000),
    reg_date       DATE
);

CREATE TABLE recomment
(
    recomment_num  NUMBER PRIMARY KEY,
    comment_num    NUMBER,
    user_id        VARCHAR2(20) REFERENCES users(user_id),
    board_category CHAR(2),
    recomment_text VARCHAR2(1000),
    reg_date       DATE
);

CREATE TABLE club_calender_review
(
    club_calender_review_num NUMBER PRIMARY KEY,
    club_calender_num        NUMBER REFERENCES club_calender (club_calender_num),
    club_num                 NUMBER REFERENCES club (club_num),
    user_id                  VARCHAR2(20) REFERENCES users(user_id),
    review_range             VARCHAR2(10),
    review_title             VARCHAR2(100),
    review_text              VARCHAR2(1000),
    reg_date                 DATE,
    view_count               NUMBER,
    like_conunt              NUMBER,
    update_date              DATE,
    board_category           CHAR(2)
);

CREATE TABLE club_calendar_apply
(
    club_calendar_apply_num NUMBER  NOT NULL,
    club_calendar_num       NUMBER  NOT NULL REFERENCES club_calendar (club_calendar_num),
    user_id                 VARCHAR2(20) NOT NULL REFERENCES users(user_id),
    apply_status            CHAR(1) NOT NULL,
    user_image              VARCHAR2(100),
    apply_date              DATE,
    PRIMARY KEY (club_calendar_apply_num)


);

DROP TABLE club_calender;
DROP TABLE vill_board;
DROP TABLE comments;
DROP TABLE recomment;
DROP TABLE club_calender_review;

CREATE TABLE club_calendar
(
    club_calendar_num    NUMBER PRIMARY KEY,
    club_num             NUMBER,
    reg_date             DATE,
    calendar_title       VARCHAR2(100),
    calendar_text        VARCHAR2(1000),
    club_date            DATE,
    location             VARCHAR2(100),
    notice_check         VARCHAR2(100),
    notice_time          VARCHAR2(100),
    calendar_apply_check CHAR(1),
    apply_auto_check     CHAR(1)
);

CREATE TABLE vill_board
(
    vill_board_num NUMBER PRIMARY KEY,
    user_id        VARCHAR2(20) REFERENCES users(user_id),
    vill_code      VARCHAR2(100),
    vill_title     VARCHAR2(100),
    vill_text      VARCHAR2(1000),
    vill_tag       VARCHAR2(100),
    reg_date       DATE,
    view_count     NUMBER,
    like_count     NUMBER,
    board_category CHAR
);

CREATE TABLE likes
(
    like_num       NUMBER PRIMARY KEY,
    user_id        VARCHAR2(20) REFERENCES users(user_id),
    board_category CHAR(2),
    board_num      NUMBER,
    like_check     CHAR
);

CREATE TABLE comments
(
    comment_num    NUMBER PRIMARY KEY,
    user_id        VARCHAR2(20) REFERENCES users(user_id),
    club_num       NUMBER,
    board_num      NUMBER,
    board_category CHAR(2),
    comment_check  CHAR(1),
    comment_text   VARCHAR2(1000),
    reg_date       DATE
);

CREATE TABLE recomment
(
    recomment_num  NUMBER PRIMARY KEY,
    comment_num    NUMBER,
    user_id        VARCHAR2(20) REFERENCES users(user_id),
    board_category CHAR(2),
    recomment_text VARCHAR2(1000),
    reg_date       DATE
);

CREATE TABLE club_calendar_review
(
    club_calendar_review_num NUMBER PRIMARY KEY,
    club_calendar_num        NUMBER REFERENCES club_calendar (club_calendar_num),
    club_num                 NUMBER REFERENCES club (club_num),
    user_id                  VARCHAR2(20) REFERENCES users(user_id),
    review_range             VARCHAR2(10),
    review_title             VARCHAR2(100),
    review_text              VARCHAR2(1000),
    reg_date                 DATE,
    view_count               NUMBER,
    like_conunt              NUMBER,
    update_date              DATE,
    board_category           CHAR(2)
);

CREATE TABLE club_calendar_apply
(
    club_calendar_apply_num NUMBER  NOT NULL,
    club_calendar_num       NUMBER  NOT NULL REFERENCES club_calendar (club_calendar_num),
    user_id                 VARCHAR2(20) NOT NULL REFERENCES users(user_id),
    apply_status            CHAR(1) NOT NULL,
    user_image              VARCHAR2(100),
    apply_date              DATE,
    PRIMARY KEY (club_calendar_apply_num)
);

CREATE TABLE deal
(
    deal_board_num  NUMBER              NOT NULL primary key,
    deal_status     CHAR(1) DEFAULT '0' NOT NULL,
    user_id         VARCHAR2(20) REFERENCES users(user_id),
    deal_title      VARCHAR2(100) NOT NULL,
    deal_text       VARCHAR2(1000) NOT NULL,
    deal_reg_date   DATE                NOT NULL,
    product_name    VARCHAR2(100) NOT NULL,
    price           NUMBER              NOT NULL,
    tag             VARCHAR2(120),
    view_count      NUMBER              NOT NULL,
    vill_code       VARCHAR2(10) NOT NULL,
    deal_id         VARCHAR2(20),
    deal_mode_check CHAR(1) DEFAULT '0' NOT NULL,
    review          VARCHAR2(1000),
    review_pt       NUMBER,
    deal_end_date   DATE,
    deal_date       DATE,
    deal_location   VARCHAR2(100)
);
CREATE TABLE chat
(
    chat_num       NUMBER  NOT NULL,
    chat_category  CHAR(1) NOT NULL,
    club_num       NUMBER REFERENCES club (club_num),
    deal_board_num NUMBER REFERENCES deal (deal_board_num),
    last_chat_date DATE,
    last_chat      VARCHAR2(1000),
    PRIMARY KEY (chat_num)
);
alter table deal
    add chat_num NUMBER REFERENCES chat (chat_num);

CREATE TABLE notice
(
    notice_num       NUMBER NOT NULL primary key,
    view_check       CHAR(1),
    user_id          VARCHAR2(20) REFERENCES users(user_id),
    notice_text      VARCHAR2(20) not null,
    notice_send_date date   not null,
    url_link         VARCHAR2(100)
);

CREATE TABLE chatter
(
    chatter_num    NUMBER NOT NULL,
    chat_num       NUMBER NOT NULL REFERENCES chat (chat_num),
    user_id        VARCHAR2(20) NOT NULL REFERENCES users(user_id),
    last_chat_date DATE,
    PRIMARY KEY (chatter_num)
);

CREATE TABLE chat_message
(
    message_num  NUMBER NOT NULL,
    chat_num     NUMBER NOT NULL REFERENCES chat (chat_num),
    user_id      VARCHAR2(20) NOT NULL REFERENCES users(user_id),
    chat_message VARCHAR2(1000),
    chat_file    VARCHAR2(100),
    chat_date    DATE   NOT NULL,
    PRIMARY KEY (message_num)
);

CREATE TABLE vote
(
    vote_num            NUMBER              NOT NULL,
    chat_num            NUMBER              NOT NULL REFERENCES chat (chat_num),
    vote_master_id      VARCHAR2(20) NOT NULL REFERENCES users(user_id),
    vote_title          VARCHAR2(30) NOT NULL,
    vote_text           VARCHAR2(200) NOT NULL,
    multi_vote_check    CHAR(1) DEFAULT '0' NOT NULL,
    hide_vote_check     CHAR(1) DEFAULT '0' NOT NULL,
    vote_end_date       DATE,
    vote_end_date_check CHAR(1) DEFAULT '0' NOT NULL,
    vote_date           DATE                NOT NULL,
    vote_end_check      CHAR(1) DEFAULT '0' NOT NULL,
    vote_item_1         VARCHAR2(30) NOT NULL,
    vote_item_2         VARCHAR2(30),
    vote_item_3         VARCHAR2(30),
    vote_item_4         VARCHAR2(30),
    vote_item_5         VARCHAR2(30),
    PRIMARY KEY (vote_num)
);

CREATE TABLE voter
(
    voter_num NUMBER NOT NULL,
    vote_num  NUMBER NOT NULL REFERENCES vote (vote_num),
    vote_item NUMBER(1) NOT NULL,
    user_id   VARCHAR2(20) NOT NULL REFERENCES users(user_id),
    PRIMARY KEY (voter_num)
);

CREATE TABLE master_board
(
    master_board_num NUMBER              NOT NULL,
    admin_id         VARCHAR2(20),
    mb_category      CHAR(1) DEFAULT '0' NOT NULL,
    mb_title         VARCHAR2(100),
    mb_text          VARCHAR2(1000),
    reg_date         DATE,
    CONSTRAINT master_board_pk PRIMARY KEY (master_board_num)
);
CREATE TABLE community_report
(
    report_num     NUMBER              NOT NULL,
    board_num      NUMBER,
    board_category CHAR(2),
    report_id      VARCHAR2(20),
    reported_id    VARCHAR2(20),
    admin_id       VARCHAR2(20),
    report_basis   CHAR(1) DEFAULT '0' NOT NULL,
    report_date    DATE,
    report_text    VARCHAR2(100),
    ppt            NUMBER(2),
    ppt_date       DATE,
    process_result VARCHAR2(20),
    CONSTRAINT community_report_pk PRIMARY KEY (report_num)
);
CREATE TABLE club_report
(
    club_report_num      NUMBER              NOT NULL,
    club_num             NUMBER REFERENCES club (club_num),
    report_id            VARCHAR2(20),
    admin_id             VARCHAR2(20),
    cr_basis             CHAR(1) DEFAULT '0' NOT NULL,
    report_date          DATE,
    report_text          VARCHAR2(100),
    process_date         DATE,
    report_result        VARCHAR2(20),
    rereport_apply_check CHAR(1) DEFAULT '0' NOT NULL,
    rereport_apply_date  DATE,
    rereport_text        VARCHAR2(200),
    rereport_result      VARCHAR2(20),
    CONSTRAINT club_report_pk PRIMARY KEY (club_report_num)
);

select *
from club_report;


CREATE SEQUENCE seq_user_inter_list_num INCREMENT BY 1 START WITH 10000;


CREATE SEQUENCE seq_files INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_club INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_club_user INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_club_master_board INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_club_calendar_apply INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_chat INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_chatter INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_chat_message INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_vote INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_voter INCREMENT BY 1 START WITH 10000;


CREATE SEQUENCE seq_deal
    INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_notice INCREMENT BY 1 START WITH 10000;


CREATE SEQUENCE seq_club_calendar increment by 1 start with 10000;
CREATE SEQUENCE seq_vill_board increment by 1 start with 10000;
CREATE SEQUENCE seq_likes increment by 1 start with 10000;
CREATE SEQUENCE seq_comments increment by 1 start with 10000;
CREATE SEQUENCE seq_recomment increment by 1 start with 10000;
CREATE SEQUENCE seq_club_calendar_review increment by 1 start with 10000;


CREATE SEQUENCE seq_master_board INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_community_report INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_club_report INCREMENT BY 1 START WITH 10000;

select *
from deal;