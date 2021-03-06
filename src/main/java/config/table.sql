--------------------------------------------------------
---회원 테이블----------------------------------------------
create table mem(
	mem_num number primary key, --회원번호
	mem_id varchar2(20),		   --회원아이디
	mem_pw varchar2(20),		   --회원비밀번호
	mem_sex varchar2(10),		   --회원성별
	mem_name varchar2(100),		   --회원이름
	mem_email varchar2(20),		   --회원이메일
	mem_address varchar2(300),	   --회원주소
	upload varchar2(200)      --회원프로핅
);
select * from mem
INSERT INTO movie_actor(
(select movie_num, actor_num from actor, movie where actor_name = 'aa' AND movie_kor_title = 'aa') ,  
(select movie_num, actor_num from actor, movie where actor_name = 'aa' AND movie_kor_title = 'aa') ,   
(select movie_num, actor_num from actor, movie where actor_name = 'aa' AND movie_kor_title = 'aa') ,   
(select movie_num, actor_num from actor, movie where actor_name = 'aa' AND movie_kor_title = 'aa') ,    
(select movie_num, actor_num from actor, movie where actor_name = 'aa' AND movie_kor_title = 'aa'))
--회원 테이블 시퀀스
create sequence mem_seq
start with 1
increment by 1
nocache
nocycle;



--select * from mem
--drop table mem
--drop sequence mem_seq
--------------------------------------------------------
---회원 등급 테이블-------------------------------------------
create table grade(
	mem_num number,      --회원번호
	mem_grade varchar2(100), --회원등급
	constraint grade_mem_num_fk foreign key(mem_num) references mem(mem_num) on delete cascade
	--grade테이블의 mem_num 외래키, 부모(mem_num)삭제시 다 삭제되는 제약조건
);

INSERT INTO actor(actor_num, actor_name)
SELECT actor_seq.nextval, 'as' FROM DUAL  
WHERE NOT EXISTS (SELECT * FROM actor WHERE actor_name='as')  
--select * from grade
--drop table grade
INSERT INTO actor (select actor_seq.nextval, '몰라' 
where 0 >= (select count(*) from actor where actor_name = '몰라'))

 INSERT INTO actor WHEN (select count(*) from actor where actor_name = '몰라') <= 0 THEN
        VALUES (actor_seq.nextval, '몰라')
--------------------------------------------------------
---영화 테이블----------------------------------------------
create table movie(
	movie_num number primary key,		--영화번호
	movie_rating varchar2(500),			--영화등급
	movie_kor_title varchar2(500),		--영화한글제목
	movie_eng_title varchar2(500),		--영화영어제목
	movie_opening_date date,			--영화개봉일
	movie_summary varchar2(4000),		--영화줄거리
	movie_image varchar2(1000),			--이미지
	movie_url varchar2(500),			--url
	nation varchar2(100)				--영화국가
);
--영화테이블 시퀀스
create sequence movie_seq
start with 1
increment by 1
nocache
nocycle;

select movie_kor_title from movie where movie_kor_title like '%백설%'
--select * from movie where movie_num='50'
--drop table movie
--drop sequence movie_seq

--------------------------------------------------------
---평점 테이블----------------------------------------------
create table rating(
	mem_num number,				--회원번호
	movie_num number(10),		--영화번호
	star_point number(10),		--별점
	write_date date,			--작성날짜
	constraint rating_mem_num_fk foreign key(mem_num) references mem(mem_num) on delete cascade,
	--rating테이블 mem_num 외래키, 부모(mem_num)삭제시 다 삭제되는 제약조건
	constraint rating_movie_num_fk foreign key(movie_num) references movie(movie_num)
	--rating테이블 movie_num 외래키 제약조건
);

--select * from rating
--drop table rating
--------------------------------------------------------
---카테고리 테이블----------------------------------------------
create table category(
	category_num number primary key,	--장르번호
	category_name varchar2(50)			--장르이름
);

