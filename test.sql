-- 각 테이블 작성
CREATE TABLE `Students` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `addr` varchar(45) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL COMMENT '남 = 0, 여 = 1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table Club(
	id int unsigned not null auto_increment primary key,
    name varchar(31) not null,
    createdate timestamp not null default current_timestamp,
    leader int unsigned,
    constraint foreign key fk_Club_Students(leader) references Students(id)
    on delete restrict
);

create table Profs(
	id int unsigned not null auto_increment primary key,
    name varchar(31) not null,
    likecnt int not null
);

create table Subjects(
	id int unsigned not null auto_increment primary key,
    name varchar(31) not null,
    profs int unsigned,
    constraint foreign key fk_profs(profs) references Profs(id)
    on delete set null
);

create table Enroll(
	id int unsigned not null auto_increment primary key,
    students int unsigned,
    subjects int unsigned,
    constraint foreign key fk_subjects(subjects) references Subjects(id)
    on delete cascade,
    constraint foreign key fk_students(students) references Students(id)
    on delete cascade
);

-- 교수 목록 작성
insert into Profs(name, likecnt)
 select name, ceil(rand() * 100) from Students order by rand() limit 100;
 
-- 클럽 목록 작성
insert into Club(name, leader) values("야구",100);
insert into Club(name, leader) values("축구",200);
insert into Club(name, leader) values("등산",300);
insert into Club(name, leader) values("요트",400);
insert into Club(name, leader) values("웨이크보드",500);
insert into Club(name, leader) values("탁구",600);
insert into Club(name, leader) values("사진",700);
insert into Club(name, leader) values("합주",800);
insert into Club(name, leader) values("자원봉사",900);
insert into Club(name, leader) values("모의투자",1000);

-- 과목 목록 작성
insert into Subjects(name,profs) values("수리통계",10);
insert into Subjects(name,profs) values("생명과학",20);
insert into Subjects(name,profs) values("과학철학",30);
insert into Subjects(name,profs) values("교육심리학",40);
insert into Subjects(name,profs) values("수학교육론",50);
insert into Subjects(name,profs) values("스피치와토론",60);
insert into Subjects(name,profs) values("중급회계",70);
insert into Subjects(name,profs) values("기초일본어",80);
insert into Subjects(name,profs) values("경제학원론",90);
insert into Subjects(name,profs) values("아시아의 역사문화",100);

-- 수강신청 목록 작성
insert into Enroll(students, subjects)
 select s.id, j.id from Students s, Subjects j where mod(ceil(rand()*1000)+ceil(s.id), 3)!=0;
 
-- 과목별 학생 수 확인
select subjects, count(*) from Enroll group by subjects;

-- 학생별 수강신청 현황 확인
select students, count(*) from Enroll group by students;