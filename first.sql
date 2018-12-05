select now();

show variables like '%time_zone%';

set time_zone = 'Asia/seoul';

show processlist;


ALTER DATABASE betterdb DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

insert into Test2(name) value("김삼수");

insert into Students(name, addr, birth, tel, email) value("배준홍", "서울시 노원구 상계동", 19890305, "010-3686-9273", "better3311@naver.com");
insert into Students(name, addr, birth, tel, email) value("준홍배", "서울특별시 노원구 상계동", 19890306, "010-4686-9273", "better3312@naver.com");
insert into Students(name, addr, birth, tel, email) value("홍배준", "서울특별시 노원구 중계동", 19890307, "010-5686-9273", "better3313@naver.com");

truncate Students;
desc Students;

select * from Students;

delete from Students where id = 3;

show index from Students;
show table status;
update Students set gender = 0 where case when