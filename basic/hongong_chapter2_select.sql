-- use문 

USE market_db;

-- select 와 from (특정 열 조회)
select * from member;
select mem_name from member;
select addr, debut_date, mem_name from member;
select addr "주소", debut_date "데뷔 일자", mem_name from member;

-- select, from, where (특정한 조건만 조회) 
select * from member;
select * from member where mem_name="에이핑크";
select * from member where mem_number=4;
select mem_id, mem_name from member where height <= 162;
select mem_name, height, mem_number from member where height>=165 and mem_number>6;
select mem_name, height, mem_number from member where height>=165 or mem_number>6;

-- between ~ and

