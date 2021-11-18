drop database if exists  gig_economy;
create database gig_economy;
use gig_economy;

create table info(
	email varchar(50) unique not null,
    name varchar(50)  not null,
    contact_number varchar(50) not null,
    aadhar_card varchar(50)  not null,
    primary key(email)
    
);
create table skill(
	skills varchar(100) primary key
);
create table employer(
	email varchar(50) ,
    job_id int auto_increment,
    job_title varchar(50),
    date_from date,
    date_to date,
    wages_daily int,
    wages_monthly int,
    payment_method varchar(20),
    job_discription varchar(120),
    primary key(job_id),
    foreign key (email) REFERENCES  info(email)on update cascade on delete cascade
);
create table address(
	email varchar(50) primary key,
	state varchar(20) not null,
    city varchar(25) not null,
    village varchar(30),
    foreign key(email) references info(email)on update cascade on delete cascade
);
create table candidate(
	candidate_id int not null auto_increment,
	self_discription varchar(120),
    email varchar(50) not null,
    picture varchar(250),
    upi_id varchar(50),
    foreign key(email) references info(email)on update cascade on delete cascade,
    primary key(candidate_id)
);
create table candidate_skill(
	candidate_id int ,
    skills varchar(100),
    foreign key(candidate_id) references candidate(candidate_id)on update cascade on delete cascade,
    foreign key(skills) references skill(skills)on update cascade on delete cascade,
    primary key(candidate_id, skills)
);
create table job_skill(
	job_id int ,
    skills varchar(100),
    foreign key(skills) references skill(skills)on update cascade on delete cascade,
    foreign key(job_id) references employer(job_id)on update cascade on delete cascade,
    primary key(job_id, skills)
);
create table job_applied(
	job_id int not null,
    candidate_id int not null,
    approve boolean,
    foreign key(job_id) references employer(job_id)on update cascade on delete cascade,
	foreign key(candidate_id) references candidate(candidate_id)on update cascade on delete cascade,
    primary key(job_id,candidate_id)
);
