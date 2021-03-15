create table usersInfo(
user_id serial primary key,
firstname varchar(10) unique not null,
lastname varchar(50) not null,
age serial not null,
city varchar(16) not null,
country varchar(16) not null,
gender varchar(16) not null
)
alter table usersinfo drop column age
select * from usersinfo where max(user_id) 
select *
FROM usersinfo
ORDER BY user_id DESC 
LIMIT 1
commit 
ALTER TABLE users 
alter COLUMN user_id number;

insert into users(username, password, email)
values('zaur', 'zaur12','zkhudiev5061@ada.edu.az')
commit