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
-- 10/13 일 추가
commit;
select * from member order by member_regdate desc;
delete from member where member_email='user17@naver.com';
insert into member values('user11@naver.com','유저11','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-09',default,0,default);
insert into member values('user12@naver.com','유저12','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-01',default,0,default);
insert into member values('user13@naver.com','유저13','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-09',default,0,default);
insert into member values('user14@naver.com','유저14','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-09',default,0,default);
insert into member values('user15@naver.com','유저15','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-09',default,0,default);
insert into member values('user16@naver.com','유저16','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-09',default,0,default);
insert into member values('user17@naver.com','유저17','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01012341234','1990-10-09',default,0,default);
insert into member values('user18@naver.com','유저18','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-11',default,0,default);
insert into member values('user19@naver.com','유저19','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-23',default,0,default);
insert into member values('user20@naver.com','유저20','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-19',default,0,default);

insert into member values('user21@naver.com','유저21','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-19',default,0,default);
insert into member values('user22@naver.com','유저22','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-18',default,0,default);
insert into member values('user23@naver.com','유저23','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-17',default,0,default);
insert into member values('user24@naver.com','유저24','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-30',default,0,default);
insert into member values('user25@naver.com','유저25','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-12',default,0,default);
insert into member values('user26@naver.com','유저26','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-13',default,0,default);
insert into member values('user27@naver.com','유저27','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-14',default,0,default);
insert into member values('user28@naver.com','유저28','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-15',default,0,default);
insert into member values('user29@naver.com','유저29','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-16',default,0,default);
insert into member values('user30@naver.com','유저30','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01048179843','1990-10-17',default,0,default);

select * from member where member_phone = '01048179843';
select * from auth where member_email='rhkim10@naver.com';
update member set member_phone='01045674567' where member_phone='01048179843';
commit;

update member set password = '$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu' where member_email = 'admin@spaceus.com';

delete from member where member_email='rhkim999@gmail.com';
delete from auth where member_email='rhkim999@gmail.com';
select * from tag;
select * from exhibition;
delete from exhibition where ex_no='90';

commit;

select
    M.member_email,
    M.nickname,
    M.member_phone,
    M.member_regdate,
    A.authority
from 
    member M join auth A
            on M.member_email = A.member_email;

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

commit;

insert into auth values('yang@naver.com',default);
insert into auth values('user1@naver.com',default);
insert into auth values('user2@naver.com',default);
insert into auth values('user3@naver.com',default);
insert into auth values('user4@naver.com',default);
insert into auth values('user5@naver.com',default);
insert into auth values('user6@naver.com',default);
insert into auth values('user7@naver.com',default);
insert into auth values('user8@naver.com',default);
insert into auth values('user9@naver.com',default);
insert into auth values('user10@naver.com',default);

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
    space_no	varchar2(256),
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

update recruit set report_cnt = report_cnt +8 where recruit_no = 'R21';

create sequence seq_recruit_no;

select * from recruit;
select * from blacklist;
select 
		    B.report_board_no,
		    R.member_email,
		    R.title as group_board_title,
		    R.enroll_date as group_board_date
		from blacklist B join member M
		                on B.member_email = M.member_email
		                 join recruit R
		                on B.report_board_no = R.recruit_no
		where B.board_type='R';

COMMIT;
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

alter table recruit_comment rename column private to secret;

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

insert into board values (seq_board_no.nextval,NULL,'함께할 사람을 찾습니다',1);
insert into board values (seq_board_no.nextval,'1','바리스타 모임',2);
insert into board values (seq_board_no.nextval,'1','영화 모임',2);
insert into board values (seq_board_no.nextval,'1','먹방 모임',2);
insert into board values (seq_board_no.nextval,NULL,'공간을 같이 쓸 사람을 찾습니다',1);
insert into board values (seq_board_no.nextval,'5','카페',2);
insert into board values (seq_board_no.nextval,'5','식당',2);
insert into board values (seq_board_no.nextval,NULL,'소모임 자랑하기',1);
insert into board values (seq_board_no.nextval,'8','니니즈 모임',2);

commit;

drop sequence seq_board_no;
delete from board where board_no =10;

