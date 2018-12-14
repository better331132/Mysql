DELIMITER $$
CREATE Procedure sp_col(_col varchar(31)) 
BEGIN
	select count(*) from Enroll group by _col;
END $$
DELIMITER ;


call sp_col(student);

select * from Student;
	select count(*) from Enroll group by student;

DELIMITER $$
CREATE Procedure sp_col1(_student smallint) 
BEGIN
	select * from Enroll where student = _student ;
END $$
DELIMITER ;
call sp_col1(3);

Delimiter $$
create procedure sp_table(_table varchar(31))
begin
SET @sql = CONCAT('select * from ', _table);
PREPARE myQuery from @sql;
EXECUTE myQuery;
DEALLOCATE PREPARE myQuery;
end $$
Delimiter ;

call sp_table('Student');
select * from Student;

call sp_clubmember_level('서라재');

Delimiter //
create procedure sp_club_level (_club_name varchar(100))
Begin
    declare v_club smallint;
   select id into v_club from Club where name = _club_name;

   select s.name, case_level(name)
        from Clubmember cm  inner join student s on cm.student = s.id
        where cm.club = v_club;

end //
Delimiter ;