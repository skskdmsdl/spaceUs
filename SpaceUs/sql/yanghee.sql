--spaceus
purge recyclebin; -- bin 비우기

-----------------------------
----------- 멤버 ------------
-----------------------------
create table member(
		member_email varchar2(256),
        nickname varchar2(256) not null,
        password varchar2(300) not null,
		member_phone char(11) not null,
		birthday date,
		member_regdate date default sysdate,
		attendance_cnt number default 0,
		constraints pk_member_email primary key(member_email)
);

select * from member;

--권한 컬럼 삭제
ALTER TABLE member DROP COLUMN authority;

-----------------------------
----------- 권한 ------------
-----------------------------

create table auth (
    member_email varchar2(256) not null,
    authority varchar2(20) default 'ROLE_USER',
    constraint pk_auth primary key(member_email, authority),
    constraint fk_auth_member_email foreign key(member_email) references member(member_email),
    constraints ck_authority check(authority in ('ROLE_USER','ROLE_HOST','ROLE_ADMIN'))
);

select * from auth;

-----------------------------
---------- 카테고리 ----------
-----------------------------
create table category (
	category_no varchar2(256) not null,
	category_name varchar2(300) not null,

	constraints pk_category_no primary key(category_no)
);

create sequence seq_category_no;

select * from category;

-----------------------------
--------- 공간목록 ----------
-----------------------------

CREATE TABLE space (
    space_no	varchar2(256)	,
    category_no	varchar2(256)	NOT NULL,
    member_email	varchar2(256)	NOT NULL,
    business_license	number	NOT NULL,
    space_name	varchar2(256)	NOT NULL,
    address	varchar2(256)	NOT NULL,
    space_phone	char(11)	NOT NULL,
    hourly_price	number	NOT NULL,
    star_avg	number	NULL,
    registration_date	date	default sysdate,
    modification_date	date	NULL,
    views	number	NULL,
    like_cnt	number	NULL,
    status	char(1)	default 'S',
    account	number	NOT NULL,
    constraints pk_review_no primary key(space_no),
    constraints fk_category_no foreign key(category_no) references category(category_no) on delete set null,
    constraints fk_member_email foreign key(member_email) references member(member_email) on delete set null,
    constraints ck_status check(status in ('O','C','S'))
);

create sequence seq_space_no;
select * from space;

--제약조건명 변경
alter table space rename constraint pk_review_no to pk_space_no;
commit;

-----------------------------
-------- 공간첨부파일 --------
-----------------------------
create table space_image (
    file_no varchar2(256),
    space_no varchar2(20) not null,
    original_filename varchar2(256) not null,
    renamed_filename varchar2(256) not null,
    upload_date date default sysdate,
    status number default 1,
    constraint pk_file_no primary key(file_no),
    constraint fk_attachment_no foreign key(space_no)
    references space(space_no)
    on delete cascade,
    constraint ck_space_image_status check(status in (0,1))
);

select * from space_image;
create sequence seq_space_image_no;

-----------------------------
---------- 예약 -------------
-----------------------------

CREATE TABLE Reservation (
	rev_no	varchar2(256)		NOT NULL,
	member_email	varchar2(256)		NULL,
	space_no	varchar2(256)		NULL,
	rev_date	date		NOT NULL,
	day	date		NOT NULL,
	start_hours	date		NULL,
	end_hours	date		NULL,
	total_price	number		NULL,
	rev_cancle	number		default 0,
	rev_comple	number		default 0,
	constraints pk_R_rev_no primary key(rev_no),
	constraints fk_R_member foreign key (member_email) 
                                     references space(space_no)
                                     on delete set null,
	constraints fk_R_space foreign key (space_no) 
                                     references member(member_email)
                                     on delete set null,
	constraints ck_R_cancle check(rev_cancle in (0, 1)),
	constraints ck_R_comple check(rev_comple in (0, 1))
);


create sequence seq_rev_no;
select * from reservation;

-----------------------------
---- 공간별 예약가능 시간 ----
-----------------------------

CREATE TABLE Reservation_avail (
	day	varchar2(256)		NOT NULL,
	space_no	varchar2(256)		NOT NULL,
	start_hours	date		NOT NULL,
	end_hours	date		NOT NULL,
	constraints pk_R_avail_day primary key(day, space_no),
	constraints fk_R_avail_space foreign key (space_no) 
                                     references space(space_no)
                                     on delete set null
);


select * from reservation_avail;


-----------------------------
----------- 옵션 ------------
-----------------------------

create table option_list (
	option_no varchar2(256),
	option_name varchar2(300) not null,

	constraints pk_option_no primary key(option_no)
);

