/*----------------------------------------------------------------------
Banco: fastbank
Autor: Ralfe
Ultima alteração: 31/03/2025
Tipo: Inserções iniciais com dados exemplos
Descrição: Banco de dados de uma instituição financeira virtual fictícia
           como projeto da Unidade Curricular de banco de Dados (BCD)
-----------------------------------------------------------------------*/

-- Conecta no banco
use fastbank;


insert into endereco
	(logradouro, bairro, cidade, uf, cep)
values
	('Avenida São João, 156', 'Vila Joana', 'Jundiaí', 'SP', '13216000'),
	('Rua Paracatu, 698', 'Parque Imperial', 'São Paulo', 'SP', '04302021'),
	('Avenida Cristiano Olsen, 10', 'Jardim Sumaré', 'Araçatuba', 'SP', '16015244'),
	('Rua Serra de Bragança, 74', 'Vila Gomes Cardim', 'São Paulo', 'SP', '03318000'),
	('Rua Barao de Vitoria, 65', 'Casa Grande', 'Diadema', 'SP',	'09961660'),
	('Rua Pereira Estefano, 100', 'Vila da Saúde', 'São Paulo', 'SP', '04144070'),
	('Alameda do Carmo, 15', 'Barão Geraldo', 'Campinas', 'SP', '13084008');

-- Verifica resultado
select * from endereco;
   

insert into cliente
	(codigo_endereco, nome_razaosocial, nomesocial_fantasia, foto_logo, datanascimento_abertura, usuario, senha)
values
	(1, 'Alice Barbalho Vilalobos', 'Alice Vilalobos', '\\fotos\\1.jpg', '1992-05-17', 'alice', 987),
	(2, 'Sheila Tuna Espírito Santo', null, '\\fotos\\2.jpg', '1980-03-05', 'sheila', 123),
	(3, 'Abigail Barateiro Cangueiro', null, '\\fotos\\3.jpg', '1987-05-30', 'abigail', 147),
	(4, 'Regina e Julia Entregas Expressas ME', null, '\\fotos\\4.jpg', '2018-03-11', 'express', 987),
	(1, 'João Barbalho Vilalobos', null, '\\fotos\\5.jpg', '1990-06-15', 'joao', 357),
	(5, 'Juan e Valentina Alimentos ME', null, '\\fotos\\6.jpg','2015-11-12', 'avenida', 258),
	(6, 'Derek Bicudo Lagos', null, '\\fotos\\7.jpg', '2002-03-12', 'derek', 258),
	(7, 'Marcelo Frois Caminha', 'Ana Maria', '\\fotos\\8.jpg', '2001-11-23', 'ana', 654),
	(7, 'Gabriel e Marcelo Corretores Associados Ltda', 'Imobiliária Cidade', '\\fotos\\9.jpg', '2017-09-26', 'cidade', 474),
	(5, 'Jaime Câmara Valério', null, '\\fotos\\10.jpg', '1998-07-20', 'jaime', 369);

-- Verifica resultado
select * from cliente;    


insert into contato
	(codigo_cliente, ddd, numero, ramal, email, observacao)
values
	(1, '15', '3754-8198', 'Ramal 12', 'alicebv@yahoo.com','Comercial'),
	(1, '13', '98872-3866', null, null, 'Pessoal'),
	(2, '11', '3836-8266', null, 'sheila.santo@uol.com', null),
	(3, '11', '2605-8626', null, 'abigail.vilalobos@gmail.com', null),
	(4, '18', '99771-7848', null, 'express@gmail.com', null),
	(5, '16', '99184-1137', null, 'jao@gmail.com', null),		
	(6, '11', '96905-6363', null, 'avenida@hotmail.com', 'Horário comercial'),
	(7, '19', '2389-8133', 'Ramal 10', 'derek.bc@empresa.com', null),
	(7, '11', '98052-6863', null, 'derek.bc@gmail.com', 'Trabalho'),
	(8, '14', '2355-4677', 'Ramal 2', 'marcelofrois@gmail.com', 'Comercial'),
	(8, '18', '99890-3946', null, 'marcelofrois@uol.com', 'Trabalho'),
	(9, '11', '3456-2642', null, 'cidade@gmail.com', 'Escritório'),
	(9, '17', '97222-1107', null, null, 'Corretor'),
	(10, '18', '99874-9845', null, null, 'Pessoal'),
	(10, '19', '2533-3554', null, 'jaimecamara@hotmail.com', null);

