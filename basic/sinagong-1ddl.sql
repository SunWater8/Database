-- 소유권자의 사용자 Id가 '홍길동'인 스키마 '대학교'를 정의하는 sql 문을 작성하시오

-- create schema university authorization hong; 

-- '성별'을 '남' 또는 '여'와 같이 정해진 1개의 문자로 표현되는 도메인 SEX를 정의하는 sql 문을 작성하시오.

-- 이름, 학번, 전공, 성별, 생년월일로 구성된 학생 테이블을 정의하시오. 

-- 고객 테이블에서 '주소'가 '안산시'인 고객들의 '성명'과 '전화번호'를 '안산고객'이라는 뷰로 정의하시오.

-- 고객 테이블에서 unique 한 특성을 갖는 '고객번호' 속성에 대해 내림차순으로 정렬하여 '고객번호_idx'라는 이름으로 인덱스를 정의하시오.

-- 학생 테이블에 최대 3문자로 구성되는 '학년' 속성을 추가하시오.


-- 학생 테이블의 '학번'필드의 데이터 타입과 크기를 varchar(10)으로 하고 null 값이 입력되지 않도록 변경하시오.


-- 학생 테이블을 제거하되, 학생 테이블을 참조하는 모든 데이터를 함께 제거하시오.






















-- 사용자 id 가 'NABI'인 사람에게 데이터베이스 및 테이블을 생성할 수 있는 권한을 부여하는 sql 문을 작성하시오.


-- 사용자 id가 'star'인 사람에게 단순히 데이터베이스에 있는 정보를 검색할 수 있는 권한을 부여하는 sql 문을 작성하시오.


-- 사용자 NABI 에게 고객 테이블에 대한 모든 권한과 다른 사람에게 권한을 부여할 수 있는 권한까지 부여하도록 하시오.


-- 사용자 star에게 부여한 고객 테이블에 대한 권한 중에서 update 권한을 다른 사람에게 부여할 수 있는 권한만 취소하는 sql 문.





















-- savepoint 에서 table 필요함.


create table employers (
	사원번호 int ,
    이름 char(6),
    부서 char(6)
);

insert into test.employers(사원번호,이름, 부서)
values	(10, '김기획', '기획부'),
		(20, '박인사', '인사부'),
		(30, '최재무', '재무부'),
		(40, '우영업', '영업부');
            
select * from test.employers;

commit;



-- 사원 테이블에서 '사원번호'가 40인 사원의 정보를 삭제한 후 commit을 수행하시오.



-- '사원번호'가 30인 사원의 정보를 삭제하시오.



-- savepoint 's1'을 설정하고 '사원번호'가 20인 사원의 정보를 삭제하시오.



-- savepoint 's2'를 설정하고 '사원번호'가 10인 사원의 정보를 삭제하시오.



-- savepoint 's2'까지 rollback을 수행하시오.



-- savepoint 's1'까지 rollback을 수행하시오.



-- savepoint 없이 rollback을 수행하시오.













-- savepoint 연습

delete from test.employers
where 사원번호 = 40;

delete from test.employers
where 사원번호=30;

savepoint S1;
delete from test.employers
where 사원번호 =20;

insert into test.employers
values(20, '박인사', '인사부');

savepoint S2;
delete from test.employers
where 사원번호=10;



rollback to S1;

rollback to S2;

select * from test.employers;

show table status like 'test.employers';


-- rollback이 실행 안되던 문제 해결!
select @@autocommit;
-- autocommit = 1 이라면 0으로 바꿔주기.
set autocommit=0;

rollback;




























