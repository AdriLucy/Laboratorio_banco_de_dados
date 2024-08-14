create database aulas2023; #criar

drop database biblioteca; #apagar

/* comentarios */
use aulas2023;

#drop table clinica;
create table clinica(
	codigo int primary key,
    nome varchar(100) not null,
    cnpj varchar(20) not null unique,
    senha varchar(100)
);

#drop table lixo
create table lixo(
	seila text

);


create table profissional(
	codigo bigint primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    senha varchar(100),
    tipo varchar(50) default 'auxiliar'
);

#select * from profissional

alter table profissional add column telefone varchar(30);


#drop table catalogo
create table catalogo(
	codigo bigint primary key auto_increment,
    nome varchar(100) not null,
    preparacao text,
    orientacao text,
    valor decimal(18,2) default 1,
    clinica int
);

#select * from catalogo

alter table catalogo add foreign key (clinica)
references clinica(codigo);

create table paciente(
	codigo bigint primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    senha varchar(100),
    genero char(1)
);
#select * from paciente

#drop table ficha
create table ficha(
	codigo bigint primary key auto_increment,
    dataFicha timestamp default now(),
    historico text,
    paciente bigint,
    clinica int
);

alter table ficha drop column clinica;
alter table ficha add column clinica int;

alter table ficha add foreign key (clinica)
references clinica(codigo);

alter table ficha add foreign key (paciente)
references paciente(codigo);