-- Verifica resultado
select * from contato;     


insert into cliente_pf
	(codigo_cliente, cpf, rg)
values
	(1, '33474720040', '135769735'),
	(2, '25964866018', '159052075'),
	(3, '56069215028', '129752927'),
	(5, '91039176062', '358350293'),
	(7, '41396396012', '383172391'),
	(8, '41396396013', '383172392'),
	(10, '41396396014', '383172393');

-- Verifica resultado
select * from cliente, cliente_pf
where cliente.codigo = Cliente_pf.codigo_cliente;



insert into cliente_pj
	(codigo_cliente, cnpj, inscricao_municipal, inscricao_estadual)
values
	(4, '41100430000162', '652348.265.32', '804.332.566.351'),
	(6, '92532245000188', '258463.147.96', '568.016.087.935'),
	(9, '78802521000150', '458698.123.89', null);

-- Verifica resultado
select * from cliente, cliente_pj
where cliente.codigo = Cliente_pj.codigo_cliente;



insert into conta
	(codigo_conta_tipo, agencia, numero, limite, ativa)
values
	(1, '01470', '1234568', '3000.00', true),
	(1, '02582', '6549872', '4000.00', true),
/**/(2, '03695', '4567893', '0.00', false),
	(1, '02582', '2583697', '5000.00', true),
	(2, '02582', '1472580', '0.00', true),
	(2, '01470', '2648591', '0.00', true),
	(1, '01470', '1548789', '3500.00', true),
/**/(1, '02582', '2315487', '4000.00', false);

-- Verifica resultado
select * from Conta;



insert into cartao
	(codigo_conta, codigo_bandeira, numero, cvv, validade, situacao)
values
	(1, 1, '2233475802364659', '321', '2025-03-01', 'ativo'),
/**/(2, 2, '3333457811659329', '654', '2028-05-01', 'bloqueado'),
/**/(2, 3, '2828453678963265', '987', '2022-01-01', 'vencido'),
	(3, 4, '4444695847251436', '369', '2026-06-01', 'ativo'),
/**/(4, 1, '6969625134286178', '258', '2023-01-01', 'vencido'),
	(5, 3, '2356458965213497', '147', '2025-07-01', 'ativo'),
	(4, 2, '7777653298456325', '983', '2026-06-01', 'ativo'),
	(5, 1, '1326456952148569', '984', '2025-03-01', 'ativo'),
	(6, 2, '2654684768766648', '456', '2025-04-01', 'ativo'),
	(7, 1, '2165468743513635', '756', '2025-04-01', 'ativo');

-- Verifica resultado
select * from cartao;



insert into movimentacao
	(codigo_cartao, codigo_operacao, codigo_conta_destino, data_hora, valor)
