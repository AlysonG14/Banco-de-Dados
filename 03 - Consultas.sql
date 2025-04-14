use fastbank;

select * from cliente;

select nome_razaosocial as Nome,
	   usuario as Usuário
from cliente;

select * from endereco
where cidade <> 'São Paulo'; 

select * from endereco
where cidade <> 'São Paulo' and logradouro like '%Paulo'; -- Like -> Ele faz uma comparação para procurar uma variável armazenado dentro do atríbuto 

select * from endereco
where logradouro like '%de%';

select * from endereco
where bairro like '%dim %';

select agencia as Agência,
	   numero as Número,
	   if(ativa = 0, 'Inativa', 'Ativa') as Status
from conta;

select valor_solicitado as 'Valor Solicitado', 
	   numero_parcelas as 'Número de Parcelas',
       data_solicitacao as 'Data de Solicitação'
from emprestimo
where data_solicitacao between '2022-12-01' and data_solicitacao < '2022-12-31'; -- Filtra se a data de solicitação é maior do que no começo de dezembro de 2022

select codigo_operacao as 'Código da operação',
	   valor
from movimentacao
where valor between 1000 and 3000
order by valor
limit 3;

select distinct codigo_bandeira,
	   situacao
from cartao
order by codigo_bandeira;

-- Funções de Agregração

select max(valor) as 'Menor Movimentação',
	   max(valor) as 'Maior Movimentação',
       sum(valor) as 'Total de Movimentações',
       avg(valor) as 'Média de Movimentações', -- avg -> média
       count(valor) as 'Quantidade de Movimentações'
from movimentacao;
-- Agrupamentos (group by)
select codigo_cartao as 'Código do cartão',
	   codigo_operacao as 'Código de Operação',
	   sum(valor) as 'Total de Movimentação por Cartão e Operação' 
from movimentacao
group by codigo_cartao, codigo_operacao
order by codigo_cartao;

select * 
from operacao;

-- select codigo_operacao as 'Código da operação',
	--   max(valor) as 'Menor Movimentação',
	  --  max(valor) as 'Maior Movimentação',
       -- sum(valor) as 'Total de Movimentações',
       -- avg(valor) as 'Média de Movimentações', -- avg -> média
       -- count(valor) as 'Quantidade de Movimentações'
-- from movimentacao;
-- group by codigo_operacao

-- Formatações


-- Moeda
select format(valor_solicitado, '2', 'pt_BR' ) as 'Português Brasil',
	   format(valor_solicitado, '2', 'de_DE' ) as 'German',
       format(valor_solicitado, '2', 'en_US' ) as 'US English'
from emprestimo;

select concat('R$ ', format(valor_solicitado, '2', 'pt_BR' )) as 'Português Brasil'
from emprestimo;

-- Porcentagem
select juros as 'Como Fração',
	   format(juros * 100, '2') as 'Como Inteiro',
	   concat(format(juros * 100, '2'), '%') as 'Como Porcentagem'
from emprestimo;

-- Data
select date_format(data_solicitacao, '%d/%m/%y') as 'Data Abreviada',
	   date_format(data_solicitacao, '%d/%m/%Y') as 'Data abreviada (ano com 4 digitos)',
       date_format(data_solicitacao, '%d de %M de %Y') as 'Data por extenso',
       date_format(data_solicitacao, '%W, %d de %M de %Y') as 'Data por extenso (dia da semana)'
from emprestimo;


-- Hora

select time_format(data_hora, '%h:%i:%s') as 'Horário da Movimentação',
	   time_format(data_hora, '%h:%i:%s (%p)') as 'Horário da Movimentação',
       time_format(data_hora, '%H:%i:%s') as 'Horário da Movimentação',
       time_format(data_hora, '%r') as 'Horário da Movimentação'
from movimentacao