select * 
from board 
order by board_no asc; 

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
alter table group_board alter column group_board_content CLOB;
alter table group_board drop column group_board_content;
alter table group_board add(group_board_content clob);

create sequence seq_group_board_no;

insert into group_board values('G'||seq_group_board_no.nextval,'2','honggd@naver.com',default,'바리스타 관심있나요?',default,default,'바리스타에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다');
insert into group_board values('G'||seq_group_board_no.nextval,'2','honggd@naver.com',default,'커피 관심있나요?',default,default,'커피에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다');
insert into group_board values('G'||seq_group_board_no.nextval,'3','honggd@naver.com',default,'영화 관심있나요?',default,default,'영화에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다');
insert into group_board values('G'||seq_group_board_no.nextval,'3','honggd@naver.com',default,'영화관 관심있나요?',default,default,'영화관에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다');
insert into group_board values('G'||seq_group_board_no.nextval,'4','honggd@naver.com',default,'먹방 관심있나요?',default,default,'먹방에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다');
insert into group_board values('G'||seq_group_board_no.nextval,'4','honggd@naver.com',default,'돼지 관심있나요?',default,default,'돼지에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다');
insert into group_board values('G'||seq_group_board_no.nextval,'6','honggd@naver.com',default,'카페바 관심있나요?',default,default,'카페바에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다');
insert into group_board values('G'||seq_group_board_no.nextval,'7','honggd@naver.com',default,'오돌뼈 관심있나요?',default,default,'오돌뼈에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다');
insert into group_board values('G'||seq_group_board_no.nextval,'9','honggd@naver.com',default,'댄스파티 관심있나요?',default,default,'댄스파티에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다');
insert into group_board values('G'||seq_group_board_no.nextval,'9','honggd@naver.com',default,'어학공부 관심있나요?',default,default,'프랑스어에 관심있으시면 저에게 연락주세요. 대표번호는 031-123-1233입니다');

select * from group_board;
select * from member;



update group_board set report_cnt = report_cnt +9 where group_board_no = 'G6';
update group_board set report_cnt = report_cnt +9 where group_board_no = 'G64';
update group_board set report_cnt = report_cnt +9 where group_board_no = 'G62';

select
			G.*,
			(select nickname from member where member_email= G.member_email) nickname,
			(select count(*) from group_board_comment where group_board_ref = G.group_board_no  ) comment_cnt
		from
			group_board G
		where
			G.report_cnt < 10
		order by group_board_date desc, group_board_no desc ;

commit;

-----------------------------
--------- 소모임댓글 ---------
-----------------------------
create table group_board_comment (
	group_board_comment_no varchar2(256), --댓글번호 pk
	writer varchar2(256), -- 작성자
	group_board_ref varchar2(256),--게시물 번호
	private number default 0, --비밀글 여부
	group_board_comment_ref varchar2(256), -- 대댓글인 경우 , 참조중인 댓글 번호 | 댓글인 경우, null 
	group_board_content varchar2(2000), -- 댓글 내용
	group_board_comment_level number default 1, -- 댓글(1)/대댓글(2) 여부 판단
	group_board_date date default sysdate, --댓글 날짜
	 	

	constraints pk_group_board_comment_no primary key(group_board_comment_no),
	constraints fk_group_board_ref foreign key(group_board_ref) references group_board(group_board_no) on delete set null,
	constraints fk_group_board_comment_ref foreign key(group_board_comment_ref) references group_board_comment(group_board_comment_no) on delete set null,
	constraints ck_gorup_board_private check(private in(0,1))
);

alter table group_board_comment rename column private to secret;

create sequence seq_group_board_comment_no;

delete from group_board_comment where group_board_comment_no = 30;

alter table group_board_comment add(report_cnt number default 0);
ALTER TABLE group_board_comment DROP column report_cnt;
update group_board_comment set report_cnt = '0';

select * from group_board_comment;
select * from member;

insert into group_board_comment values(seq_group_board_comment_no.nextval,'honggd@naver.com','G5',default,null,'먹방 좋아합니다~~',1,default);
insert into group_board_comment values(seq_group_board_comment_no.nextval,'honggd@naver.com','G5',default,1,'먹방 은 최고~~',2,default);
insert into group_board_comment values(seq_group_board_comment_no.nextval,'honggd@naver.com','G5',default,null,'먹방 예쓰!!!!~~',1,default);
insert into group_board_comment values(seq_group_board_comment_no.nextval,'honggd@naver.com','G5',default,null,'먹방 예쓰!!!1!!!!!~~',default,default);