insert into category values(category_seq.nextval, 'SF');
insert into category values(category_seq.nextval, '갱스터');
insert into category values(category_seq.nextval, '공포');
insert into category values(category_seq.nextval, '드라마');
insert into category values(category_seq.nextval, '멜로드라마');
insert into category values(category_seq.nextval, '뮤지컬');
insert into category values(category_seq.nextval, '서부');
insert into category values(category_seq.nextval, '시대극/사극');
insert into category values(category_seq.nextval, '액션');
insert into category values(category_seq.nextval, '장르');
insert into category values(category_seq.nextval, '코메디');
insert into category values(category_seq.nextval, '가족');
insert into category values(category_seq.nextval, '계몽');
insert into category values(category_seq.nextval, '군사');
insert into category values(category_seq.nextval, '느와르');
insert into category values(category_seq.nextval, '동성애');;
insert into category values(category_seq.nextval, '로드무비');
insert into category values(category_seq.nextval, '무협');
insert into category values(category_seq.nextval, '문예');
insert into category values(category_seq.nextval, '뮤직');
insert into category values(category_seq.nextval, '미스터리');
insert into category values(category_seq.nextval, '범죄');
insert into category values(category_seq.nextval, '사회물(경향)');
insert into category values(category_seq.nextval, '스릴러');
insert into category values(category_seq.nextval, '스포츠');
insert into category values(category_seq.nextval, '신파');
insert into category values(category_seq.nextval, '실험');
insert into category values(category_seq.nextval, '아동');
insert into category values(category_seq.nextval, '어드벤처');
insert into category values(category_seq.nextval, '에로');
insert into category values(category_seq.nextval, '연쇄극');
insert into category values(category_seq.nextval, '옴니버스');
insert into category values(category_seq.nextval, '재난');
insert into category values(category_seq.nextval, '전기');
insert into category values(category_seq.nextval, '전쟁');
insert into category values(category_seq.nextval, '종교');
insert into category values(category_seq.nextval, '첩보');
insert into category values(category_seq.nextval, '청춘영화');
insert into category values(category_seq.nextval, '판타지');
insert into category values(category_seq.nextval, '하이틴(고교)');
insert into category values(category_seq.nextval, '합작(번안물)');
insert into category values(category_seq.nextval, '해양액션');
insert into category values(category_seq.nextval, '활극');

--카테고리테이블 시퀀스
create sequence category_seq
start with 1
increment by 1
nocache
nocycle;

--select * from category
--drop table category
--drop sequence category_seq

--------------------------------------------------------
---영화카테고리 테이블----------------------------------------------
create table movie_category(
	category_num number,	--장르번호
	movie_num number,		--영화번호
	constraint movie_category_num_fk foreign key(category_num) references category(category_num),
	--category테이블 category_num 외래키 제약조건
	constraint movie_category_movie_num_fk foreign key(movie_num) references movie(movie_num)
	--category테이블 movie_num 외래키 제약조건
);

--select * from movie_category
--drop table movie_category
select * from movie where movie_kor_title in ('코코','마터스')
delete from movie_actor;
delete from movie_director;
delete from actor;
delete from director;
delete from movie_category;
delete from movie;
delete from rating;
delete from commentlike;
delete from movie_comment;

--------------------------------------------------------
---배우 테이블----------------------------------------------
create table actor(
	actor_num number primary key,	--배우번호
	actor_name varchar2(100)		--배우이름
);
	INSERT INTO actor (select actor_seq.nextval, '이병헌'
	from actor where (select count(*) from actor where actor_name = '이병헌') <= 0)

--배우테이블 시퀀스
create sequence actor_seq
start with 1
increment by 1
nocache
nocycle;

--select * from actor
--drop table actor
--drop sequence actor_seq

--------------------------------------------------------
---영화출연배우 테이블-------------------------------------------
create table movie_actor(
	movie_num number,		--영화번호
	actor_num number,		--배우번호
	constraint movie_actor_movie_num_fk foreign key(movie_num) references movie(movie_num),
	--movie_actor테이블의 movie_num 외래키 제약조건
	constraint movie_actor_actor_num_fk foreign key(actor_num) references actor(actor_num)
	--movie_actor테이블의 actor_num 외래키 제약조건
);

--select * from movie_actor
--drop table movie_actor

--------------------------------------------------------
---영화감독 테이블-------------------------------------------
create table director(
	director_num number primary key,	--감독번호
	director_name varchar2(100)			--감독이름
);

