-- 문항 6-1
create table Grade(
	id int not null auto_increment primary key,
    midterm varchar(3),
    finalterm varchar(3),
    enroll int unsigned,
    constraint foreign key fk_enroll(enroll) references Enroll(id)
    on delete set null
);