commit;

drop sequence seq_group_board_comment_no;
drop table group_board_comment;

--계층형쿼리
--행과 행 사이에 부모/자식관계를 맺음
--댓글구조, 조작도, 메뉴등에 사용할 수 있다

--start with : 부모 조건절 작성
--connect by : 부모 / 자식 관계 조건절 작성 prior키워드 쪽이 부모행을 가리킴

select c.*, M.nickname 
from group_board_comment C join member M 
            on C.writer = m.member_email
where group_board_ref = 'G5'
start with group_board_comment_level = 1
connect by prior group_board_comment_no = group_board_comment_ref
order siblings by group_board_date desc, group_board_comment_no desc;

-----------------------------
--------- 신고 ---------------
-----------------------------
create table report (
    member_email varchar2(256),
    board_no varchar2(256),
    report_reason varchar2(256),
    
    constraints pk_report primary key(member_email, board_no),
    constraints fk_report_member_email foreign key(member_email) references member(member_email) on delete cascade,
    constraints fk_group_board_no foreign key(board_no) references group_board(group_board_no) on delete cascade,
    constraints fk_recruit_board_no foreign key(board_no) references recruit(recruit_no) on delete cascade
);
ALTER TABLE report DROP constraints fk_group_board_no;

commit;


-------------10/9-----------------------------
select
    *
from(
    select *
    from report R join blacklist B
                    on R.board_no = B.report_board_no 
    order by B.blacklist_no desc
    );

select 
    B.report_board_no,
    G.member_email,
    G.group_board_title,
    G.group_board_date,
    
from blacklist B join member M
                on B.member_email = M.member_email
                 join group_board G
                on B.report_board_no = G.group_board_no
                 join auth A
                on B.member_m
where B.board_type='G';

delete from group_board where group_board_no = 'G64';

select * from member;
select * from report;
select * from blacklist;
select * from group_board;
select * from space;
select * from tag;

select
*
from
report
where board_no='G64';

insert into report values('admin@spaceus.com','G6','기타');
COMMIT;
---------------------------------10/9------------------------



insert into report values('sinsa@naver.com','G64','기타');
COMMIT;
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
ALTER TABLE blackList DROP constraints fk_blacklist_email;
ALTER TABLE blackList add constraints fk_blacklist_email foreign key(member_email) references member(member_email) on delete set null;
ALTER TABLE blackList add (title varchar2(256));
alter table group_board_comment add(report_cnt number default 0);

create sequence seq_blacklist_no;
select * from blacklist;
select * from recruit;
select * from group_board;
select * from member;
select * from report;

delete from group_board where group_board_no = 'G12';

COMMIT;

select 
		    B.report_board_no,
		    R.member_email,
		    R.title as group_board_title,
		    R.enroll_date as group_board_date
		from blacklist B left join member M
		                on B.member_email = M.member_email
		                 left join recruit R
		                on B.report_board_no = R.recruit_no
		where B.board_type='R';
        
select 
		    B.report_board_no,
		    G.member_email,
		    G.group_board_title,
		    G.group_board_date
		from blacklist B left join member M
		                on B.member_email = M.member_email
		                 left join group_board G
		                on B.report_board_no = G.group_board_no
		where B.board_type='G';

select * from blackList;

COMMIT;

select
    B.blacklist_no,
    B.report_board_no,
    G.group_board_title,
    G.member_email,
    (select report_reason from (select * from report join blacklist B on board_no = B.report_board_no group by board_no order by B.blacklist_no desc ) where rownum = 1) reason
from
    blacklist B left join group_board G
            on G.group_board_no = B.report_board_no;
            
select * from report;

-----------------------------
------- 댓글 신고 -------------
-----------------------------
create table com_report(
	member_email varchar2(256),
	board_comment_no varchar2(256),
	comment_report_reason varchar2(256) not null,

	constraints pk_com_report primary key(member_email, board_comment_no),
	constraints fk_com_report_member_email foreign key(member_email) references member(member_email) on delete cascade,
	constraints fk_com_report_board_comment_no foreign key(board_comment_no) references group_board_comment(group_board_comment_no) on delete cascade
);
ALTER TABLE com_report DROP constraints fk_com_report_board_comment_no;