create sequence seq_option_no;
select * from option_list;


-----------------------------
--------- 공간 옵션 ----------
-----------------------------

create table space_option (
	space_no varchar2(256),
	option_no varchar2(256),
	constraints pk_space_option primary key(space_no, option_no),
	constraints fk_space_no foreign key(space_no) references space(space_no)  on delete cascade,
	constraints fk_option_no foreign key(option_no) references option_list(option_no)  on delete cascade
);

select * from space_option;

-----------------------------
----------- 태그 ------------
-----------------------------

CREATE TABLE Tag (
    tag_no varchar2(256) NOT NULL, --number 변경?
    tag_name varchar2(256) NOT NULL,
    constraints pk_tag primary key(tag_no),
    constraints uq_tag_name unique(tag_name)
);

create sequence seq_tag_no;

select * from tag;


-----------------------------
------ 공간태그테이블 --------
-----------------------------
CREATE TABLE Space_tag (
    space_no varchar2(256) NOT NULL, 
    tag_no varchar2(256) NOT NULL,
    constraints pk_tag_no primary key(space_no, tag_no),
    constraints fk_tag_space_no foreign key(space_no) references space(space_no) on delete cascade,
    constraints fk_tag_no foreign key(tag_no) references tag(tag_no) on delete cascade
);

create sequence seq_space_tag_no;

select * from space_tag;



-----------------------------
----------- QnA -------------
-----------------------------
create table qna(
  qna_no varchar2(256),
  space_no varchar2(256) not null,
  member_email varchar2(256) not null,
  nickname varchar2(256) not null,
  qna_pw varchar2(300) not null,
  qna_content varchar2(2000) not null,
  qna_answer varchar2(2000),
  qna_date date default sysdate,
  qna_status number default 0,
  constraint pk_qna_no primary key(qna_no),
  constraint fk_qna_space_no foreign key(space_no) references space(space_no) on delete set null,
  constraint fk_qna_email foreign key(member_email) references member(member_email)
);

create sequence seq_qna_no;
select * from qna;

-----------------------------
----------- 리뷰 ------------
-----------------------------

CREATE TABLE Review (
    review_no varchar2(256),
    space_no varchar2(256),
    rev_no varchar2(256) NOT NULL,
    nickname varchar2(256),
    review_level number default 1,
    star_rating number NOT NULL,
    review_content varchar2(2000) NOT NULL,
    review_date date default sysdate,
    constraints pk_review_no primary key(review_no),
    constraints fk_review_space_no foreign key(space_no) references space(space_no) on delete set null,
    constraints fk_review_rev_no foreign key(rev_no) references reservation(rev_no) on delete cascade,
    constraints ck_star_rating check(star_rating in (1, 2, 3, 4, 5))
);

create sequence seq_review_no;

select * from review;

select table_name,constraint_name
from user_constraints;

select * from user_indexes;
--인덱스명변경
ALTER INDEX pk_review_no RENAME TO pk_space_no;

-----------------------------
-------- 리뷰 이미지 ---------
-----------------------------

CREATE TABLE Review_image (
    re_img_no varchar2(256),
    review_no varchar2(20),
    re_original_filename varchar2(256) NOT NULL,
    re_renamed_filename varchar2(256) NOT NULL,
    re_reg_date date default sysdate,
    re_img_status number default 1,
    constraints pk_re_img_no primary key(re_img_no),
    constraints fk_review_no foreign key(review_no) references review(review_no) on delete cascade,
    constraints ck_re_img_status check(re_img_status in(0, 1))
);

create sequence seq_review_image_no;

select * from review_image;


-----------------------------
--------- 구인구직 ----------
-----------------------------

create table recruit (
    recruit_no varchar2(256),
    member_email varchar2(256),
    nickname varchar2(256), 
    header char(10) NOT NULL,
    view_cnt number default 0,
    report_cnt number default 0,
    constraints pk_recruit_no primary key(recruit_no),
    constraints fk_recruit_email foreign key(member_email) references member(member_email) on delete set null,
    constraints ck_header check(header in ('구인', '구직'))
);

create sequence seq_recruit_no;

select * from recruit;

-----------------------------
--------- 구인구직댓글 ----------
-----------------------------

create table recruit_comment (
    recruit_comment_no varchar2(256),
    writer varchar2(256),
    recruit_ref varchar2(20),
    private number default 0,
    recruit_comment_ref varchar2(20),
    recruit_comment_content varchar2(2000),
    recruit_comment_level number default 1,
    recruit_comment_date date default sysdate,
    
    constraints pk_recruit_comment_no primary key(recruit_comment_no),
    constraints fk_recruit_ref foreign key(recruit_ref) references recruit(recruit_no) on delete cascade,
    constraints fk_recruit_comment_ref foreign key(recruit_comment_ref) references recruit_comment(recruit_comment_no) on delete cascade,
    constraints ck_private check(private in (0,1))
);

