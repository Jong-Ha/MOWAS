======================================================
테이블 삭제
======================================================

DROP TABLE voter;
DROP TABLE vote;
DROP TABLE chat_message;
DROP TABLE chatter;
DROP TABLE chat;
DROP TABLE club_calendar_apply;
DROP TABLE club_master_board;
DROP TABLE club_user;


DROP TABLE deal;
DROP TABLE notice;

DROP TABLE recomment;
DROP TABLE comments;
DROP TABLE club_calendar_review;
DROP TABLE vill_board;
DROP TABLE likes;
DROP TABLE files;

DROP TABLE master_board;
DROP TABLE community_report;
DROP TABLE club_report;

DROP TABLE user_inter_list;
DROP TABLE club_calendar;
DROP TABLE club;
DROP TABLE users;

=========================================================
시퀀스 삭제
=========================================================
DROP SEQUENCE seq_user_inter_list_num;

DROP SEQUENCE seq_files;
DROP SEQUENCE seq_club;
DROP SEQUENCE seq_club_user;
DROP SEQUENCE seq_club_master_board;
DROP SEQUENCE seq_club_calendar_apply;
DROP SEQUENCE seq_chat;
DROP SEQUENCE seq_chatter;
DROP SEQUENCE seq_chat_message;
DROP SEQUENCE seq_vote;
DROP SEQUENCE seq_voter;

DROP SEQUENCE seq_deal;
DROP SEQUENCE seq_notice;

DROP SEQUENCE seq_club_calendar;
DROP SEQUENCE seq_vill_board;
DROP SEQUENCE seq_likes;
DROP SEQUENCE seq_comments;
DROP SEQUENCE seq_recomment;
DROP SEQUENCE seq_club_calendar_review;

DROP SEQUENCE seq_master_board;
DROP SEQUENCE seq_community_report;
DROP SEQUENCE seq_club_report;

======================================================
시퀀스 생성
======================================================

CREATE SEQUENCE seq_user_inter_list_num	INCREMENT BY 1 START WITH 10000;

CREATE SEQUENCE seq_files				INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_club				INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_club_user			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_club_master_board		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_club_calendar_apply		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_chat				INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_chatter			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_chat_message			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_vote				INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_voter			INCREMENT BY 1 START WITH 10000;

CREATE SEQUENCE seq_deal
    INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_notice			INCREMENT BY 1 START WITH 10000;

CREATE  SEQUENCE seq_club_calendar increment by 1 start with 10000;
CREATE  SEQUENCE seq_vill_board increment by 1 start with 10000;
CREATE  SEQUENCE seq_likes increment by 1 start with 10000;
CREATE  SEQUENCE seq_comments increment by 1 start with 10000;
CREATE  SEQUENCE seq_recomment increment by 1 start with 10000;
CREATE  SEQUENCE seq_club_calendar_review increment by 1 start with 10000;

CREATE SEQUENCE seq_master_board 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_community_report 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_club_report 	INCREMENT BY 1 START WITH 10000;

========================================================
회원
========================================================
create table users
(
    user_id      varchar2(20) primary key not null ,
    master_check char(1)       not null,
    user_status  char(1) ,
    password     varchar2(50)  not null,
    user_name    varchar2(50)  not null,
    rrd          varchar2(20) unique not null,
    gender       varchar2(20)  not null,
    email        varchar2(100),
    phone        varchar2(20),
    vill_code    varchar2(100) not null,
    user_image   varchar2(100),
    lcd          date,
    login_check  char(1),
    psd          date,
    ped          date,
    ppt          number,
    review_pt    number
);

create table user_inter_list(
                                user_inter_list_num number not null primary key ,
                                user_id varchar2(20) references USERS(user_id) ,
                                inter_list char(2)
);

========================================================
모임
========================================================

CREATE TABLE files (
                       file_num 			NUMBER	NOT NULL,
                       board_num		NUMBER		NOT NULL,
                       board_category 		CHAR(2)	NOT NULL,
                       file_name 			VARCHAR2(100) NOT NULL,
                       PRIMARY KEY(file_num)
);

CREATE TABLE club (
                      club_num 			NUMBER	NOT NULL,
                      club_master_id 			VARCHAR2(20)		NOT NULL REFERENCES users(user_id),
                      inter_list 				CHAR(2)	NOT NULL,
                      club_name 					VARCHAR2(50) NOT NULL,
                      club_text					VARCHAR2(1000) NOT NULL,
                      vill_code 					VARCHAR2(100) NOT NULL,
                      current_cluber 				NUMBER(2) DEFAULT 1 NOT NULL,
                      max_cluber 					NUMBER(2) DEFAULT 25 NOT NULL,
                      club_create_date 				DATE NOT NULL,
                      club_image 				VARCHAR2(100),
                      gather_check				CHAR(1) DEFAULT '0' NOT NULL,
                      club_tag				VARCHAR2(120),
                      club_delete_check				CHAR(1) DEFAULT '0' NOT NULL,
                      PRIMARY KEY(club_num)
);

