-- 문항 6-3
select j.name as '과목명', 
	   s.name as '학생명', 
       g.midterm as '중간', 
       g.finalterm as '기말', 
       g.midterm+finalterm as '총점', 
       (g.midterm+finalterm)/2 as '평균',
       (case when (g.midterm+finalterm)/2 > 90 then 'A'
		     when (g.midterm+finalterm)/2 > 80 then 'B'
             when (g.midterm+finalterm)/2 > 70 then 'C'
             when (g.midterm+finalterm)/2 > 60 then 'D'
             else 'F' end) as '학점'
 from Enroll e inner join Student s on e.student = s.id
               inner join Subject j on e.subject = j.id
               inner join Grade g on e.id = g.enroll order by j.name;