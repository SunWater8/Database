-- use문 

USE market_db;

-- select 와 from (특정 열 조회)
select * from member;
select mem_name from member;
select addr, debut_date, mem_name from member;
select addr "주소", debut_date "데뷔 일자", mem_name from member;

-- select, from, where (특정한 조건만 조회) 
-- 관계 연산자와 논리 연산자, between~and, in(), like
select * from member;
select * from member where mem_name="에이핑크";
select * from member where mem_number=4;
select mem_id, mem_name from member where height <= 162;
select mem_name, height, mem_number from member where height>=165 and mem_number>6;
select mem_name, height, mem_number from member where height>=165 or mem_number>6;
select mem_name, height from member where height between 163 and 165;
select mem_name, height from member where height>=163 and height <=165;
select mem_name, addr from member where addr="경기" or addr="경남" or addr="전남";
select mem_name, addr from member where addr in("경기", "경남", "전남");
select * from member where mem_name like '우%';
select * from member where mem_name like '__핑크';

-- 서브쿼리 subQuery

-- 이름이 '에이핑크'인 회원의 평균 키보다 큰 회원을 조회하기
select height from member where mem_name = '에이핑크'; -- 에이핑크의 키
select mem_name, height from member 
	where height > (select height from member where mem_name = '에이핑크');

