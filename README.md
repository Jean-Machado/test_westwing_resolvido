Essa foi a parte do códgigo que desenvolvi a resolução

-- RESOLUÇÂO --

-- 1º Já especifiquei no inicio do código a criação de um banco de dados específico para este exercício 
-- (CREATE DATABASE IF NOT EXISTS resolucao_teste_westwingbrasil)

-- 2º Visualizo os campos das tableas através deste comando:
SELECT * FROM cliente, casa, bairro, carro;


-- 3º Seleciono o nome dos clientes, as cores das casas, os bairros e os carros
SELECT	CONCAT(cliente.nome, ' ', cliente.sobrenome) AS 'Nome do Cliente',
		casa.cor AS 'Cor da Casa',
		bairro.nome AS 'Bairro',
		carro.modelo AS 'Carro' FROM cliente
INNER JOIN casa ON id_cliente = fk_cliente
INNER JOIN bairro ON id_cliente = id_bairro
INNER JOIN carro ON id_cliente = id_carro;


-- Até aqui esta consulta trás o obejtivo do exercício, porém posso simplificar esta consulta criando uma view
CREATE VIEW vw_consultacliente
AS
SELECT	CONCAT(cliente.nome, ' ', cliente.sobrenome) AS 'Nome do Cliente',
		casa.cor AS 'Cor da Casa',
		bairro.nome AS 'Bairro',
		carro.modelo AS 'Carro' FROM cliente
INNER JOIN casa ON id_cliente = fk_cliente
INNER JOIN bairro ON id_cliente = id_bairro
INNER JOIN carro ON id_cliente = id_carro;


/* Agora o que era um script grande pode ser reduzido a uma linha, 
chamando este script como se fosse uma consulta normal no MySQL através do comando: */

SELECT * FROM vw_consultacliente;
