-- 문항 1
create table Student(
  id int unsigned NOT NULL AUTO_INCREMENT primary key,
  name varchar(31) NOT NULL,
  tel varchar(31),
  email varchar(31),
  birth date,
  addr varchar(31),
  gender bit(1)
);
desc Student;

create table Prof(
	id int unsigned not null auto_increment primary key,
    name varchar(31) not null,
    likecnt int not null
);
desc Prof;

create table Subject(
	id int unsigned not null auto_increment primary key,
    name varchar(31) not null,
    prof int unsigned,
    constraint foreign key fk_prof(prof) references Prof(id)
    on delete set null
);
desc Subject;

create table Enroll(
	id int unsigned not null auto_increment primary key,
    student int unsigned,
    subject int unsigned,
    constraint foreign key fk_subject(subjects) references Subject(id)
    on delete cascade,
    constraint foreign key fk_student(students) references Student(id)
    on delete cascade
);
desc Enroll;

-- 문항 2
insert into Grade(enroll, midterm, finalterm) select id, (100- ceil(rand()*45)), (100 - ceil(rand()*45)) from Enroll order by id ;

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
-- 문항 4
select * from Dept;

create table Dept(
  id int unsigned not null auto_increment primary key,
  name varchar(31) not null,
  prof int unsigned,
  student int unsigned,
  constraint foreign key fk_Dept_Prof(prof) references Prof(id) on delete set null,
  constraint foreign key fk_Dept_Student(student) references Student(id) on delete set null
);
desc Dept;

select * from Dept;
start transaction;
insert into Dept(name, prof) values("수학과", ceil(rand()*100));
insert into Dept(name, prof) values("경제학과", ceil(rand()*100));
insert into Dept(name, prof) values("기계공학과", ceil(rand()*100));
insert into Dept(name, prof) values("통계학과", ceil(rand()*100));
insert into Dept(name, prof) values("국어국문학과", ceil(rand()*100));
commit;

ALTER TABLE Student
ADD COLUMN dept INT UNSIGNED NULL AFTER gender,
ADD INDEX fk_Student_Dept_idx (dept ASC);
;
ALTER TABLE Student
ADD CONSTRAINT fk_Student_Dept
  FOREIGN KEY (dept)
  REFERENCES Dept (id)
  ON DELETE SET NULL;

update Student set dept = ceil(rand()*5);


update Dept d inner join Student s on d.id = s.dept set d.student = s.id;

-- 문항 5
create table Classroom(
  id int not null auto_increment primary key,
  classroom varchar(3));

insert into Classroom(classroom) value(101);
insert into Classroom(classroom) value(102);
insert into Classroom(classroom) value(103);
insert into Classroom(classroom) value(104);
insert into Classroom(classroom) value(105);
insert into Classroom(classroom) value(106);
insert into Classroom(classroom) value(107);
insert into Classroom(classroom) value(108);
insert into Classroom(classroom) value(109);
insert into Classroom(classroom) value(110);

alter table Subject
add column classroom int unsigned null after prof,
add index fk_Subject_Classroom_idx (classroom ASC);
;
alter table Subject
add constraint fk_Subject_Classroom
  foreign key (classroom)
  references Classroom (id)
  on delete set null;

update Subject j inner join Classroom c on j.id = c.id
  set j.classroom= c.id;