--영화감독 시퀀스
create sequence director_seq
start with 1
increment by 1
nocache
nocycle;

--select * from director
--drop table director
--drop sequence director_seq
select b.director_name from movie_director a, director b where a.movie_num = 1 and a.director_num = b.director_num
--------------------------------------------------------
---출연영화감독 테이블-------------------------------------------
create table movie_director(
	movie_num number,		--영화번호
	director_num number,	--감독번호
	constraint movie_director_movie_num_fk foreign key(movie_num) references movie(movie_num),
	--movie_actor테이블의 movie_num 외래키 제약조건
	constraint movie_director_director_num_fk foreign key(director_num) references director(director_num)
	--movie_actor테이블의 actor_num 외래키 제약조건
);


--select * from movie_director
--drop table movie_director

INSERT INTO movie_director (select movie_num, director_num from director, movie where director_name = 'aa' AND movie_kor_title = 'aa')

--------------------------------------------------------
---게시판 테이블--------------------------------------------
create table board(
	board_num number primary key,	--게시글번호
	mem_num number,					--회원번호
	board_writer varchar2(10),		--작성자
	board_name varchar2(100),		--제목
	board_content varchar2(500),	--내용
	board_hits number(10),			--조회수
	board_relnum number(10),		--관련글번호
	board_reply_level number,		--답글레벨
	board_reply_step number,		--답글단계
	board_date date,				--작성일
	board_reply_amount number,		--댓글개수
	board_category number(10)		--보드 카테고리
);
alter table board modify(board_name varchar2(500))
alter table board add constraint board_mem_num_fk foreign key(mem_num) references mem(mem_num) on delete cascade
--board테이블 mem_num 외래키, 부모(mem_num)삭제시 다 삭제되는 제약조건
--게시판테이블 시퀀스

create sequence board_seq
start with 1
increment by 1
nocache
nocycle;

insert into
board(board_num,mem_num,board_writer,board_name,board_content,board_hits,board_relnum,board_reply_level,board_reply_step,board_date,board_reply_amount)
values(board_seq.nextval,1,'adsad','gaa','test',0,board_seq.nextval,0,0,sysdate,0)

--select * from board
--drop table board
--drop sequence board_seq

create table movie_comment(
   comment_num number primary key,
   profile varchar2(200),
   movie_num number,
   replytext varchar2(500),
   mem_num number,
   mem_id varchar2(20),
   regdate Date,
   likecount number,
   constraint movie_comment_comment_num_fk foreign key(comment_num) references movie(movie_num) on delete cascade,
   constraint movie_comment_mem_num_fk foreign key(mem_num) references mem(mem_num) on delete cascade
);

select * from movie_comment

select count(*) from movie_comment group by movie_num

select a.* from movie a, (select movie_num from movie_comment where regdate > sysdate - 7 and regdate <= sysdate group by movie_num order by count(*)) b where a.movie_num  = b.movie_num and rownum <8

create sequence comment_num_seq
start with 1
increment by 1
nocache
nocycle;

drop table movie_comment
drop sequence comment_num_seq

insert into movie_comment values(comment_num_seq.nextval,1,'테스트',4,'aaaaaa','2018-01-25',0)
insert into movie_comment values(comment_num_seq.nextval,1,'테스트2',4,'aaaaaa','2018-02-02',0)
delete from movie_comment where comment_num = 11
select * from movie_comment

drop table movie_comment
drop sequence comment_num_seq

select * from COMMENTLIKE
select * from movie_comment where comment_num=1
update movie_comment set likecount=likecount-1 where comment_num=1

create table commentlike(
   like_num number,
   mem_id varchar2(20),
   mem_num number,
   comment_num number,
   constraint commentlike_comment_num_fk foreign key(comment_num) references movie_comment(comment_num) on delete cascade,
   constraint commentlike_mem_num_fk foreign key(mem_num) references mem(mem_num) on delete cascade
);
create sequence like_num_seq
start with 1
increment by 1
nocache
nocycle;

drop table commentlike 
drop sequence like_num_seq
insert into COMMENTLIKE values(like_num_seq.nextval,'bbbbbb',1)

select * from commentlike
delete  from commentlike


create table wishlist(
	movie_num number,
	category_name varchar2(200),
	mem_num number
);
