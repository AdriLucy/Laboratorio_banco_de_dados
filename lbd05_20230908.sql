USE biblioteca;
#### 1- usei o join para não precisar adivinhar o código da categoria aluno  ###
SELECT
	l.*,
    cl.nomecategoria
FROM
	leitor as l
JOIN
	categorialeitor as cl
    on cl.codigo = l.categoriaLeitor
WHERE
	l.cidade = 'São Paulo'
    and cl.NomeCategoria = 'Aluno'
ORDER BY
	email;
 
#### 2.  ###

SELECT
	*
FROM 
	funcionario
WHERE
	NOT cidade = 'São Paulo'
ORDER BY
	Nome;
    
### 3. ###

SELECT
	o.tituloObra
    ,o.autores
FROM
	reserva as r
JOIN
	obra as o
    on o.codigo = r.codigoObra
ORDER BY
	tituloObra;
    