select * from com_report;

delete from com_report where board_comment_no='41';

commit;
-----------------------------
---------- 기획전 -----------
-----------------------------

create table exhibition (
    ex_title varchar2(256) not null,
    ex_subtitle varchar2(256) not null,
    tag varchar2(100) not null
);



select * from exhibition;
COMMIT;
update exhibition set ex_no= 6 where tag_no='TAG6';

ALTER TABLE exhibition DROP COLUMN ex_no;
ALTER TABLE exhibition ADD ex_no number;
ALTER TABLE 테이블명 MODIFY (컬럼명 데이터타입(데이터길이));


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

---------------------------------------
-- 10/11
---------------------------------------
select * from space_image;
select * from space;

-- 첫번째 사진이 대표사진 추출
select
    *
from(
    select 
        S.space_no,
        SI.renamed_filename,
        S.space_name,
        S.registration_date,
        rank()over(partition by S.space_no order by SI.renamed_filename) as rnum,
        S.member_email
    from 
        space S join auth A
                    on S.member_email = A.member_email
                left join space_image SI
                    on S.space_no = SI.space_no
    where
        A.authority = 'ROLE_USER'
    )
where rnum = 1;
--------------------------------------------
-- 그룹별로 ROWNUM
select
        space_no,
        renamed_filename,
        rank()over(partition by space_no order by renamed_filename) "rownum"
from
        space_image;
-------------------------------------------------
--10/11
--------------------------------------------------
select * from space;
select * from category;
select * from space_image;
select * from space_option;
select * from option_list;
select * from space_tag;
select * from tag;

-- 스페이스
select
    *
from
    space
where 
    space_no = 'space2';
-- 카테고리
select 
    space_no,
    category_no,
    category_name
from
    space join category
                using(category_no)
where 
    space_no = 'space2';
-- 사진
select 
    renamed_filename as rname,
    space_no
from 
    space_image
where 
    space_no = 'space2';
-- 옵션
select 
    * 
from 
    space_option join option_list
        using(option_no)
where
    space_no = 'space2';
-- 태그
select 
    * 
from 
    space_tag join tag
        using(tag_no)
where
    space_no = 'space27';
-----------------------------------
-- 10 /12
-----------------------------------
select * from category;
select * from space;
select * from space_option;
select * from option_list;
select * from space_tag;
select * from tag;
--------------------
select
   (category_name)
from category;
select
    (option_name)
from option_list;
select
    (tag_name)
from tag;
---------------------
select category_name
from category
where category_name like '%감각%'
union
select tag_name
from tag
where tag_name like '%감각%'
union
select option_name 
from option_list
where option_name like '%감각%';

select 
    * 
from 
    space S join category C
                using(category_no)
            join space_option SO
                using(space_no)
            join option_list SL
                on SO.option_no = SL.option_no
;
select REGEXP_SUBSTR('C-01-02','[^-]+',1,1) from dual;
select REGEXP_SUBSTR(address,'[^ ]+',1,3) from space;

select * from space;

SELECT address as name, space_no FROM space;
select category_name as name, space_no from category join space using(category_no);
select option_name as name, 
        space_no, 
        space_name, 
        REGEXP_SUBSTR(address,'[^ ]+',1,3) as address, 
        views, 
        like_cnt, 
        hourly_price,
        renamed_filename,
        rnum
from space join space_option 
                using(space_no) 
           join option_list 
                using(option_no)
           left join (  select space_no,renamed_filename,rank()over(partition by space_no order by renamed_filename) as rnum from space left join space_image using(space_no))
                using(space_no)
where rnum=1;

------- 
WITH TEMP_TABLE AS (
   SELECT address as name, space_no FROM space union all
   select category_name as name, space_no from category join space using(category_no) union all
   select option_name as name, space_no from space_option join option_list using(option_no) union all
   select tag_name as name, space_no from space_tag join tag using(tag_no)
)
SELECT space_no
   FROM TEMP_TABLE;
 WHERE name like '%#바다가 보이는%';
 
 
 
 
