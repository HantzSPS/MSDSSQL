create table access_group(
	gr_id int primary key,
    gr_name varchar(20) not null
);

insert into access_group(gr_id, gr_name)
values (1, "IT");

insert into access_group(gr_id, gr_name)
values(2, "sales");

insert into access_group(gr_id, gr_name)
values(3, "administration");

insert into access_group(gr_id, gr_name)
values(4, "operation");

select * from access_group;

create table users (
	userID int primary key,
    username varchar(50) not null,
    gr_id int null references access_group);
    
    
insert into users (userID, username, gr_id)
values(1, "Modesto", 1);

insert into users (userID, username, gr_id)
values(2, "Ayine", 1);

insert into users (userID, username, gr_id)
values(3, "Christopher", 2);

insert into users (userID, username, gr_id)
values(4, "Cheong Woo", 2);

insert into users (userID, username, gr_id)
values(5, "Saulat", 3);

insert into users (userID, username)
values(6, "Heidi");

select * from users;

create table room (
rm_id int primary key,
rm_name varchar(50) not null);

insert into room (rm_id, rm_name)
values (1, "101");

insert into room (rm_id, rm_name)
values (2, "102");

insert into room (rm_id, rm_name)
values (3, "Auditorium A");

insert into room (rm_id, rm_name)
values (4, "Auditorium B");

select * from room;

create table group_room (
gr_id int not null references access_group(gr_id),
rm_id int not null references room(rm_id),
constraint pk_group_room primary key(gr_id, rm_id)
);

insert into group_room(gr_id,rm_id)
values(1,1);

insert into group_room(gr_id,rm_id)
values(1,2);

insert into group_room(gr_id,rm_id)
values(2,2);

insert into group_room(gr_id,rm_id)
values(2,3);

select * from group_room;

-- All groups, and the users in each group. A group should appear even if there are no users assigned to the group
select ag.gr_name, us.username from access_group ag
left join users us
on ag.gr_id = us.gr_id;

-- All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been
-- assigned to them.
select rm.rm_name, g.gr_name from room rm
 left join group_room gr on rm.rm_id= gr.rm_id
 left join access_group g on gr.gr_id = g.gr_id;

-- A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted
-- alphabetically by user, then by group, then by room.
select u.username, ag.gr_name,  rm.rm_name from 
users u, room rm, access_group ag, group_room gr
where u.gr_id = ag.gr_id
and gr.rm_id = rm.rm_id
and gr.gr_id = ag.gr_id
order by username, gr_name, rm_name;

