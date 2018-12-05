insert into Test(students, subjects)
 select s.id, j.id from Students s, Subjects j where mod(ceil(rand()*10)+ceil(s.id), 3)=0;

select * from Test;



select subjects, count(*) from Test group by subjects;