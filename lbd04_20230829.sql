use biblioteca;
start transaction;

INSERT INTO 
	categorialeitor(
		codigo,
		nomeCategoria,
		dias
    )
VALUES
	(1,'básico',7),
    (2,'profissional',14),
    (3,'vip',31);
#select * from categorialeitor

INSERT INTO 
	categoriaobra(
		codigo,
		nomeCategoria
	)
VALUES
	(1,'fantasia'),
    (2,'ficcao cientifica'),
    (3,'acao');


insert into 
	funcionario(codigo,nome,endereco,cidade,estado,telefone,email,data_de_nascimento)
values
	(1,'José','rua das atividades','suzano','sp','985476645','atividade@fatec.com','1985-05-04'),
	(2,'maria','rua dos exercicios','Mogi','sp','9976973169','exercicio@fatec.com','1975-09-01'),
	(3,'josefá','rua das tarefas','ferraz','sp','9854446531','tarefas@fatec.com','1991-01-03');
#select * from funcionario

INSERT INTO 
	leitor(
		codigo,
        documento,
		nome,
		endereco,
		cidade,
		telefone,
		email,
		categoriaLeitor,
		dataNascimento
	)
VALUES
	(1,'3514968491','Lucy','sei la','qualquer coisa','6465465489','lucy*****@sei.la',3,'1996-11-17'),
    (2,'6541321948','David','sei la','qualquer coisa','6465465489','david*****@sei.la',2,'1999-02-26'),
    (3,'3189413212','Leo','tbm nao sei','outra coisa','965564112','leo*****@sei.la',1,'1998-08-14');
#select * from leitor	
    
   
INSERT INTO 
	obra(
		codigo,
        ISBN,
		tituloObra,
		categoria,
		autores,
		palavrasChave,
		dataPublicacao,
		numeroEdicao,
		editora,
		numeroPaginas
	)
    
VALUES
	(1,'6545','senhor dos aneis',1,'tolkien','dragao','1954-07-29','1','darkside',400),
    (2,'4564','frankstein',2,'Mary Shelley','ciencias','1818-01-01','2','sei nao',250),
    (3,'1231','cronicas do gelo e fogo',1,'George R.R. Martins','dragao','1996-08-01','3','tbm nao sei',550);

 #select obra.*, categoriaobra.nomeCategoria from obra left join categoriaobra on categoriaobra.codigo = obra.categoria
    
INSERT INTO 
	copia(
		codigoObra,
		status
    )
VALUES
	(1,'disponivel'),
    (2,'alugado'),
    (3,'disponivel');

INSERT INTO 
	reserva(
		codigoLeitor,
        codigoObra
	)
VALUES
	(1,2),
    (1,3),
    (3,2);
    
#select * from reserva

INSERT INTO 
	emprestimo(
		codigo,
        dataPrevistaRetirada,
		dataPrevistaDevolucao,
		codigoLeitor,
		codigofuncionario,
		codigoCopia,
		diasAtraso,
		multa
	)
VALUES
	(1,'2023-09-09','2023-09-13',1,1,1,4,40),
    (2,'2023-09-14','2023-09-20',2,2,2,5,50),
    (3,'2023-09-19','2023-09-25',3,3,3,6,60);

# select * from emprestimo

delete from categoriaLeitor where codigo >= 100;
delete from categoriaObra where codigo >= 100;
delete from copia where codigo >= 100;
delete from emprestimo where codigo >= 100;
delete from leitor where codigo >= 100;
delete from obra where codigo >= 100;



update 
	categorialeitor
set
	dias = dias + 3
where
	codigo >= 1;
    
update
	emprestimo
set
	multa = 0
where
	multa < 50
    and codigo >= 1;
