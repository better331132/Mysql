-- 중간, 기말 성적을 가로로 배열한 경우
create table Grade(
	id int not null auto_increment primary key,
    midterm varchar(3),
    finalterm varchar(3),
    total varchar(4),
    enroll int unsigned,
    constraint foreign key fk_enroll(enroll) references Enroll(id)
    on delete no action
);
truncate Grade;
select * from Grade;
update Grade set enroll = Enroll.id where id>0;
insert Grade(midterm, finalterm)
 select (100- ceil(rand()*45)), (100 - ceil(rand()*45)) from Enroll order by rand();
update Grade set total=midterm+finalterm where id > 0;
insert into Grade(enroll, midterm, finalterm) select id, (100- ceil(rand()*45)), (100 - ceil(rand()*45)) from Enroll order by id ;
-- 1
select j.subject_name as '과목', 
	   s.student_name as '학생명', 
       g.midterm as '중간고사', 
       g.finalterm as '기말고사', 
       g.total as '총점', 
       (g.total)/2 as '평균',
       (case when (g.total)/2 > 90 then 'A'
		     when (g.total)/2 > 80 then 'B'
             when (g.total)/2 > 70 then 'C'
             when (g.total)/2 > 60 then 'D'
             else 'F' end) as '학점'
 from Enroll e inner join Student s on e.students = s.id
               inner join Subject j on e.subjects = j.id
               inner join Grade g on e.id = g.enroll order by j.subject_name;

-- 2
select j.subject_name as '과목',
       avg((g.midterm+finalterm)/2) as '과목평균',
       count(*) as '총 학생수'
 from Enroll e inner join Student s on e.students = s.id
               inner join Subject j on e.subjects = j.id
               inner join Grade g on e.id = g.enroll
group by j.subject_name
order by j.subject_name;

-- sub query
select max(a.student_name) from
(select s.id, s.student_name, j.subject_name, g.total
 from Enroll e inner join Student s on e.students = s.id
			   inner join Subject j on e.subjects = j.id
			   inner join Grade g on e.id = g.enroll 
	   order by g.total desc) a 
       group by a.subject_name limit 1;

select s.id, s.student_name, j.subject_name, g.total
 from Enroll e inner join Student s on e.students = s.id
			   inner join Subject j on e.subjects = j.id
			   inner join Grade g on e.id = g.enroll 
	   order by g.total desc;


-- 3
select s.student_name as '학생명',
       count(*) as '과목 수',
       sum(g.total) as '총점',
       avg(g.total/2) as '평균',
       (case when avg(g.total/2) > 80 then 'A'
			when avg(g.total/2) > 75 then 'B'
            when avg(g.total/2) > 72 then 'C'
            when avg(g.total/2) > 70 then 'D'
            else 'F' end) as '평점'
 from Enroll e inner join Student s on e.students = s.id
               inner join Subject j on e.subjects = j.id
               inner join Grade g on e.id = g.enroll
 group by s.student_name
 order by s.student_name;


select * from Student;
