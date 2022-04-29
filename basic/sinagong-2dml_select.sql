-- table 2개 필요함

create table test.employers2 (
	idx int,
	name char(6) primary key,
    department varchar(10),
    birthdate date,
    address varchar(10),
    salary int 
);



insert into test.employers2
values	(1,'Hong', 'Proposal', '1961-04-05', 'Bristol', 120),
		(2, 'Lim',	'Internet','1969-01-09', 'Newhill', 80),
		(3, 'Hwang','Edit','1975-07-21','Boston', 100),
        (4, 'Kim','Edit','1973-10-22','Bristol', 90),
        (5, 'Sung','Proposal','1964-02-20','Wales', 100),
        (6, 'Jang','Edit','1967-03-11','Grandhaw', 120),
        (7, 'Ill','Proposal','1978-04-29', 'Parlo', 110),
        (8, 'Gang','Internet','1980-12-11',null, 90);
        
commit;

select * from test.employers2 order by idx;


create table EditEmp(
	name char(6),
    birthdate date,
    address varchar(10),
    salary int
);

select * from EditEmp;


drop table test.employers2;
drop table test.activity;


-- query 01. 사원 테이블에 (name-Hyueon, department - Internet)을 삽입하시오.
insert into test.employers2(name, department) 
values('Hyueon', 'Internet');


-- query 02. 사원 테이블에 (Bogo, Proposal, 05/03/73, Nicholes, 90)을 삽입하시오.
insert into test.employers2 
values('Bogo', 'Proposal', '1973-05-03', 'Nicholes', 90);



-- query 03. 사원 테이블에 있는 편집부의 모든 튜플을 편집부원(이름, 생일, 주소, 기본급) 테이블에 삽입하시오.
insert into EditEmp
select name, birthdate, address, salary 
from employers2
where department='Edit';















-- 테이블에 idx 칼럼 추가하기. 맨 앞에 위치키시기. 
alter table test.employers2 
add column idx int first;

-- 테이블의 idx 칼럼 삭제하기.
alter table test.employers2
drop column idx;



-- idx 칼럼에 자동증가 속성 추가하기.
alter table `test`.`employers2`
change column `idx` `idx` int not null auto_increment primary key;


-- idx 값을 초기화하기. (튜플이 하나도 없을 때 적용된다. )
alter table test.employers2 auto_increment=1;












-- query 04. 사원 테이블에서 'Lim'에 대한 튜플을 삭제하시오.

delete from test.employers2
where name='Lim';


-- query 05. 사원 테이블에서 'Internet'부서에 대한 모든 튜플을 삭제하시오.
delete from test.employers2
where department='Internet';

-- query 06. 사원 테이블의 모든 레코드를 삭제학시오.
delete from test.employers2;


select * from test.employers2;







-- 자동증가 설정한 칼럼의 현재 번호 확인하기. 
show table status where name = 'employers2';

















-- query 07. 사원 테이블에서 'Hong'의 address를 'Southborn'으로 수정하시오.
update test.employers2
set address='southborn'
where name = 'Hong';

select * from test.employers2;

-- query 08. 사원 테이블에서 'Hwang'의 'department'를 'Proposal'로 변경하고 'salary'을 5만원 인상시키시오.
update test.employers2
set department = 'Proposal',
	salary = salary + 5
where name = 'Hwang';

















create table activity(
	act_idx int,
    name char(6) primary key,
    hobby varchar(15),
    period int,
    foreign key(name) references test.employers2(name)
		on delete cascade
        on update cascade
);

select * from activity order by act_idx;

insert into activity 
values	(1, 'Kim', 'billi', 10),
		(2, 'Sung', 'Dance', 5),
        (3, 'Ill', 'Taek', 15),
        (4, 'Lim', 'Swim', 8);





-- query 09. 사원 테이블의 모든 튜플을 검색하시오.
select * from test.employers2 order by idx;

-- query 10. 사원 테이블에서 address 만 검색하되 같은 address 는 한 번만 출력하시오.
select distinct address from test.employers2;


-- query 11. 사원 테이블에서 기본급에 특별수당 10을 더한 월급을 'xx부서의 xxx의 월급 xxx' 형태로 출력하시오.
select 'In ' + department as department2, 'salary of' + name as name2, salary + 10 as salary2
from test.employers2;


select department as department2, name + ' of salary'as name2, salary + 10 as salary2
from test.employers2;

-- query 12. 사원 테이블에서 Proposal 부서의 모든 튜플을 검색하시오.
select * from test.employers2
where department = 'Proposal';


-- query 13. 사원 테이블에서 Proposal 부서에 근무하면서 Wales 에 사는 사람의 튜플을 검색하시오.
select * from test.employers2
where department = 'Proposal'and address = 'Wales';


-- query 14. 사원 테이블에서 부서가 Proposal 이거나 Internet 인 튜플을 검색하시오.
select * from test.employers2
where department = 'Proposal' or department = 'Internet' order by idx;


-- query 15. 사원 테이블에서 성이 Kim 씨인 사람의 튜플을 검색하시오.
select * from test.employers2
where name like 'Kim%';

-- query 16. 사원 테이블에서 생일이 1969-01-01 ~ 1973-12-31 인 튜플을 검색하시오.
select * from test.employers2
where birthdate between '1969-01-01' and '1973-12-31' order by idx;