values
	(1, 2, null, '2023-02-01 07:30:00', 1000.00),
	(9, 1, null, '2023-02-01 08:15:20', 2500.00),
	(4, 1, null, '2023-02-01 14:05:10', 3450.00),
	(10, 3, 2,   '2023-02-01 16:45:26', 1100.00),
	(4, 2, null, '2023-02-01 18:50:00', 950.00),
	(1, 1, null, '2023-02-01 20:00:30', 546.00),
	(4, 3, 7,    '2023-02-01 22:13:47', 5000.00),
	(4, 1, null, '2023-02-02 07:45:10', 3600.00),
	(6, 2, null, '2023-02-02 09:14:44', 2800.00),
	(7, 3, 1,    '2023-02-02 11:30:12', 750.00),
	(7, 1, null, '2023-02-02 13:13:00', 500.00),
	(6, 2, null, '2023-02-02 15:30:07', 9000.00),
	(7, 1, null, '2023-02-02 16:25:00', 2350.00),
	(8, 2, null, '2023-02-02 21:05:55', 6400.00),
	(8, 3, 4,    '2023-02-02 21:48:36', 2100.00),
	(8, 2, null, '2023-02-03 07:15:00', 600.00),
	(1, 2, null, '2023-02-03 07:36:15', 1750.00),
	(1, 1, null, '2023-02-03 08:05:55', 900.00),
	(8, 2, null, '2023-02-03 08:30:00', 4000.00),
	(10, 3, 4,   '2023-02-03 10:00:00', 5500.00),
	(9, 1, null, '2023-02-03 12:15:00', 360.00),
	(8, 3, 6,    '2023-02-03 14:20:45', 600.00),
	(7, 2, null, '2023-02-03 14:50:40', 3800.00),
	(6, 1, null, '2023-02-03 14:29:30', 2000.00),
	(1, 3, 6,    '2023-02-03 15:00:20', 850.00),
	(6, 2, null, '2023-02-03 16:05:00', 660.00),
	(5, 2, null, '2023-02-03 18:35:15', 780.00),
	(8, 2, null, '2023-02-04 07:15:00', 600.00),
	(1, 2, null, '2023-02-04 07:36:15', 1750.00),
	(1, 1, null, '2023-02-04 08:05:55', 900.00),
	(8, 2, null, '2023-02-04 08:30:00', 4000.00),
	(9, 3, 1,    '2023-05-04 10:00:00', 5500.00),
	(7, 1, null, '2023-02-04 12:15:00', 360.00),
	(8, 3, 2,    '2023-02-04 14:20:45', 600.00),
	(7, 2, null, '2023-02-04 14:50:40', 3800.00),
	(6, 1, null, '2023-02-04 14:29:30', 2000.00),
	(8, 2, null, '2023-02-05 08:15:00', 370.00),
	(1, 2, null, '2023-02-05 08:36:15', 1750.00),
	(1, 1, null, '2023-02-05 09:05:55', 2900.00),
	(8, 2, null, '2023-02-05 09:30:00', 450.00),
	(10, 3, 4,   '2023-02-05 09:00:00', 5800.00),
	(10, 1, null,'2023-02-05 09:15:00', 2360.00),
	(8, 3, 6,    '2023-02-05 10:20:45', 1600.00),
	(7, 2, null, '2023-02-05 10:25:40', 330.00),
	(6, 1, null, '2023-02-05 10:29:30', 2900.00),
	(8, 2, null, '2023-05-05 16:15:00', 3500.00),
	(1, 2, null, '2023-02-05 16:36:15', 1050.00),
	(1, 1, null, '2023-02-05 18:05:55', 7400.00),
	(8, 2, null, '2023-02-05 19:30:00', 6000.00),
	(8, 3, 4,    '2023-02-05 20:00:00', 1280.00),
	(6, 1, null, '2023-02-05 22:15:00', 690.00),
	(8, 3, 2,    '2023-02-05 22:20:45', 1450.00),
	(7, 2, null, '2023-02-05 23:50:40', 26800.00),
	(6, 1, null, '2023-02-05 23:55:30', 900.00);

-- Verifica resultado
select * from movimentacao;



insert into emprestimo
	(codigo_conta, valor_solicitado, data_solicitacao, aprovado, juros, data_aprovacao, numero_parcelas, observacao)
values
	(1, 10000.00, '2022-10-10', true,  0.05, '2022-10-16', 10, null),
	(2, 15000.00, '2022-11-15', true,  0.05, '2022-11-17', 12, 'Consignado'),
	(2, 25000.00, '2022-12-05', false, 0.065, null, 0, 'Recusado'),
	(3, 12000.00, '2022-12-10', false, 0.05,  null, 0, 'Recusado'),
	(5, 15000.00, '2023-01-10', true,  0.1,  '2023-01-13',24, 'Consignado');

-- Verifica resultado
select * from emprestimo;


insert into emprestimo_parcela
	(codigo_emprestimo, numero, data_vencimento, valor_parcela, data_pagamento, valor_pago)
