drop database if exists  gig_economy;
create database gig_economy;
use gig_economy;
create table info(
	email varchar(50) unique not null,
    name varchar(50)  not null,
    contact_number varchar(50) not null,
    aadhar_card varchar(50) unique not null,
    primary key(aadhar_card,email)
    
);
create table skill(
	skill_type varchar(100) primary key
);
create table employer(
	aadhar_card varchar(50) ,
    job_id int auto_increment,
    job_title varchar(50),
    date_from date,
    date_to date,
    wages_daily int,
    wages_monthly int,
    payment_method varchar(20),
    job_discription varchar(120),
    primary key(job_id),
    foreign key (aadhar_card) REFERENCES  info(aadhar_card)
);
create table address(
	aadhar_card varchar(50) primary key,
	state varchar(20) not null,
    city varchar(25) not null,
    village varchar(30),
    foreign key(aadhar_card) references info(aadhar_card)
);

#make table for candidates and candidates skill

insert into skill values("construction worker"),("drivers"),("general helpers"),("cleaners"),("security guards"),("farm labour"),("hair slons"),("beauty parlors"),("small grocery stores"),("maids"),("retail outlets");
insert into info values("deepanshu1297@gmail.com","deepnshu","6265495916","0526d5931475");