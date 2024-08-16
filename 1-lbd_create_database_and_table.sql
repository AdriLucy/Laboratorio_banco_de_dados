

create database biblioteca;
use biblioteca;


create table obra(
	codigo int primary key auto_increment,
    ISBN varchar(100) not null,
	titulo_da_obra varchar(100) not null,
	categoria varchar(50) not null,
	autores varchar(100) not null,
	palavras_chaves varchar(100),
	data_da_publicacao timestamp,
	numero_da_edicao int,
	editora varchar(100),
	numero_da_pagina int
);

create table funcionario(
	codigo int primary key auto_increment, 
	nome varchar(100),
	endereco varchar(100),
	cidade varchar(50),
	estado varchar(20),
	telefone varchar(50),
	data_de_nascimento timestamp
    
);

create table usuario(
	documento_identificacao int primary key auto_increment,
	cpf varchar(100) unique,
	nome varchar(100),
	endereco varchar(100),
	cidade varchar(50),
	estado varchar(20),
	telefone varchar(50),
	data_nascimento timestamp,
	email varchar(100) unique
);

create table categoriaUsuario(
	codigo int primary key auto_increment,
	descricao text,
	numero_max_dias int,
	usuario int
);
alter table categoriaUsuario add foreign key (usuario)
references usuario(documento_identificacao);


alter table obra add column teste text;

alter table obra drop column teste;

drop table categoriaUsuario;
