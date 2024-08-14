# Usando o bando de dados de biblioteca:
use biblioteca;

# 1-Crie um índice na tabela obra com os campos titulo e palavraChave
create index idx_titulo_palavraChave on obra (tituloObra,palavrasChave);
select * from obra;

# 2-Crie um indice na tabela leitor para nome
create index idx_nome on leitor (nome);

# 3-Crie um segundo indice na tabela leitor para documento
create index idx_documento on leitor (documento);

# 4-Utilizando a tabela auditlog do exercicio lbd08 adicione um novo campo chamado registroAlterado
alter table auditlog add column (registroAlterado varchar(100));


#5- crie uma trigger de update para a tabela leitor que alimente a tabela auditLog colocando como valor do campo registroAlterado  
# o valor antigo e o valor novo
delimiter //
create trigger tgr_update_leitor before update on leitor
for each row
begin
INSERT INTO auditlog
	(
    nomeTabela,
	registroAlterado
    )
VALUES
	(
    'leitor',
    case 
		when old.documento != new.documento 
			then concat("codigo: ",OLD.codigo," documento antigo: ", old.documento," documento novo: ",new.documento)
		when old.nome != new.nome 
			then concat("codigo: ",OLD.codigo," nome antigo: ", old.nome," nome novo: ",new.nome)
		when old.endereco != new.endereco 
			then concat("codigo: ",OLD.codigo," endereco antigo: ", old.endereco," endereco novo: ",new.endereco)
		when old.cidade != new.cidade 
			then concat("codigo: ",OLD.codigo," cidade antiga: ", old.cidade," cidade nova: ",new.cidade)
		when old.estado != new.estado 
			then concat("codigo: ",OLD.codigo," estado antigo: ", old.estado," estado novo: ",new.estado)
		when old.telefone != new.telefone 
			then concat("codigo: ",OLD.codigo," telefone antigo: ", old.telefone," telefone novo: ",new.telefone)
		when old.email != new.email 
			then concat("codigo: ",OLD.codigo," email antigo: ", old.email," email novo: ",new.email)
		when old.categoriaLeitor != new.categoriaLeitor 
			then concat("codigo: ",OLD.codigo," categoriaLeitor antiga: ", old.categoriaLeitor," categoriaLeitor nova: ",new.categoriaLeitor)
		when old.dataNascimento != new.dataNascimento 
			then concat("codigo: ",OLD.codigo," dataNascimento antiga: ", old.dataNascimento," dataNascimento nova: ",new.dataNascimento)
            else null end
    );

end;//
delimiter ;


# 6- crie uma trigger de update para a tabela obra que alimente a tabela auditLog colocando como valor do campo registroAlterado  
# o valor antigo e o valor novo
delimiter //
create trigger tgr_update_obra before update on obra
for each row
begin
INSERT INTO auditlog
	(
    nomeTabela,
	registroAlterado
    )
VALUES
	(
    'obra',
    case 
		when old.isbn != new.isbn 
			then concat("codigo: ",OLD.codigo," isbn antigo: ", old.isbn," isbn novo: ",new.isbn)
		when old.tituloObra != new.tituloObra 
			then concat("codigo: ",OLD.codigo," tituloObra antigo: ", old.tituloObra," tituloObra novo: ",new.tituloObra)
		when old.categoria != new.categoria 
			then concat("codigo: ",OLD.codigo," categoria antigo: ", old.categoria," categoria novo: ",new.categoria)
		when old.autores != new.autores 
			then concat("codigo: ",OLD.codigo," autores antiga: ", old.autores," autores nova: ",new.autores)
		when old.palavrasChave != new.palavrasChave 
			then concat("codigo: ",OLD.codigo," palavrasChave antigo: ", old.palavrasChave," palavrasChave novo: ",new.palavrasChave)
		when old.dataPublicacao != new.dataPublicacao 
			then concat("codigo: ",OLD.codigo," dataPublicacao antigo: ", old.dataPublicacao," dataPublicacao novo: ",new.dataPublicacao)
		when old.numeroEdicao != new.numeroEdicao 
			then concat("codigo: ",OLD.codigo," numeroEdicao antigo: ", old.numeroEdicao," numeroEdicao novo: ",new.numeroEdicao)
		when old.editora != new.editora 
			then concat("codigo: ",OLD.codigo," editora antiga: ", old.editora," editora nova: ",new.editora)
		when old.numeroPaginas != new.numeroPaginas 
			then concat("codigo: ",OLD.codigo," numeroPaginas antiga: ", old.numeroPaginas," numeroPaginas nova: ",new.numeroPaginas)
            else null end
    );

end;//
delimiter ;

