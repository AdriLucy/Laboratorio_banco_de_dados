use biblioteca;

#1-Faça o union das tabelas leitor e funcionario extraia os campos nome e telefone ordernando pelo nome de forma crescente
select
	nome,
    telefone
from
	leitor
union
select
	nome,
    telefone
from
	funcionario
Order by
	nome;
    
# 2-Faça o union all das tabelas emprestimo e reserva extraia os campos codigoLeitor, dataReserva, dataEmprestimo, 
# crie uma coluna para identificar a origem dos dados

select
	codigoLeitor,
    dataEmprestimo as data,
    'emprestimo' as Origem
from
	emprestimo
union all
select
	codigoLeitor,
	dataReserva  as data,
    'reserva' as Origem
from
	reserva
Order by
	origem,
    codigoLeitor;
    
# 3-Faça o except das tabelas leitor e funcionario, para identificar quais leitores nao são funcionarios
select 
	nome, telefone 
from 
	leitor
except
select 
	nome, telefone 
from 
	funcionario;
    
# 4-Faça o intersect das tabelas obra e reserva para identificar quais obras ja foram reservadas

select 
	codigo as codigoObra
from 
	obra
intersect
select
	codigoObra
from 
	reserva;
    
# 5-usando o like traga o nome de todos os functionarios e clientes que tenham o nome silva

select
	*
from
	(
	select
		nome,
		telefone
	from
		leitor
	union
	select
		nome,
		telefone
	from
		funcionario
	)leitorFuncionario
where
	nome like '%silva%'
Order by
	nome;
    
# 6-usando o between traga todos os emprestimos realizados nos ultimos 60 dias

select
	*
from
	emprestimo
where
	dataEmprestimo between date_add(now(),INTERVAL -60 DAY) and now() 
    