create sequence seq_recruit_comment_no;

select * from recruit_comment;

-----------------------------
--------- 게시판분류 ---------
-----------------------------
create table board (
	board_no varchar2(256) not null,
    board_ref varchar2(256),
	board_name varchar2(256) not null,
    board_level number default 1, --상위 게시판 1 / 하위 게시판 2

	constraints pk_board_no primary key(board_no),
    constraints fk_board_ref foreign key(board_ref) references board(board_no)
);




create sequence seq_board_no;

insert into board values ('BOARD'||seq_board_no.nextval,NULL,'함께할 사람을 찾습니다',1);
insert into board values ('BOARD'||seq_board_no.nextval,'BOARD6','바리스타 모임',2);
insert into board values ('BOARD'||seq_board_no.nextval,'BOARD6','영화 모임',2);
insert into board values ('BOARD'||seq_board_no.nextval,'BOARD6','먹방 모임',2);
insert into board values ('BOARD'||seq_board_no.nextval,NULL,'공간을 같이 쓸 사람을 찾습니다',1);
insert into board values ('BOARD'||seq_board_no.nextval,'BOARD11','카페',2);
insert into board values ('BOARD'||seq_board_no.nextval,'BOARD11','식당',2);
insert into board values ('BOARD'||seq_board_no.nextval,NULL,'소모임 자랑하기',1);

commit;

delete board where board_no = 4;

select * from board;

-----------------------------
----------- 소모임 ----------
-----------------------------
create table group_board (
	group_board_no varchar2(256), --소모임 게시판 pk 번호
	board_no varchar2(256), --소모임 게시판 분류 번호
	member_email varchar2(256), --멤버 이메일 fk
	view_cnt number default 0, --조회수
	group_board_title varchar2(256) not null, --소모임 게시판 제목
	group_board_content varchar2(1000) not null, --소모임 게시판 내용
	report_cnt number default 0, --소모임 신고횟수

	constraints pk_group_board_no primary key(group_board_no),
	constraints fk_board_no foreign key(board_no) references board(board_no) on delete set null,
	constraints fk_gorup_board_member_email foreign key(member_email) references member(member_email) on delete set null
);

alter table group_board add group_board_date date default sysdate;

create sequence seq_group_board_no;

insert into group_board values('G'||seq_group_board_no.nextval,'BOARD8','honggd@naver.com',default,'바리스타 관심있나요?','바리스타에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다',default);
insert into group_board values('G'||seq_group_board_no.nextval,'BOARD8','honggd@naver.com',default,'커피 관심있나요?','커피에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다',default);
insert into group_board values('G'||seq_group_board_no.nextval,'BOARD9','honggd@naver.com',default,'영화 관심있나요?','영화에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다',default);
insert into group_board values('G'||seq_group_board_no.nextval,'BOARD9','honggd@naver.com',default,'영화관 관심있나요?','영화관에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다',default);
insert into group_board values('G'||seq_group_board_no.nextval,'BOARD10','honggd@naver.com',default,'먹방 관심있나요?','먹방에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다',default);
insert into group_board values('G'||seq_group_board_no.nextval,'BOARD10','honggd@naver.com',default,'돼지 관심있나요?','돼지에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다',default);
insert into group_board values('G'||seq_group_board_no.nextval,'BOARD12','honggd@naver.com',default,'카페바 관심있나요?','카페바에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다',default);
insert into group_board values('G'||seq_group_board_no.nextval,'BOARD13','honggd@naver.com',default,'오돌뼈 관심있나요?','오돌뼈에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다',default);
insert into group_board values('G'||seq_group_board_no.nextval,'BOARD14','honggd@naver.com',default,'댄스파티 관심있나요?','댄스파티에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다',default);
insert into group_board values('G'||seq_group_board_no.nextval,'BOARD14','honggd@naver.com',default,'어학공부 관심있나요?','프랑스어에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다',default);

select * from group_board;

delete from group_board where member_email = 'honggd@naver.com';
drop sequence seq_group_board_no;

commit;

--9/24---------------------------------------







-----------------9/24-------------------------

