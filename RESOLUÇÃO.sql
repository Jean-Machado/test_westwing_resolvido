# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.23)
# Database: localhost
# Generation Time: 2015-05-14 13:41:22 +0000
# ************************************************************

-- Primeiro vou criar um banco de dados especifico para este exercício
-- Como este banco de dados será somente para este exercício não defini o padrão da linguagem (o character, e o collate) no banco.

CREATE DATABASE IF NOT EXISTS resolucao_teste_westwingbrasil


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table bairro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bairro`;

CREATE TABLE `bairro` (
  `id_bairro` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id_bairro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;

INSERT INTO `bairro` (`id_bairro`, `nome`)
VALUES
	(1,'Mooca'),
	(2,'Ipiranga'),
	(3,'Vila Hamburguesa'),
	(4,'Lapa'),
	(5,'Campo Belo');

/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table carro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carro`;

CREATE TABLE `carro` (
  `id_carro` int(11) NOT NULL DEFAULT '0',
  `modelo` varchar(255) NOT NULL,
  `fk_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_carro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;

INSERT INTO `carro` (`id_carro`, `modelo`, `fk_cliente`)
VALUES
	(1,'Fiat',1),
	(2,'Mercedes',2),
	(3,'Honda',3),
	(4,'Toyota',4),
	(5,'Lada',1);

/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table casa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `casa`;

CREATE TABLE `casa` (
  `id_casa` int(11) NOT NULL DEFAULT '0',
  `cor` varchar(255) NOT NULL,
  `fk_cliente` int(11) NOT NULL,
  `fk_bairro` int(11) NOT NULL,
  PRIMARY KEY (`id_casa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `casa` WRITE;
/*!40000 ALTER TABLE `casa` DISABLE KEYS */;

INSERT INTO `casa` (`id_casa`, `cor`, `fk_cliente`, `fk_bairro`)
VALUES
	(1,'Vermelho',1,1),
	(2,'Roxo',2,2),
	(3,'Azul',3,3),
	(4,'Rosa',4,4),
	(5,'Laranja',5,5);

/*!40000 ALTER TABLE `casa` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cliente
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;

INSERT INTO `cliente` (`id_cliente`, `nome`, `sobrenome`, `data_nascimento`)
VALUES
	(1,'Fernando','Soares','1985-04-19'),
	(2,'Bruno','Campos','1988-06-02'),
	(3,'Fernanda','Figo','1989-07-20'),
	(4,'Arthur','Siqueira','1990-03-14'),
	(5,'Joao','Garcia','1943-02-19');

/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- RESOLUÇÂO --

-- 1º Já especifiquei no inicio do código a criação de um banco de dados específico para este exercício 


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












