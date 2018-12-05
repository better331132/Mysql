create table Club(
	id int unsigned not null primary key,
    name varchar(31) not null,
    createdate timestamp not null default current_timestamp,
    leader int unsigned,
    
);

create table Subjects(
	id int unsigned not null primary key,
    name varchar(31) not null,
    profs int unsigned not null,
    constraint foreign key fk_profs(profs) references Profs(id)
    on delete set null
);
create table Profs(
	id int unsigned not null primary key,
    name varchar(31) not null,
    likecnt int not null
);
create table Enroll(
	id int unsigned not null primary key,
    students int unsigned,
    subjects int unsigned,
    constraint foreign key fk_subjects(subjects) references Subjects(id)
    on delete cascade,
    constraint foreign key fk_students(students) references Students(id)
    on delete cascade
);

insert into Enroll(students, subjects)
 select s.id, j.id from Students s, Subjects j where mod(ceil(rand()*10)+ceil(s.id), 3)=0;

select * from Enroll;

select subjects, count(*) from Enroll group by subjects;