-- 공간 대표사진 
select 
    renamed_filename, space_no
from(
    select 
        space_no,
        renamed_filename,
        rank()over(partition by space_no order by renamed_filename) as rnum
    from 
        space left join space_image 
                    using(space_no)
    )
where rnum = 1;

---
select * from(select rank()over(partition by space_no order by renamed_filename) as rnum, renamed_filename from space left join space_image using(space_no)) where rnum=1;
---
select renamed_filename, space_no from( select space_no, renamed_filename, rank()over(partition by space_no order by renamed_filename) as rnum from space left join space_image using(space_no))where rnum = 1;

-------------------------------
--10/13
-------------------------------
-- 공간 대표사진 
select 
    space_no,
    renamed_filename
from(
    select 
        S.space_no,
        SI.renamed_filename,
        S.status,
        rank()over(partition by S.space_no order by SI.renamed_filename) as rnum
    from 
        space S left join space_image SI 
                    on S.space_no = SI.space_no
    )
where rnum = 1 and status = 'O';

-- 주소 구만 
select REGEXP_SUBSTR(address,'[^ ]+',1,3) from space;

-- 리뷰수
select count(*)over(partition by space_no) as review_cnt from review;

select * from review;
    
-- 전체
select
    space_no,
    space_name, 
    REGEXP_SUBSTR(address,'[^ ]+',1,3) as address,
    hourly_price,
    views,
    like_cnt,
    nvl((select count(*)over(partition by space_no)from review R where S.space_no = R.space_no),0) as reviewNo
from 
    space S
where status = 'O'
        and space_no='space61';
----
select * from category;
select * from space where status = 'O';
select * from member;
select * from space where member_email='rhkim999@gmail.com';
delete from space where space_no = 'space60';
commit;


select 
        S.space_no,
        SI.renamed_filename,
        S.status,
        rank()over(partition by S.space_no order by SI.renamed_filename) as rnum
    from 
        space S left join space_image SI 
                    on S.space_no = SI.space_no;
                    
                    
--
select
		    S.space_no,
		    S.space_name, 
		    REGEXP_SUBSTR(address,'[^ ]+',1,3) as address,
		    S.hourly_price,
		    S.views,
		    S.like_cnt,
		    S.star_avg,
		    nvl((select count(*)over(partition by space_no)from review R where S.space_no = R.space_no),0) as review_cnt,
            SI.renamed_filename
		from 
		    space S join(
                select space_no,renamed_filename 
                from( select 
                        S.space_no,
                        SI.renamed_filename,
                        rank()over(partition by S.space_no order by SI.renamed_filename) as rnum 
                      from space S left join space_image SI 
                                    on S.space_no = SI.space_no)
                      where rnum=1
            )SI
                on S.space_no = SI.space_no
		where S.status = 'O' and S.space_no= 'space22';
        
--
select category_name
from category
where category_name like '%강남%'
union
select tag_name
from tag
where tag_name like '%강남%'
union
select option_name 
from option_list
where option_name like '%강남%'
union
select REGEXP_SUBSTR(address,'[^ ]+',1,3) as address
from space
where address like '%강남%';

-------------------------------------------
-- 10/14
-------------------------------------------
select * from reservation_avail;
select * 
from
    (
        SELECT 
                *
        FROM (
                select * 
                from space left join space_option using(space_no) left join option_List using(option_no)
                where category_no = 'cate3' and option_no = 'OPTION14' and address like '%서울%'
              ) E
     );

select * from space; where space_no = 'space101';
select * from category;
-----------
-- 여기서 서치 디테일을 where절에 해야한다
select
		    S.space_no,
		    S.space_name, 
		    REGEXP_SUBSTR(address,'[^ ]+',1,3) as address,
		    S.hourly_price,
		    S.views,
		    S.like_cnt,
		    S.star_avg,
		    nvl((select count(*)over(partition by space_no)from review R where S.space_no = R.space_no),0) as review_cnt,
            SI.renamed_filename
		from 
		    space S join(
                select space_no,renamed_filename 
                from( select 
                        S.space_no,
                        SI.renamed_filename,
                        rank()over(partition by S.space_no order by SI.renamed_filename) as rnum 
                      from space S left join space_image SI 
                                    on S.space_no = SI.space_no)
                      where rnum=1
            )SI
                on S.space_no = SI.space_no
		where S.status = 'O' and S.space_no= 'space22';
        
