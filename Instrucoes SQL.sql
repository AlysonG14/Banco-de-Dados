-- Exemplos e testes de instruções SQL DDL
/*
	user (create, alter e drop)
    database -> (create, alter e drop) 
    table -> (create, alter e drop)
    constraints -> (create, alter e drop)
*/

-- Criação do Banco
create database exemplosSQL;

-- Exclusão do banco
-- drop database exemplosSQL;

-- Conectar no banco
use exemplosSQL;

-- Criação de tabela
create table pessoa (
	codigo int auto_increment, -- gera o código automaticamente
    nome varchar(50) not null, -- atributo não opcional
    constraint pk_pessoa primary key (codigo) -- Restrições/Regras
);

-- Acrescentar atributo
alter table pessoa
add column endereco varchar(10),
add column login varchar(10),
add column senha varchar(10);

-- Alterar um atributo (nome)
alter table pessoa
change column login usuario varchar(10) not null;

-- Alterar um atributo (tipo)
alter table pessoa
modify column senha int not null;

-- Excluir um atributo
alter table pessoa
drop column endereco;

-- Acrescentar constraints
alter table pessoa
add constraint uk_pessoa unique (usuario);

alter table pessoa
add constraint chk_pessoa check (senha >= 000000 and senha <= 999999);

-- Exemplos e testes de instruções SQL DML
/*
	insert
	update
	delete
	select
*/

-- Inserção (um registro)
insert into pessoa (nome, usuario, senha)
values ('João', 'joao', 123456);

-- Consulta/pesquisa/busca
select * from pessoa;

-- Inserção (vários registro)
insert into pessoa (nome, usuario, senha)
values ('Maria', 'maria', 654321),
       ('Joaquim', 'joca', 987654),
       ('Alfredo', 'alfredo', 654123);

-- Consulta
select * from pessoa;

-- Alteração
update pessoa 
set usuario = 'joaquim' 
where codigo = 3;

-- Consulta
select * from pessoa;

-- exclusão
delete from pessoa
where codigo = 3;

-- Consulta
select * from pessoa;

create table Dependentes(
	codigo int auto_increment,
    nome varchar(50),
    vinculo varchar(50),
    constraint pk_Atributos primary key (codigo)
);

-- Criação de Tabela Dependentes
insert into Dependentes(nome, vinculo)
values ('Antonio', 'Filho'),
	   ('Carlos', 'Filho'),
       ('Francisco', 'Conjugue'),
       ('Ana', 'Conjugue');
 
 -- Alterar o vínculo da dependência da Ana
update Dependentes
set vinculo = 'Filha'
where codigo = 4;

-- Excluir a dependente do Carlos
delete from Dependentes
where codigo = 2;

-- Acrescentando a coluna codigoPessoa int

alter table Dependentes
add column codigoPessoa int;

-- 	Excluir todos os registros da tabela dependentes

delete from Dependentes;

-- Estabelecer relacionameento 1-> n (pessoa-dependente)

alter table pessoa
add constraint fk_pessoa_dependente foreign key (codigo) references dependente (codigoPessoa);

-- Resultado Final
SELECT * FROM Dependentes;