values
	(1, 1,  '2022-11-15', 1050.00, '2022-11-14', 1050.00),
	(1, 2,  '2022-12-15', 1050.00, '2022-12-15', 1050.00),
	(1, 3,  '2023-01-15', 1050.00, '2023-01-16', 1050.00),
	(1, 4,  '2023-02-15', 1050.00, '2023-02-15', 1050.00),
	(1, 5,  '2023-03-15', 1050.00, '2023-03-14', 1050.00),
	(1, 6,  '2023-04-15', 1050.00, null, null),
	(1, 7,  '2023-05-15', 1050.00, null, null),
	(1, 8,  '2023-06-15', 1050.00, null, null),
	(1, 9,  '2023-07-15', 1050.00, null, null),
	(1, 10, '2023-08-15', 1050.00, null, null),
	(2, 1,  '2022-12-10', 1312.50, '2022-12-10', 1312.50),
	(2, 2,  '2023-01-10', 1312.50, '2023-01-12', 1312.50),
	(2, 3,  '2023-02-10', 1312.50, '2023-02-11', 1312.50),
	(2, 4,  '2023-03-10', 1312.50, '2023-03-09', 1312.50),
	(2, 5,  '2023-04-10', 1312.50, null, null),
	(2, 6,  '2023-05-10', 1312.50, null, null),
	(2, 7,  '2023-05-10', 1312.50, null, null),
	(2, 8,  '2023-07-10', 1312.50, null, null),
	(2, 9,  '2023-08-10', 1312.50, null, null),
	(2, 10, '2023-09-10', 1312.50, null, null),
	(2, 11, '2023-10-10', 1312.50, null, null),
	(2, 12, '2023-11-10', 1312.50, null, null),
	(5, 1, 	'2023-02-10', 687.50, '2023-02-10', 687.50),
	(5, 2, 	'2023-03-10', 687.50, '2023-03-08', 687.50),
	(5, 3, 	'2023-04-10', 687.50, null, null),
	(5, 4, 	'2023-05-10', 687.50, null, null),
	(5, 5, 	'2023-06-10', 687.50, null, null),
	(5, 6, 	'2023-07-10', 687.50, null, null),
	(5, 7, 	'2023-08-10', 687.50, null, null),
	(5, 8, 	'2023-09-10', 687.50, null, null),
	(5, 9, 	'2023-10-10', 687.50, null, null),
	(5, 10, '2023-11-10', 687.50, null, null),
	(5, 11, '2023-12-10', 687.50, null, null),
	(5, 12, '2024-01-10', 687.50, null, null),
	(5, 13, '2024-02-10', 687.50, null, null),
	(5, 14, '2024-03-10', 687.50, null, null),
	(5, 15, '2024-04-10', 687.50, null, null),
	(5, 16, '2024-05-10', 687.50, null, null),
	(5, 17, '2024-06-10', 687.50, null, null),
	(5, 18, '2024-07-10', 687.50, null, null),
	(5, 19, '2024-08-10', 687.50, null, null),
	(5, 20, '2024-09-10', 687.50, null, null),
	(5, 21, '2024-10-10', 687.50, null, null),
	(5, 22, '2024-11-10', 687.50, null, null),
	(5, 23, '2024-12-10', 687.50, null, null),
	(5, 24, '2025-01-10', 687.50, null, null);

-- Verifica resultado
select * from emprestimo_parcela;


insert into investimento
	(codigo_conta, codigo_investimento_tipo, codigo_grau_risco, aporte, prazo, rentabilidade, taxa_administracao, finalizado)
values
	(1, 1, 3,  10000.00,  'medio', 0.04, 1250.00, 1),
	(1, 5, 9,  125000.00, 'medio', 0.05, 0, 0),
	(2, 5, 9,  150000.00, 'longo', 0.05, 0, 0),
	(3, 1, 3,  20000.00,  'curto', 0.04, 1500.00, 0),
	(4, 6, 12, 200000.00, 'longo', 0.05, 0, 0),
	(3, 1, 3,  15000.00,  'medio', 0.04, 1600.00, 0),
	(5, 2, 2,  12000.00,  'medio', 0.04, 1500.00, 0),
	(1, 5, 12, 100000.00, 'medio', 0.05, 0, 0);

-- Verifica resultado
select * from investimento;


insert into cliente_conta
	(codigo_cliente, codigo_conta)
values
	(1,1),
	(2,2),
	(2,3),
	(3,4),
	(4,5),
	(1,3),
	(5,7),
	(6,8),
	(7,6),
	(8,4),
	(9,6),
	(10,5);

-- Verifica resultado
select * from cliente_conta;