--아니면 저런 값들이 가지고 있는 spaceNo을 먼저 가져오는 게 낫겠지?
--{date=, optionArr=OPTION3,OPTION7, location=all_location, category=cate6}
select 
    *
from 
    space left join space_option
            using(space_no);
            
-------
select
		    S.space_no,
		    S.space_name, 
		    REGEXP_SUBSTR(address,'[^ ]+',1,3) as address,
		    S.hourly_price,
		    S.views,
		    S.like_cnt,
		    S.star_avg,
--		    nvl((select count(*)over(partition by space_no)from review R where S.space_no = R.space_no),0) as review_cnt,
            SI.renamed_filename
		from 
		    space S join(
                select space_no,renamed_filename 
                from( select 
                        S.space_no,
                        SI.renamed_filename,
                        rank()over(partition by S.space_no order by SI.renamed_filename) as rnum 
                      from space S left join space_image SI 
                                    on S.space_no = SI.space_no)
                      where rnum=1
            )SI
                on S.space_no = SI.space_no
		where S.status = 'O' and S.space_no= 'space2';
        
        
 nvl((select count(*)over(partition by space_no)from review R where S.space_no = R.space_no),0) as review_cnt,
 
select 
    rank()over(partition by space_no order by reviews) as rnum
from( 
    select count(*)over(partition by space_no) as reviews,space_no, rownum
    from review
    );

-- 리뷰수 space_no에 1개씩
select reviews,space_no from( select ROW_NUMBER() OVER(partition by space_no ORDER BY space_no,reviews) row_num, space_no,reviews from( select count(*)over(partition by space_no) as reviews, space_no from review))where row_num =1 ;
--
select
		    S.space_no,
		    S.space_name, 
		    REGEXP_SUBSTR(address,'[^ ]+',1,3) as address,
		    S.hourly_price,
		    S.views,
		    S.like_cnt,
		    S.star_avg,
		    (select reviews from( select ROW_NUMBER() OVER(partition by space_no ORDER BY space_no,reviews) row_num, space_no,reviews from( select count(*)over(partition by space_no) as reviews, space_no from review))where row_num =1 and space_no = 'space2') as reviews,
            SI.renamed_filename
from space S join(
                            select space_no,renamed_filename 
                            from( select 
                                    S.space_no,
                                    SI.renamed_filename,
                                    rank()over(partition by S.space_no order by SI.renamed_filename) as rnum 
                                  from space S left join space_image SI 
                                                on S.space_no = SI.space_no)
                                  where rnum=1
                        )SI on S.space_no = SI.space_no
		where S.status = 'O' and S.space_no= 'space2';

----- search Detail

	select 
            space_no
		from
		    (
		        SELECT rank()over(partition by space_no order by OPTION_NO) as rnum,
		                E.* 
		        FROM (
		                select * 
		                from space left join space_option using(space_no) 
                                   left join option_List using(option_no)
                                   left join category using(category_no)
                        where
		                		option_name = '인터넷/와이파이' 
                            and category_name = '카페' 
                            and address like '%서울%'  
		              ) E
		     )
group by space_no;
-----------------------------
--10/15
select count(*),space_no from review where space_no='space2';   
select reviews , space_no from( select ROW_NUMBER() OVER(partition by space_no ORDER BY space_no,reviews) row_num, space_no, reviews  from( select count(*)over(partition by space_no) as reviews, space_no from review ))where row_num =1 and space_no = 'space2';
------------------------------
select * from reservation_avail;

WITH TEMP_TABLE AS (
		   SELECT address as name, space_no FROM space union all
		   select category_name as name, space_no from category join space using(category_no) union all
		   select option_name as name, space_no from space_option join option_list using(option_no) union all
		   select tag_name as name, space_no from space_tag join tag using(tag_no)
		)
		SELECT space_no
		   FROM TEMP_TABLE join space space using(space_no) left join (select reviews , space_no from( select ROW_NUMBER() OVER(partition by space_no ORDER BY space_no,reviews) row_num, space_no, reviews  from( select count(*)over(partition by space_no) as reviews, space_no from review ))where row_num =1) using(space_no)
        WHERE name like '%서울%'
        order by reviews;