CREATE TABLE club_user (
                           club_user_num 		NUMBER	NOT NULL,
                           user_id 			VARCHAR2(20)		NOT NULL REFERENCES users(user_id),
                           user_image		VARCHAR2(100) NOT NULL,
                           club_num 		NUMBER	NOT NULL REFERENCES club(club_num),
                           cluber_status		CHAR(1)	NOT NULL,
                           club_reg_date 		DATE,
                           club_apply_date 		DATE,
                           cluber_text 		VARCHAR2(400),
                           club_out_text 		VARCHAR2(400),
                           club_out_date 		DATE,
                           blacklist_date		DATE,
                           blacklist_text		VARCHAR2(400),
                           blacklist_check		CHAR(1) DEFAULT '0' NOT NULL,
                           PRIMARY KEY(club_user_num)
);

CREATE TABLE club_master_board(
                                  club_master_board_num 		NUMBER	NOT NULL,
                                  club_num 			NUMBER		NOT NULL REFERENCES club(club_num),
                                  user_id 				VARCHAR2(20)		NOT NULL REFERENCES users(user_id),
                                  title 				VARCHAR2(100) NOT NULL,
                                  text				VARCHAR2(1000) NOT NULL,
                                  reg_date 				DATE NOT NULL,
                                  update_date 			DATE,
                                  PRIMARY KEY(club_master_board_num)
);


========================================================
거래
========================================================

CREATE TABLE deal(
                     deal_board_num		NUMBER NOT NULL primary key,
                     board_category    		CHAR(2) NOT NULL,
                     deal_status 			CHAR(1) DEFAULT '0' NOT NULL,
                     user_id			VARCHAR2(20) REFERENCES users(user_id),
                     deal_title			VARCHAR2(100) NOT NULL,
                     deal_text			VARCHAR2(1000) NOT NULL,
                     deal_reg_date		DATE NOT NULL,
                     product_name		VARCHAR2(100) NOT NULL,
                     price			NUMBER NOT NULL,
                     tag			VARCHAR2(120),
                     view_count			NUMBER	NOT NULL,
                     vill_code			VARCHAR2(10) NOT NULL,
                     deal_id			VARCHAR2(20),
                     deal_mode_check		CHAR(1) DEFAULT '0' NOT NULL,
                     chat_num		NUMBER,
                     review              VARCHAR2(1000),
                     review_pt           NUMBER,
                     deal_end_date   DATE,
                     deal_date   DATE,
                     deal_location VARCHAR2(100)
);


========================================================
일정
========================================================

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

CREATE TABLE club_calendar_apply (
                                     club_calendar_apply_num 		NUMBER	NOT NULL,
                                     club_calendar_num 		NUMBER	NOT NULL REFERENCES club_calendar(club_calendar_num),
                                     user_id 				VARCHAR2(20)		NOT NULL REFERENCES users(user_id),
                                     apply_status 			CHAR(1) NOT NULL,
                                     user_image			VARCHAR2(100),
                                     apply_date 			DATE,
                                     PRIMARY KEY(club_calendar_apply_num)
);

CREATE TABLE vill_board(
                           vill_board_num NUMBER PRIMARY KEY,
                           user_id VARCHAR2(20) REFERENCES users(user_id),
                           vill_code VARCHAR2(100),
                           vill_title VARCHAR2(100),
                           vill_text VARCHAR2(1000),
                           vill_tag VARCHAR2(100),
                           reg_date DATE,
                           view_count NUMBER,
                           like_count NUMBER,
                           board_category CHAR,
                           files VARCHAR2(100)
);

CREATE TABLE likes(
                      like_num NUMBER PRIMARY KEY,
                      user_id VARCHAR2(20) REFERENCES users(user_id),
                      board_category CHAR(2),
                      board_num NUMBER,
                      like_check CHAR
);

CREATE TABLE comments(
                         comment_num NUMBER PRIMARY KEY,
                         user_id VARCHAR2(20) REFERENCES users(user_id),
                         club_num NUMBER,
                         board_num NUMBER,
                         board_category CHAR(2),
                         comment_check CHAR(1),
                         comment_text VARCHAR2(1000),
                         reg_date DATE
);

CREATE  TABLE recomment(
                           recomment_num NUMBER PRIMARY KEY ,
                           comment_num NUMBER,
                           user_id VARCHAR2(20) REFERENCES users(user_id),
                           board_category CHAR(2),
                           recomment_text VARCHAR2(1000),
                           reg_date DATE
);

CREATE TABLE club_calendar_review(
                                     club_calendar_review_num NUMBER PRIMARY KEY ,
                                     club_calendar_num NUMBER REFERENCES club_calendar(club_calendar_num),
                                     club_num NUMBER REFERENCES club( club_num),
                                     user_id VARCHAR2(20) REFERENCES users(user_id),
                                     review_range VARCHAR2(10),
                                     review_title VARCHAR2(100),
                                     review_text VARCHAR2(1000),
                                     reg_date DATE,
                                     view_count NUMBER,
                                     like_conunt NUMBER,
                                     update_date DATE,
                                     board_category CHAR(2),
                                     files VARCHAR2(100)
);
==========================================================
알림
==========================================================
CREATE TABLE notice(
                       notice_num      NUMBER NOT NULL primary key ,
                       view_check      CHAR(1) ,
                       user_id         VARCHAR2(20) REFERENCES users(user_id),
                       notice_text     VARCHAR2(20) not null ,
                       notice_send_date    date not null,
                       url_link        VARCHAR2(100)
);

