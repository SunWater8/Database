-- 학생, 학과, 성적등급 테이블 생성

create table student99(
	num int primary key,
    name varchar(10),
    code varchar(4),
    superior int,
    score int,
    foreign key(code) references subject99(subjectcode)    
);

create table subject99(
	subjectcode char(4) primary key,
    subjectname varchar(10)
);

create table grade99(
	grade char(1) primary key,
    minscore int,
    maxscore int
);

insert into student99 
values	(15, 'Gogil', 'com', null, 83),
		(16, 'Leesu', 'han', null, 96),
        (17, 'Kimsu', 'com', 15, 95),
        (19, 'Amuga', 'han', 16, 75),
        (37, 'parkc', null, 17, 55);
        

insert into subject99
values	('com', 'computer'),
		('han', 'Korean'),
        ('eng', 'English');

insert into grade99
values	('A', 90, 100),
		('B', 80, 89),
        ('C', 70, 79),
        ('D', 0, 59);
        
        
select * from student99;
select * from subject99;
select * from grade99;





-- query 32. 학생 테이블과 학과 테이블에서 '학과코드' 값이 같은 튜플을 JOIN 하여 학번, 이름, 학과코드, 학과명을 출력하는 sql문을 작성하시오.



-- query 33. 학생 테이블과 성적등급 테이블을 JOIN 하여 각 학생의 학번, 이름, 성적, 등급을 출력하는 sql 문을 작성하시오.



-- query 34. 학생 테이블과 학과 테이블에서 학과코드 값이 같은 튜플을 JOIN 하여 학번, 이름, 학과코드, 학과명을 출력하는 sql 문을 작성하시오. 이때, 학과코드가 입력되지 않은 학생도 출력하시오.



-- query 35. 학생 테이블과 학과 테이블에서 학과코드 값이 같은 튜플을 JOIN하여 학번, 이름, 학과코드, 학과명을 출력하는 sql문을 작성하시오. 이때, 학과코드가 입력 안 된 학생이나 학생이 없는 학과코드도 모두 출력하시오.






