-------------------------------------------------------------------------------------------
-- 10/16
-------------------------------------------------------------------------------------------
select * from reservation; where member_email='rhkim999@gmail.com';
select * from reservation where member_email='honggd@naver.com';
update reservation set rev_cancle=0 where member_email='honggd@naver.com';
commit;
-------------------------------
--10/19
-------------------------------
select * from member;
select * from exhibition;
select * from tag;

update exhibition set tag_no = 'TAG182' where ex_no='21'; 
commit;


create table exhibition (
    ex_title varchar2(256) not null,
    ex_subtitle varchar2(256) not null,
    tag varchar2(100) not null
);
select * from exhibition;
-- tag_no 추가
alter table exhibition modify(tag_no varchar2(256));
-- tag_no tag와 fk
alter table exhibition add constraints fk_exhibition_tag_no foreign key(tag_no) references tag(tag_no);
-- RENAMED_FILENAME
alter table exhibition drop column;

select
	  *
from
  (
    select
      *
    from
      space
    join space_tag using(space_no)
  )
  join tag using(tag_no)
where
  tag_no = 'TAG182';
  
  
-- list 불러오기
select * from space_tag;

select
		    S.space_no,
		    S.space_name, 
		    REGEXP_SUBSTR(address,'[^ ]+',1,3) as address,
		    S.hourly_price,
		    S.views,
		    S.like_cnt,
		    S.star_avg,
		    (select reviews from( select ROW_NUMBER() OVER(partition by space_no ORDER BY space_no,reviews) row_num, space_no,reviews from( select count(*)over(partition by space_no) as reviews, space_no from review))where row_num =1 and space_no = 'space2') as reviews,
            SI.renamed_filename,
            ST.tag_no,
            T.tag_name
from space S join(
                            select space_no,renamed_filename 
                            from( select 
                                    S.space_no,
                                    SI.renamed_filename,
                                    rank()over(partition by S.space_no order by SI.renamed_filename) as rnum 
                                  from space S left join space_image SI 
                                                on S.space_no = SI.space_no)
                                  where rnum=1
                        )SI on S.space_no = SI.space_no
              join space_tag ST on S.space_no = ST.space_no
              join tag T on ST.tag_no = T.tag_no
		where S.status = 'O' and ST.tag_no='TAG164';
        
select * from space_tag where tag_no = 'TAG182';
select * from space where space_no='space112';
select * from review;
select * from tag;
--------------------------------------
--10/20
--------------------------------------
delete tag where tag_no = 'TAG180';
commit;
select * from tag;

select * from exhibition order by ex_no;

drop sequence seq_ex;
create sequence seq_ex start with 7;

insert into
		exhibition
