insert into Students(name, tel, email) values('엄호희', '010-2937-3569', 'Tk91t1mqrL0A@gamil.com');

select * from Students order by id desc;

truncate Students;

select tel, count(*) as cnt from Students group by name order by cnt desc;

insert into Students(name, tel, email, birth) values('배준홍', '010-3686-9273', 'better3311@naver.com', '1989-03-05');

update Students set name=(select name from Test where id =1) where id = 1000;

select * from Students;
truncate Test;
insert into Test(name, tel, email, birth) values('배준홍', '010-3686-9273', 'better3311@naver.com', '1989-03-05');

select * from Students where name like '배%현';
alter table Students rename Students;
select * from Students where tel like '010-9%' and email between 'a' and 'b';

select distinct(birth) from Students where birth='1970-01-08';
select name, birth from Students where birth='1970-01-10';

select * from Students order by tel, name desc;
select * from Students order by rand();
select * from Student order by id limit 30, 50;



select addr, count(*) as cnt from Students group by addr order by cnt desc;
select addr, count(*) as cnt, avg(id) from Students
 group by addr having cnt > 90;

select name, birth, (case when birth < '1990%' then '아재' else '청춘' end) from Students limit 10;
 
update Students set gender=(case when birth mod 2 = 0 then 0 else 1 end) where id > 0;
 
select gender, count(*) from Students group by gender;

