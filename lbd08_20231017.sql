use biblioteca;

# 1-crie uma view chamada vw_emprestimos que faça uma consulta das tabelas leitor e empréstimo trazendo o nome do cliente e  nome da obra 

create view vw_emprestimos as
select
	l.nome as nomeCliente,
    o.tituloObra as nomeObra
    
from
	leitor as l
inner join
	emprestimo as e
    on e.codigoleitor = l.codigo
join
	copia as c
    on c.codigo = e.codigoCopia
join
	obra as o
    on o.codigo = c.codigoObra;
    
select * from vw_emprestimos;

# 2-crie uma tabela chamada auditlog{codigo, nomeTabela, registroRemovido, data} 

create table auditlog(
	codigo int primary key auto_increment,
    nomeTabela varchar(100),
    registroRemovido int,
    data datetime default now()
);

# 3-crie uma trigger para exclusão na tabela reserva que guarde na tabela auditlog os dados do registro removido
delimiter //
create trigger tgr_exclusao_reserva before delete on reserva
for each row
begin
INSERT INTO auditlog
	(
    nomeTabela,
	registroRemovido
    )
VALUES
	(
    'reserva',
    OLD.codigo
    );

end;//
delimiter ;

# 4-crie uma trigger para exclusão na tabela emprestimo que guarde na tabela auditlog os dados do registro removido
delimiter //
create trigger tgr_exclusao_emprestimo before delete on emprestimo
for each row
begin
INSERT INTO auditlog
	(
    nomeTabela,
	registroRemovido
    )
VALUES
	(
    'emprestimo',
    OLD.codigo
    );

end;//
delimiter ;
