-- 각 과목 교수이름
select j.*, p.name as "prof.name"
 from Subjects j inner join Profs p
 on j.profs = p.id;
 
-- 동아리 전체 목록에 리더 이름 함께 출력
select c.*, s.name as "Club leader"
 from Club c inner join Students s on c.leader = s.id; 

-- 과목별 등록 학생수
select e.subjects, max(j.name) as "subject name", count(*) 
 from Enroll e inner join Subjects j on e.subjects = j.id
 group by subjects;
 
-- 역사과목의 학생목록
select s.name, s.birth
 from Enroll e inner join Students s on e.students = s.id
               inner join Subjects j on e.subjects = j.id
 where j.name = "생명과학";

-- 특정과목을 듣는 서울 거주 학생 목록
select j.name, s.id, s.name
 from Enroll e inner join Students s on e.students = s.id
			   inner join Subjects j on e.subjects = j.id
 where j.name = "수리통계" and s.addr = "서울";

-- 특정 과목을 수강중인 지역별 학생수
select j.name, s.addr, count(*)
 from Enroll e inner join Students s on e.students = s.id
			   inner join Subjects j on e.subjects = j.id
 where j.name = "과학철학"
 group by s.addr;

-- 과목별 학생 목록
 select * from Subjects;
 
 