-- query 17. 사원 테이블에서 주소가 null 인 튜플을 검색하시오.
select * from test.employers2
where address is null;



-- query 18. 사원 테이블에서 주소를 기준으로 내림차순 정렬시켜 상위 2개 튜플만 검색하시오.
select * from test.employers2
order by address desc limit 2;


-- query 19. 사원 테이블에서 부서를 기준으로 오름차순 정렬하고, 같은 부서에 대해서는 이름을 기준으로 내림차순 정렬시켜서 검색하시오.
select * from test.employers2
order by department asc, name desc;


-- query 20. 취미가 Dance인 사원의 이름과 주소를 검색하시오.

-- 오답 select activity.name, employers2.address from test.activity
-- where activity.hobby = 'Dance';

select name, address from test.employers2
where name = (select name from test.activity where hobby='Dance');


-- query 21. 취미활동을 하지 않는 사원들을 검색하시오.
select * from test.employers2
where name not in (select name from test.activity);


-- query 22. 취미활동을 하는 사원들의 부서를 검색하시오.
select * from test.employers2 order by idx;

select name, department from test.employers2
where name in (select name from activity) order by idx;



-- query 23. 경력이 10년 이상인 사원의 이름, 부서, 취미, 경력을 검색하시오.
select employers2.name, employers2.department, activity.hobby, activity.period
from employers2, activity
where activity.period >= 10 and employers2.name = activity.name;



















-- 상여금 테이블 생성
create table exsalary(
	exs_idx int primary key auto_increment,
    department varchar(10),
    name char(6),
    record char(10),
    bonus int
--    foreign key(name) references test.employers2(name)
);

select * from test.exsalary; 

insert into test.exsalary
values	(null, 'Proposal', 'Hong', 'Extends', 100),
		(null, 'Proposal', 'Ill', 'Extends', 100),
        (null, 'Proposal', 'Jun', 'Night', 120),
        (null, 'Proposal', 'Jang', 'Special', 90),
        (null, 'Internet', 'Gang', 'Special', 90),
        
        (null, 'Internet', 'Seo', 'Special', 90),
        (null, 'Internet', 'Park', 'Extends', 30),
        (null, 'Edit', 'Kim', 'Special', 80),
        (null, 'Edit', 'Jong', 'Extends', 40),
        (null, 'Edit', 'Sung', 'Night', 80),
        (null, 'Edit', 'Lim', 'Night', 80),
        (null, 'Edit', 'Hwang', 'Night', 50)
;

-- 제약 조건 삭제하기.
alter table exsalary
drop foreign key exsalary_ibfk_1;

delete from test.exsalary;

select * from test.exsalary;

alter table test.exsalary auto_increment = 1;








-- query 24. 상여금 테이블에서 상여내역 별로 상여금에 대한 일련 번호를 구하시오. 단, 순서는 내림차순이며 속성명은 NO 로 할 것.
 select name, record, bonus, row_number() over (partition by record order by bonus desc) as no 
 from test.exsalary;



-- query 25. 상여금 테이블에서 상여내역 별로 상여금에 대한 순위를 구하시오. 단, 순서는 내림차순이며, 속성명은 상여금순위로 하고, RANK() 함수를 이용할 것.
select record, bonus, rank() over (partition by record order by bonus desc) as ranking
from test.exsalary;



-- query 26. 상여금 테이블에서 부서별 상여금의 평균을 구하시오.
select department, avg(bonus) as average
from test.exsalary
group by department;


-- query 27. 상여금 테이블에서 부서별 튜플 수를 검색하시오.
select department, count(*) as count 
from test.exsalary
group by department;




-- query 28. 상여금 테이블의 부서, 상여내역, 그리고 상여금에 대해 부서별 상여내역별 소계와 전체 합계를 검색하시오. 단, 상여금합계로 하고, ROLLUP 함수를 사용할 것.
select department, record, sum(bonus) as sumbonus
from test.exsalary
group by department, record with rollup;

select * from test.exsalary;


-- query 29. 상여금 테이블의 부서, 상여내역, 상여금에 대해 부서별 상여내역별 소계와 전체 합계를 검색하시오. 단, 속성명은 상여금합계 로 하고, CUBE 함수 사용할 것.
-- select department, record, sum(bonus) as sumbonus
-- from test.exsalary
-- group by cube(department, record);






-- query 30. 사원 테이블과 직원 테이블을 통합하는 질의문을 작성하시오. 단, 같은 레코드가 중복되어 나오지 않게 하시오.

select * from worker1
union
select * from worker2;


-- 사원, 직원 테이블 생성하기
create table worker1(
	workername char(7),
    position char(5)
);


insert into worker1
values	('김형석', '대리'),
		('홍영선', '과장'),
        ('류기선', '부장'),
        ('김현천', '이사')
;

create table worker2(
	workername char(7),
	position char(5)
);

insert into worker2
values	('신원섭', '이사'),
		('이성호', '대리'),
        ('홍영선', '과장'),
        ('류기선', '부장')
;


select * from worker1;
select * from worker2;

-- query 31. 사원 테이블과 직원 테이블에 공통으로 존재하는 레코드만 통합하는 질의문을 작성하시오.




































































