-- 중간, 기말 성적을 가로로 배열한 경우
create table Grade(
	id int not null auto_increment primary key,
    mid_grade varchar(3),
    final_grade varchar(3)
);

select * from Grade;
insert Grade(mid_grade, final_grade)
 select (100- ceil(rand()*40)), (100 - ceil(rand()*40)) from Enroll order by rand();


select s.name, j.name, g.mid_grade, g.final_grade
 from Enroll e inner join Students s on e.students = s.id
               inner join Subjects j on e.subjects = j.id
               inner join Grade g on e.id = g.id order by s.name;

-- 중간, 기말 세로성적일때를 고려해보자

create table New_Grade(
	id int not null auto_increment primary key,
    new_grade varchar(3)
);

select * from New_Grade;

insert New_Grade(new_grade)
 select (100- ceil(rand()*40)) from Enroll order by rand();
 
truncate New_Grade;
