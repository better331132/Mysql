create table Club(
	id int unsigned not null primary key,
    name varchar(31) not null,
    createdate timestamp not null default current_timestamp,
    leader int unsigned,
    
);