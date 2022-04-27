-- 소유권자의 사용자 Id가 '홍길동'인 스키마 '대학교'를 정의하는 sql 문을 작성하시오

-- create schema university authorization hong; 

-- '성별'을 '남' 또는 '여'와 같이 정해진 1개의 문자로 표현되는 도메인 SEX를 정의하는 sql 문을 작성하시오.

create domain sex char(4)
default boy
constraint valid-gender check (value in ('girl','boy')); 

-- 이름, 학번, 전공, 성별, 생년월일로 구성된 학생 테이블을 정의하시오. 

create table student2(
	name varchar(10) not null,
    idnumber int primary key,
    field varchar(15) ,
    gender SEX,
    birthdate date,
    foreign key (field) references 학과(학과코드)
    -- cascade on delete set value in null and on modify same,
		on delete set null
        on update cascade,
    constraint '생년월일제약' check(birthdate >= 1980-01-01)
    
    
);



-- 고객 테이블에서 '주소'가 '안산시'인 고객들의 '성명'과 '전화번호'를 '안산고객'이라는 뷰로 정의하시오.

create view 안산고객(성명, 전화번호)
as select 성명, 전화번호 
from 고객 
where 주소=안산시;


-- 고객 테이블에서 unique 한 특성을 갖는 '고객번호' 속성에 대해 내림차순으로 정렬하여 '고객번호_idx'라는 이름으로 인덱스를 정의하시오.

create unique index 고객번호_idx 
on 고객(고객번호 desc);

-- 학생 테이블에 최대 3문자로 구성되는 '학년' 속성을 추가하시오.
alter table 학생 
add 학년 varchar(3);

-- 학생 테이블의 '학번'필드의 데이터 타입과 크기를 varchar(10)으로 하고 null 값이 입력되지 않도록 변경하시오.
alter table 학생
modify 학번 varchar(10) not null;

-- 학생 테이블을 제거하되, 학생 테이블을 참조하는 모든 데이터를 함께 제거하시오.
drop table 학생 cascade;





















-- 사용자 id 가 'NABI'인 사람에게 데이터베이스 및 테이블을 생성할 수 있는 권한을 부여하는 sql 문을 작성하시오.
grant resource to NABI;

show grants for test;

-- 사용자 id가 'star'인 사람에게 단순히 데이터베이스에 있는 정보를 검색할 수 있는 권한을 부여하는 sql 문을 작성하시오.
