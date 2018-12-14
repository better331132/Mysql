-- 문항 6-4
select j.name as '과목명',
       avg((g.midterm+finalterm)/2) as '과목평균',
       count(*) as '총 학생수'
 from Enroll e inner join Student s on e.student = s.id
               inner join Subject j on e.subject = j.id
               inner join Grade g on e.id = g.enroll
group by j.id
order by j.name;