alter table Subject add column students smallint default 0 not null;

desc Subject;

select subject, count(*) from Enroll group by subject;

update Subject s set students = (select count(*) from Enroll where subject = s.id group by subject);
select * from Subject; -- 454

Delimiter //
create trigger tr_enroll_subject_students
	after insert on Enroll For Each Row
BEGIN

END //

delimiter ;

insert into Enroll(student, subject) values(1000, 1);

delete from Enroll where id = 4472;

select * from Enroll order by id desc;

alter table Student add column subjects smallint default 0 not null;

desc Student;
select * from Student;
select student, count(*) from Enroll group by student order by student desc;

update Student s set s.subjects = (select count(*) from Enroll where student = s.id group by student);

select * from Student order by id desc;

update Student set subjects = 0 where subjects is null;

insert into Subject(name) value('교육철학');
select * from Subject;