-----------------------------
--------- 소모임댓글 ---------
-----------------------------
create table group_board_comment (
	group_board_comment_no varchar2(256),
	writer varchar2(256),
	group_board_ref varchar2(256),
	private number default 0,
	group_board_comment_ref varchar2(256),
	group_board_content varchar2(2000),
	group_board_comment_level number default 1,
	group_board_date date default sysdate,
	 	

	constraints pk_group_board_comment_no primary key(group_board_comment_no),
	constraints fk_group_board_ref foreign key(group_board_ref) references group_board(group_board_no) on delete set null,
	constraints fk_group_board_comment_ref foreign key(group_board_comment_ref) references group_board_comment(group_board_comment_no) on delete set null,
	constraints ck_gorup_board_private check(private in(0,1))
);

create sequence seq_group_board_comment_no;

select * from group_board_comment;

drop table group_board_comment;

-----------------------------
--------- 블랙리스트 --------
-----------------------------

create table blackList (
    blackList_no varchar2(256),
    member_email varchar2(15),
    board_type char(1),
    report_board_no varchar2(256),
    constraints pk_blackList_no primary key(blackList_no),
    constraints fk_blacklist_email foreign key(member_email) references member(member_email) on delete set null,
    constraints ck_board_type check(board_type in ('R', 'G'))
);

create sequence seq_blacklist_no;
select * from blacklist;

-----------------------------
---------- 기획전 -----------
-----------------------------

create table exhibition (
    ex_title varchar2(256) not null,
    ex_subtitle varchar2(256) not null,
    tag varchar2(100) not null
);



select * from exhibition;



-----------------------------
---- 좋아요(위시리스트) ------
-----------------------------

create table wish(
    space_no varchar(256) not null,
    member_email varchar(256) not null,
    like_date date not null,
    
    constraints fk_wish_email foreign key(member_email) references member(member_email) on delete cascade,
    constraints fk_wish_space_no foreign key(space_no) references space(space_no)

);

select * from wish;


-----------------------------
----------- 쿠폰 ------------
-----------------------------
create table coupon(
    coupon_no varchar2(256),
    coupon_type char(2),
    member_email varchar2(256) not null,
    discount_rate number not null,
    coupon_issued_date date default sysdate,
    coupon_deadline date,
    coupon_status number default 1,
    constraint pk_coupon_no primary key(coupon_no),
    constraint fk_coupon_email foreign key(member_email) references member(member_email) on delete cascade,
    constraint ck_coupon_status check(coupon_status in(1, 0))
);

create sequence seq_coupon_no;

select * from coupon;




-----------------------------
--------- 비속어필터 ---------
-----------------------------

create table slang_filter(
    slang_no varchar2(20) NOT NULL,
    slang varchar2(256),
    constraints pk_slang_no primary key(slang_no)
);

create sequence seq_slang_no;
select * from slang_filter;



-----------------------------
------- 일별 정산내역 --------
-----------------------------
create table daily_sale(
  daily_sale_no varchar2(256),
  space_no varchar2(256) not null,
  settlement_date date default sysdate, --날짜
  daily_total_hour number not null,
  daily_revenue number not null, --일별 총 매출
  
  constraint fk_ds_space_no foreign key(space_no) references space(space_no) on delete set null,
  constraint pk_ds_sale_no primary key(daily_sale_no)

);

create sequence seq_daily_sale_no;

select * from daily_sale;


-----------------------------
------- 월별 정산내역 --------
-----------------------------
create table monthly_sale(
  monthly_sale_no varchar2(256),
  space_no varchar2(256) not null,
  settlement_month number, --연도+월,
  monthly_total_hour number not null,
  monthly_revenue number not null, --월별 총 매출
  
  constraint fk_ms_space_no foreign key(space_no) references space(space_no) on delete set null,
  constraint pk_ms_sale_no primary key(monthly_sale_no)
  
);
create sequence seq_monthly_sale_no;
select * from monthly_sale;


-----------------------------
------ 연도별 정산내역 -------
-----------------------------

create table yearly_sale(
    year_sale_no varchar2(256) ,
    space_no varchar2(256) NOT NULL,
    year number NOT NULL,
    year_total_hour number NOT NULL,
    year_total_sale number NOT NULL,
    constraints pk_year_sale_no primary key(year_sale_no),
    constraints fk_yearly_space_no foreign key(space_no) references space(space_no) on delete set null
);

create sequence seq_year_sale;






-------------------------------조회

--모든 테이블 조회
select * from user_tables;


select * from member;
select * from space;
select * from category;
select * from space_image;
select * from reservation;
select * from reservation_avail;
select * from space_option;
select * from option_list;
select * from space_tag;
select * from tag;
select * from qna;
select * from review;
select * from review_image;
select * from recruit;
select * from recruit_comment;
select * from blacklist;
select * from exhibition;
select * from wish;
select * from coupon;
select * from slang_filter;
select * from daily_sale;
select * from monthly_sale;
select * from yearly_sale;

commit;