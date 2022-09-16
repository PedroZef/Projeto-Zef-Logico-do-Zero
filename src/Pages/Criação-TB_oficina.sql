CREATE DATABASE  IF NOT EXISTS `oficina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oficina`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: oficina
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Telefone` varchar(25) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Manoel Wosvaldo da Mota','(74)9951.9880','manoel@wosvaldo.com'),(2,'Nicole Jéssica','(86)98150.4239','nicole@jessica.com'),(3,'Liza Mariana Mirella','(31)91132.0658','liza@mariana.com'),(4,'Luana Caleber Ramos','(12)3934-6780','luana@calebe.com'),(5,'Manoel Wosvaldo da Mota LTDA.','(83)85364-5010','manoel@wosvaldo.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe` (
  `id` int NOT NULL,
  `Identificacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_Equipe_Identificacao` (`Identificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,'Borracharia'),(5,'Elétrica'),(3,'Funilaria'),(4,'Mecanica'),(2,'Pintura');
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidade` (
  `id` int NOT NULL,
  `Identificacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_Especialidade_Identificacao` (`Identificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (4,'Instalar som'),(2,'Lixar'),(3,'Mecanica Hidráulico'),(1,'Pintar'),(0,'Trocar Pneu');
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id` int NOT NULL,
  `Identificacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_Marca_Identificacao` (`Identificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (4,'Fiat'),(1,'Ford'),(2,'Renault'),(3,'Volkswagen');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico` (
  `id` int NOT NULL,
  `idEspecialidade` int NOT NULL,
  `idEquipe` int NOT NULL,
  `Codigo` varchar(45) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `CEP` varchar(10) NOT NULL,
  `Logradouro` varchar(150) NOT NULL,
  `Numero` varchar(10) NOT NULL,
  `Complemento` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_Mecanico_Codigo` (`Codigo`),
  KEY `fk_Mecanico_idEspecialidade_Especialidade_id` (`idEspecialidade`),
  KEY `fk_Mecanico_idEquipe_Equipe_id` (`idEquipe`),
  CONSTRAINT `fk_Mecanico_idEquipe_Equipe_id` FOREIGN KEY (`idEquipe`) REFERENCES `equipe` (`id`),
  CONSTRAINT `fk_Mecanico_idEspecialidade_Especialidade_id` FOREIGN KEY (`idEspecialidade`) REFERENCES `especialidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (0,1,1,'JÃO','Antonio da Silva','00000-000','Rua..','S/N',NULL),(1,2,2,'Zef','Pedro da Silva','00000-000','Rua..','S/N',NULL),(2,3,3,'Bora Bill!','Bora Bill!','00000-000','Rua..','S/N',NULL),(3,4,4,'Fil do Bill','Fil do Bill','00000-000','Rua..','S/N',NULL);
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `id` int NOT NULL,
  `idMarca` int NOT NULL,
  `Identificacao` varchar(45) NOT NULL,
  `Ano` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_Modelo_Identificacao` (`Identificacao`),
  KEY `fk_Modelo_idMarca_Marca_id` (`idMarca`),
  CONSTRAINT `fk_Modelo_idMarca_Marca_id` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,1,'KA',2015),(2,1,'Fiesta',2013),(3,2,'Gol',2015),(4,3,'Fiat',2010);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordemservico`
--

DROP TABLE IF EXISTS `ordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordemservico` (
  `id` int NOT NULL,
  `idCliente` int NOT NULL,
  `idStatusOrdemServico` int NOT NULL,
  `Codigo` varchar(10) NOT NULL,
  `DataEmissao` datetime NOT NULL,
  `DataParaConclusao` datetime DEFAULT NULL,
  `Valor` decimal(18,2) DEFAULT NULL,
  `DataAutorizacao` datetime DEFAULT NULL,
  `Obs` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_OrdemServico_Codigo` (`Codigo`),
  KEY `fk_OrdemServico_idCliente_Cliente_id` (`idCliente`),
  KEY `fk_OrdemServico_idStatusOrdemServico_StatusOrdemServico_id` (`idStatusOrdemServico`),
  CONSTRAINT `fk_OrdemServico_idCliente_Cliente_id` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_OrdemServico_idStatusOrdemServico_StatusOrdemServico_id` FOREIGN KEY (`idStatusOrdemServico`) REFERENCES `statusordemservico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordemservico`
--

LOCK TABLES `ordemservico` WRITE;
/*!40000 ALTER TABLE `ordemservico` DISABLE KEYS */;
INSERT INTO `ordemservico` VALUES (1,1,1,'0000000001','2022-09-09 00:00:00',NULL,250.00,'2022-09-08 00:00:00',NULL),(2,2,1,'0000000002','2022-09-10 00:00:00',NULL,123.00,'2022-09-08 00:00:00',NULL);
/*!40000 ALTER TABLE `ordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peca`
--

DROP TABLE IF EXISTS `peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peca` (
  `id` int NOT NULL,
  `Identificacao` varchar(45) NOT NULL,
  `ValorReferencia` decimal(18,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_Peca_Identificacao` (`Identificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca`
--

LOCK TABLES `peca` WRITE;
/*!40000 ALTER TABLE `peca` DISABLE KEYS */;
INSERT INTO `peca` VALUES (100,'Tinta Galão',150.00),(200,'Óloe 1lt',40.00),(300,'Lâmpada do farol',30.00),(400,'Pneu',450.00),(500,'Filtro de óleo',50.00);
/*!40000 ALTER TABLE `peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `id` int NOT NULL,
  `idVeiculo` int NOT NULL,
  `idTabelaServico` int NOT NULL,
  `idEquipe` int NOT NULL,
  `idStatusServico` int NOT NULL,
  `Descricao` text NOT NULL,
  `ValorPecas` decimal(18,2) NOT NULL,
  `ValorMaoDeObra` decimal(18,2) NOT NULL,
  `DataInicio` datetime DEFAULT NULL,
  `DataTermino` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Servico_idVeiculo_Veiculo_id` (`idVeiculo`),
  KEY `fk_Servico_idTabelaServico_TabelaServico_id` (`idTabelaServico`),
  KEY `fk_Servico_idEquipe_Equipe_id` (`idEquipe`),
  KEY `fk_Servico_idStatusServico_StatusServico_id` (`idStatusServico`),
  CONSTRAINT `fk_Servico_idEquipe_Equipe_id` FOREIGN KEY (`idEquipe`) REFERENCES `equipe` (`id`),
  CONSTRAINT `fk_Servico_idStatusServico_StatusServico_id` FOREIGN KEY (`idStatusServico`) REFERENCES `statusservico` (`id`),
  CONSTRAINT `fk_Servico_idTabelaServico_TabelaServico_id` FOREIGN KEY (`idTabelaServico`) REFERENCES `tabelaservico` (`id`),
  CONSTRAINT `fk_Servico_idVeiculo_Veiculo_id` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (0,1,1,1,1,'Trocar Pneu',0.00,50.00,'2022-09-10 00:00:00','2022-09-10 00:00:00'),(1,2,2,2,2,'Instalar som',1500.00,250.00,'2022-09-10 00:00:00','2022-09-10 00:00:00'),(4,3,4,4,4,'Trocar palamala',1000.00,300.00,'2022-09-10 00:00:00','2022-09-10 00:00:00'),(5,0,4,4,4,'Consertar motor',100.00,1000.00,'2022-09-10 00:00:00','2022-09-10 00:00:00');
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicopeca`
--

DROP TABLE IF EXISTS `servicopeca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicopeca` (
  `id` int NOT NULL,
  `idServico` int NOT NULL,
  `idPeca` int NOT NULL,
  `ValorPeca` decimal(18,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ServicoPeca_idServico_Servico_id` (`idServico`),
  KEY `fk_ServicoPeca_idPeca_Peca_id` (`idPeca`),
  CONSTRAINT `fk_ServicoPeca_idPeca_Peca_id` FOREIGN KEY (`idPeca`) REFERENCES `peca` (`id`),
  CONSTRAINT `fk_ServicoPeca_idServico_Servico_id` FOREIGN KEY (`idServico`) REFERENCES `servico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicopeca`
--

LOCK TABLES `servicopeca` WRITE;
/*!40000 ALTER TABLE `servicopeca` DISABLE KEYS */;
INSERT INTO `servicopeca` VALUES (0,1,100,50.00),(1,0,400,50.00),(3,4,400,50.00),(5,4,400,50.00);
/*!40000 ALTER TABLE `servicopeca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusordemservico`
--

DROP TABLE IF EXISTS `statusordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statusordemservico` (
  `id` int NOT NULL,
  `Identificacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_StatusOrdemServico_Identificacao` (`Identificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusordemservico`
--

LOCK TABLES `statusordemservico` WRITE;
/*!40000 ALTER TABLE `statusordemservico` DISABLE KEYS */;
INSERT INTO `statusordemservico` VALUES (1,'ABERTO'),(4,'CANCELADO'),(5,'CONCLUÍDO'),(2,'EM ANDAMENTO'),(3,'EM PAUSA');
/*!40000 ALTER TABLE `statusordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusservico`
--

DROP TABLE IF EXISTS `statusservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statusservico` (
  `id` int NOT NULL,
  `Identificacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_StatusServico_Identificacao` (`Identificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusservico`
--

LOCK TABLES `statusservico` WRITE;
/*!40000 ALTER TABLE `statusservico` DISABLE KEYS */;
INSERT INTO `statusservico` VALUES (1,'A FAZER'),(5,'AGUARANDO PEÇA'),(4,'CANCELADO'),(7,'CONCLUÍDO'),(2,'FAZENDO');
/*!40000 ALTER TABLE `statusservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabelaservico`
--

DROP TABLE IF EXISTS `tabelaservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabelaservico` (
  `id` int NOT NULL,
  `Identificacao` varchar(100) NOT NULL,
  `ValorTabela` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_TabelaServico_Identificacao` (`Identificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabelaservico`
--

LOCK TABLES `tabelaservico` WRITE;
/*!40000 ALTER TABLE `tabelaservico` DISABLE KEYS */;
INSERT INTO `tabelaservico` VALUES (0,'Pintura geral',2000.00),(1,'Troca de pneu',50.00),(2,'Troca de lampada do farol',30.00),(3,'Troca do motor',1500.00),(4,'Alinhamento',50.00);
/*!40000 ALTER TABLE `tabelaservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `id` int NOT NULL,
  `idOrdemServico` int NOT NULL,
  `idModelo` int NOT NULL,
  `Cor` int NOT NULL,
  `Placa` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Veiculo_idOrdemServico_OrdemServico_id` (`idOrdemServico`),
  KEY `fk_Veiculo_idModelo_Modelo_id` (`idModelo`),
  CONSTRAINT `fk_Veiculo_idModelo_Modelo_id` FOREIGN KEY (`idModelo`) REFERENCES `modelo` (`id`),
  CONSTRAINT `fk_Veiculo_idOrdemServico_OrdemServico_id` FOREIGN KEY (`idOrdemServico`) REFERENCES `ordemservico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (0,1,1,250025,'2015'),(1,1,2,250025,'2013'),(2,2,3,250025,'2015'),(3,2,4,250025,'2010');
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

Dump completed on 2022-09-15 18:14:45