==========================================================
채팅
==========================================================
CREATE TABLE chat (
                      chat_num 			NUMBER	NOT NULL,
                      chat_category 			CHAR(1)		NOT NULL,
                      club_num 				NUMBER REFERENCES club(club_num),
                      deal_board_num 			NUMBER,
                      last_chat_date			DATE,
                      last_chat 				VARCHAR2(1000),
                      PRIMARY KEY(chat_num)
);

alter table deal 	modify	chat_num NUMBER REFERENCES chat(chat_num);
alter table chat modify deal_board_num       NUMBER  REFERENCES deal(deal_board_num);



CREATE TABLE chatter (
                         chatter_num 			NUMBER	NOT NULL,
                         chat_num 			NUMBER	NOT NULL REFERENCES chat(chat_num),
                         user_id 				VARCHAR2(20)		NOT NULL REFERENCES users(user_id),
                         last_chat_date 			DATE,
                         PRIMARY KEY(chatter_num)
);

CREATE TABLE chat_message (
                              message_num 			NUMBER	NOT NULL,
                              chat_num 			NUMBER		NOT NULL REFERENCES chat(chat_num),
                              user_id 				VARCHAR2(20)		NOT NULL REFERENCES users(user_id),
                              chat_message 			VARCHAR2(1000),
                              chat_file				VARCHAR2(100),
                              chat_date 			DATE NOT NULL,
                              PRIMARY KEY(message_num)
);

CREATE TABLE vote (
                      vote_num 		NUMBER	NOT NULL,
                      chat_num			NUMBER NOT NULL REFERENCES chat(chat_num),
                      vote_master_id 		VARCHAR2(20)		NOT NULL REFERENCES users(user_id),
                      vote_title 		VARCHAR2(30) NOT NULL,
                      vote_text			VARCHAR2(200) NOT NULL,
                      multi_vote_check 		CHAR(1) DEFAULT '0' NOT NULL,
                      hide_vote_check 		CHAR(1) DEFAULT '0' NOT NULL,
                      vote_end_date 		DATE,
                      vote_end_date_check	CHAR(1) DEFAULT '0' NOT NULL,
                      vote_date 		DATE NOT NULL,
                      vote_end_check		CHAR(1) DEFAULT '0' NOT NULL,
                      vote_item_1		VARCHAR2(30) NOT NULL,
                      vote_item_2		VARCHAR2(30),
                      vote_item_3		VARCHAR2(30),
                      vote_item_4		VARCHAR2(30),
                      vote_item_5		VARCHAR2(30),
                      PRIMARY KEY(vote_num)
);

CREATE TABLE voter (
                       voter_num 			NUMBER	NOT NULL,
                       vote_num 			NUMBER		NOT NULL REFERENCES vote(vote_num),
                       vote_item 			NUMBER(1)	NOT NULL,
                       user_id 				VARCHAR2(20)		NOT NULL REFERENCES users(user_id),
                       PRIMARY KEY(voter_num)
);

=========================================================
커뮤니티
=========================================================

CREATE TABLE master_board
(
    master_board_num	NUMBER	NOT NULL,
    admin_id			VARCHAR2(20),
    mb_category			CHAR(1) DEFAULT '0' NOT NULL,
    mb_title			VARCHAR2(100),
    mb_text			VARCHAR2(1000),
    reg_date			DATE,
    CONSTRAINT master_board_pk PRIMARY KEY (master_board_num)
);
CREATE TABLE community_report
(
    report_num			NUMBER	NOT NULL,
    board_num			NUMBER,
    board_category		CHAR(2),
    report_id			VARCHAR2(20),
    reported_id			VARCHAR2(20),
    admin_id			VARCHAR2(20),
    report_basis		CHAR(1) DEFAULT '0' NOT NULL,
    report_date			DATE,
    report_text			VARCHAR2(100),
    ppt				NUMBER(2),
    ppt_date			DATE,
    process_result		VARCHAR2(20),
    CONSTRAINT community_report_pk PRIMARY KEY (report_num)
);
CREATE TABLE club_report
(
    club_report_num		NUMBER	NOT NULL,
    club_num			NUMBER REFERENCES club(club_num),
    report_id			VARCHAR2(20),
    admin_id			VARCHAR2(20),
    cr_basis			CHAR(1) DEFAULT '0' NOT NULL,
    report_date			DATE,
    report_text			VARCHAR2(100),
    process_date		DATE,
    report_result		VARCHAR2(20),
    rereport_apply_check	CHAR(1) DEFAULT '0' NOT NULL,
    rereport_apply_date		DATE,
    rereport_text		VARCHAR2(200),
    rereport_result		VARCHAR2(20),
    CONSTRAINT club_report_pk PRIMARY KEY (club_report_num)
);

commit;