values(
    seq_ex.nextval,
    #{exTitle},
    #{exSubtitle},
    #{imageUrl},
    #{renamedFileName}
    #{tagNo}
add ;

select * from exhibition;
commit;
update exhibition set tag_no='TAG89' where ex_no=8;
rollback;

select * from report;

select * from group_board;
select * from blackList;
select * from space;
select * from member;
select * from auth;
insert into auth values('jj@naver.com','ROLE_HOST');
update auth set authority='ROLE_USER' where member_email='jj@naver.com';
COMMIT;
update space set hourly_price=500 where space_no = 'space108';
commit;

select * from reservation; 
---------------------
--10/21
---------------------
WITH TEMP_TABLE AS (
SELECT address as name, space_no FROM space union all
		   select category_name as name, space_no
 from category join space using(category_no) union all
		   select option_name as name, space_no
 from space_option join option_list using(option_no) union all
		   select tag_name as name, space_no
 from space_tag join tag using(tag_no)
		)
		SELECT space_no, NAME
		   FROM TEMP_TABLE join space using(space_no) left join 
 (select reviews , 
		   																space_no from( 
		   																				select ROW_NUMBER() OVER(partition by space_no ORDER BY space_no,reviews) row_num, 
		   																						space_no, 
		   																						reviews 
		   																				from( select count(*)over(partition by space_no) as reviews, space_no
 from review )
		   																				)
		   														
 where row_num =1
		   														) using(space_no)
		 WHERE name like '%카페%'
		   order by
			 space_name desc;
             
select * from member where member_phone='01048179843';

delete from auth where member_email='rhkim10@kakao.com';
commit;

select * from auth;
select * from member;
select * from tag;
select * from space;

select * from exhibition join tag using(tag_no);
update space set address = '우(25822) 강원 동해시 내동길 91-1  (내동)' where space_no ='space110';
commit;
select * from reservation;
update reservation set rev_comple = 1 where rev_no = 'imp_094016579288';
select * from member; join auth using(member_email);
commit;

insert into member values('host1@naver.com','호스트1','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host2@naver.com','호스트2','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host3@naver.com','호스트3','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host4@naver.com','호스트4','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host5@naver.com','호스트5','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host6@naver.com','호스트6','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host7@naver.com','호스트7','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host8@naver.com','호스트8','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host9@naver.com','호스트9','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01041112222','1990-10-19',default,0,default);
insert into member values('host10@naver.com','호스트10','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);

insert into member values('host11@naver.com','호스트11','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host12@naver.com','호스트12','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host13@naver.com','호스트13','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host14@naver.com','호스트14','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host15@naver.com','호스트15','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host16@naver.com','호스트16','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host17@naver.com','호스트17','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host18@naver.com','호스트18','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host19@naver.com','호스트19','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);
insert into member values('host20@naver.com','호스트20','$2a$10$Qc91X8k0YEUfCTwsX4PGKuni0Klgjt35x6MLusqdHbq5Kw1rQh4Uu','01011112222','1990-10-19',default,0,default);

insert into auth values('host1@naver.com',default);
insert into auth values('host2@naver.com',default);
insert into auth values('host3@naver.com',default);
insert into auth values('host4@naver.com',default);
insert into auth values('host5@naver.com',default);
insert into auth values('host6@naver.com',default);
insert into auth values('host7@naver.com',default);
insert into auth values('host8@naver.com',default);
insert into auth values('host9@naver.com',default);
insert into auth values('host10@naver.com',default);

insert into auth values('host11@naver.com',default);
insert into auth values('host12@naver.com',default);
insert into auth values('host13@naver.com',default);
insert into auth values('host14@naver.com',default);
insert into auth values('host15@naver.com',default);
insert into auth values('host16@naver.com',default);
insert into auth values('host17@naver.com',default);
insert into auth values('host18@naver.com',default);
insert into auth values('host19@naver.com',default);
insert into auth values('host20@naver.com',default);

commit;
select * from tag;
delete from space where space_no= 'space213';
update space set status = 'O' where space_no = 'space212';

select * from space;
select * from auth;

select * from member where member_email='test2@naver.com';

update member set member_phone= '01012341234' where member_email = 'test3@naver.com';

commit;

select * from reservation;

select * from member;

select * from group_board;

COMMIT;

delete from group_baord where group_board_no = 'G161';
update group_board set member_email = 'sinsa@naver.com' where group_board_no='G161';

update group_board set report_cnt = 9 where member_email='user14@naver.com';
commit;

update group_board set member_email='rhkim9990@gmail.com' where member_email='rhkim999@gmail.com';


update member set member_email='rhkim9990@gmail.com' where member_email='rhkim999@gmail.com';

update 
commit;

select
			*
		from
			blacklist
		where 
			board_type='G';
            
alter table blackList add blackList_date Date default sysdate;

select * from space;

update space set space_name = '소셜팩토리 매니아' where space_no ='space105';
select * from reservation;

select * from group_board;


commit;
update reservation set rev_comple = 1 where member_email='jjjj@naver.com';

select * from member where member_phone = '01035505472';

delete from auth where member_email = 'rhkim999@gmail.com';

commit;

select * from member;

delete from reservation where member_email='rhkim999@gmail.com';

select * from review;

delete from review where review_no='REVIEW143';
commit;
select * from group_board;
update group_board set report_cnt = 9 where group_board_no='G163';

select * from blackList;

delete from blackList where blackList_no='BLACK123';

select * from report;

delete from report where member_email='admin@spaceus.com';

commit;

