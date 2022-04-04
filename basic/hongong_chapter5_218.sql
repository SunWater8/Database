create table stmember( 
	member_id char(8) primary key,
    mem_name varchar(10) not null,
    mem_number tinyint not null,
    addr char(2) not null,
    phone1 char(3) null,
    phone2 char(8) null,
    height tinyint unsigned null,
    debut_date date null
);

create table stbuy(
	num int auto_increment primary key,
    mem_id char(8) not null,
    prod_name char(6) not null,
    group_name char(4) null,
    price int unsigned not null ,
    amount smallint unsigned not null,
    foreign key(mem_id) references stmember(member_id)
);

-- alter table ~ change column ~
alter table stbuy
change column price price int unsigned not null;

