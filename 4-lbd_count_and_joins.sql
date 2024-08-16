

use biblioteca;

# 1-faça uma consulta somando o total de multas da tabela emprestimo,
# traga tambem o total de livros emprestados 

select
	sum(multa) as totalDeMulta
    ,count(*) as livrosEmprestados
from
	emprestimo;

# 2-Faça uma consulta da tabela reserva agrupando pelo codigo do funcionario,
# contando a quantidade de livros reservados pelo funcionario

select
	e.codigoFuncionario as codigoFuncionario,
    count(*) as quantidade
from
	reserva as r
join
	copia as c
    on c.codigoObra = r.codigoObra
join
	emprestimo as e
    on e.codigoCopia = c.codigo

group by
	e.codigoFuncionario;
# 3-Faça uma consulta da tabela reserva agrupando pelo codigo do leitor,
# contando a quantidade de livros reservados pelo leitor


select
	codigoLeitor,
    count(*) as quantidade
from
	reserva
group by
	codigoLeitor;
    
# 4-Utilizando inner join extraia do banco de dados biblioteca 
# As reservas efetuadas pelos leitores exibindo o nome do leitor, nome da obra e data da reserva
# Os empréstimos efetuados pelos leitores exibindo o nome do leitor, nome da obra, e código da copia e nome do funcionarios

#reserva efetuada por leitores
select
	l.nome as NomeLeitor,
    o.tituloObra as NomeObra,
    r.dataReserva as DataReserva
from
	reserva  as r
join
	leitor as l
    on l.codigo = r.codigoLeitor
JOIN
	obra as o
    on o.codigo = r.codigoObra;
    
#emprestimo efetuado por leitores

select # nome do leitor, nome da obra, e código da copia e nome do funcionarios
	l.nome as NomeLeitor,
    o.tituloObra as NomeObra,
    c.codigo as codigoCopia,
    f.nome as nomeFuncionario
    
from
	emprestimo  as e
join
	leitor as l
    on l.codigo = e.codigoLeitor
join
	copia as c
    on c.codigo = e.codigoCopia
join
	obra as o
    on o.codigo = c.codigoObra
join
	funcionario as f
    on f.codigo = e.codigoFuncionario;
    
# 5-Utilizando left outer join extraia do banco de dados biblioteca 
# os leitores que nunca fizeram reservas 
# os leitores que nunca fizeram empréstimos
# as obras que nunca foram emprestadas

# leitores que não possui reserva
select
	nome,
    email,
    documento
from 
	leitor as l
left join
	reserva as r
    on r.codigoLeitor = l.codigo
where r.codigo is null;
    

# leitores que não possui emprestimo
select
	nome,
    email,
    documento
from 
	leitor as l

left join
	emprestimo as e
    on e.codigoLeitor = l.codigo
where
	e.codigo is null;
    
# obras que não foram emprestada

select
	ISBN,
    tituloObra,
    autores
    
from
	obra as o
left join
	copia as c
    on c.codigoObra = o.codigo
left join
	emprestimo as e
    on e.codigoCopia = c.codigo
where
	e.codigo is null

# select * from reserva
# select * from emprestimo
# select * from leitor
# select * from obra
# select * from copia
# select * from funcionario
	

