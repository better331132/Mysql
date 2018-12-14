-- 문항 3
alter table Club
 drop foreign key Club_ibfk_1;
;
alter table Club
 drop column leader,
 drop index fk_Club_Student;

alter table Club
 add column student int unsigned null after createdate,
 add column level int unsigned null after student,
 add index fk_Club_Student_idx(student ASC);

alter table Club
 add constraint fk_Club_Student foreign key(student) references Student(id) on delete cascade;
desc Club;

start transaction;
insert into Club(club, student) select "야구", ceil(rand()*1000) from Student where ceil(rand()*1000) mod 20 = 0;
update Club set level = 0 where club = "야구" and id > 0;
update Club set level = 1 where club = "야구" and id mod 10 = 0;
update Club set level = 2 where club = "야구" and mod(id+32,63)=0;
commit; 

start transaction;
insert into Club(club, student) select "축구", ceil(rand()*1000) from Student where ceil(rand()*1000) mod 20 = 0;
update Club set level = 0 where club = "축구" and id > 0;
update Club set level = 1 where club = "축구" and id mod 10 = 0;
update Club set level = 2 where club = "축구" and mod(id+32,63)=0;
commit; 

start transaction;
insert into Club(club, student) select "등산", ceil(rand()*1000) from Student where ceil(rand()*1000) mod 20 = 0;
update Club set level = 0 where club = "등산" and id > 0;
update Club set level = 1 where club = "등산" and id mod 10 = 0;
update Club set level = 2 where club = "등산" and mod(id+32,63)=0;
commit; 

start transaction;
insert into Club(club, student) select "요트", ceil(rand()*1000) from Student where ceil(rand()*1000) mod 20 = 0;
update Club set level = 0 where club = "요트" and id > 0;
update Club set level = 1 where club = "요트" and id mod 10 = 0;
update Club set level = 2 where club = "요트" and mod(id+32,63)=0;
commit; 

start transaction;
insert into Club(club, student) select "웨이크보드", ceil(rand()*1000) from Student where ceil(rand()*1000) mod 20 = 0;
update Club set level = 0 where club = "웨이크보드" and id > 0;
update Club set level = 1 where club = "웨이크보드" and id mod 10 = 0;
update Club set level = 2 where club = "웨이크보드" and mod(id+32,63)=0;
commit; 

start transaction;
insert into Club(club, student) select "탁구", ceil(rand()*1000) from Student where ceil(rand()*1000) mod 20 = 0;
update Club set level = 0 where club = "탁구" and id > 0;
update Club set level = 1 where club = "탁구" and id mod 10 = 0;
update Club set level = 2 where club = "탁구" and mod(id+32,63)=0;
commit; 

start transaction;
insert into Club(club, student) select "사진", ceil(rand()*1000) from Student where ceil(rand()*1000) mod 20 = 0;
update Club set level = 0 where club = "사진" and id > 0;
update Club set level = 1 where club = "사진" and id mod 10 = 0;
update Club set level = 2 where club = "사진" and mod(id+32,63)=0;
commit; 

start transaction;
insert into Club(club, student) select "합주", ceil(rand()*1000) from Student where ceil(rand()*1000) mod 20 = 0;
update Club set level = 0 where club = "합주" and id > 0;
update Club set level = 1 where club = "합주" and id mod 10 = 0;
update Club set level = 2 where club = "합주" and mod(id+32,63)=0;
commit; 

start transaction;
insert into Club(club, student) select "자원봉사", ceil(rand()*1000) from Student where ceil(rand()*1000) mod 20 = 0;
update Club set level = 0 where club = "자원봉사" and id > 0;
update Club set level = 1 where club = "자원봉사" and id mod 10 = 0;
update Club set level = 2 where club = "자원봉사" and mod(id+32,63)=0;
commit; 

start transaction;
insert into Club(club, student) select "모의투자", ceil(rand()*1000) from Student where ceil(rand()*1000) mod 20 = 0;
update Club set level = 0 where club = "모의투자" and id > 0;
update Club set level = 1 where club = "모의투자" and id mod 10 = 0;
update Club set level = 2 where club = "모의투자" and mod(id+32,63)=0;
commit; 