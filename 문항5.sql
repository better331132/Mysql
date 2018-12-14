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

select * from Subject;

