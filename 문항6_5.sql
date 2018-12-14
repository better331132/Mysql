-- 문항 6-5
select s.name as '학생명',
       count(*) as '과목수',
       sum(g.midterm+finalterm) as '총점',
       avg((g.midterm+finalterm)/2) as '평균',
       (case when avg((g.midterm+finalterm)/2) > 80 then 'A'
			when avg((g.midterm+finalterm)/2) > 75 then 'B'
            when avg((g.midterm+finalterm)/2) > 72 then 'C'
            when avg((g.midterm+finalterm)/2) > 70 then 'D'
            else 'F' end) as '평점'
 from Enroll e inner join Student s on e.student = s.id
               inner join Subject j on e.subject = j.id
               inner join Grade g on e.id = g.enroll
 group by s.id
 order by s.name;