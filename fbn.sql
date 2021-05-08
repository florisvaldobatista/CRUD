-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Out-2020 às 19:23
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.2.30

create database `fbn`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fbn`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `produ`
--

CREATE TABLE `produ` (
  `Cod_Produt` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Des_Produt` varchar(40) DEFAULT NULL,
  `Dat_Cadastro` datetime DEFAULT NULL,
  `Des_UniVen` varchar(3) DEFAULT NULL,
  `Des_UniCom` varchar(3) DEFAULT NULL,
  `Qtd_FraVen` int(10) DEFAULT NULL,
  `Cod_Tipo` varchar(7) NOT NULL,
  `Cod_Ean` varchar(14) NOT NULL,
  `Cod_Ncm` varchar(12) NOT NULL,
  `Cod_Cest` varchar(7) NOT NULL,
  `Preco` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`Cod_Produt`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produ`
--

INSERT INTO `produ` (`Cod_Produt`, `Des_Produt`, `Dat_Cadastro`, `Des_UniVen`, `Des_UniCom`, `Qtd_FraVen`, `Cod_Tipo`, `Cod_Ean`, `Cod_Ncm`, `Cod_Cest`, `Preco`) VALUES
(37, 'GABINETE TORRE', '2020-10-22 00:00:00', '1', 'UND', 1, '1', '123456789000', '30044990', '1212123', '50.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo`
--

CREATE TABLE `tipo` (
  `Cod_Tipo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Des_Tipo` varchar(40) DEFAULT NULL,
  `Dat_Cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`Cod_Tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo`
--

INSERT INTO `tipo` (`Cod_Tipo`, `Des_Tipo`, `Dat_Cadastro`) VALUES
(1, 'Insumos', '2020-10-19 14:19:29'),
(4, 'TECLADOS', '2020-10-22 00:00:00'),
(5, 'MOUSES', '2020-10-22 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuar`
--

CREATE TABLE `usuar` (
  `Cod_Usuari` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nom_Login` varchar(15) NOT NULL,
  `Nom_Usuari` varchar(35) DEFAULT NULL,
  `Des_Usuari` varchar(25) DEFAULT NULL,
  `Cod_GrpUsu` int(3) DEFAULT NULL,
  `Flg_Bloque` bit(1) NOT NULL,
  `Snh_Hash` varchar(32) DEFAULT NULL,
  `Dat_Cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`Cod_Usuari`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuar`
--

INSERT INTO `usuar` (`Cod_Usuari`, `Nom_Login`, `Nom_Usuari`, `Des_Usuari`, `Cod_GrpUsu`, `Flg_Bloque`, `Snh_Hash`, `Dat_Cadastro`) VALUES
(1, 'ADMIN', 'ADMINISTRADOR SISTEMA', 'ADMINISTRADOR', 1, b'1', 'e10adc3949ba59abbe56e057f20f883e', '0000-00-00 00:00:00'),
(2, 'VENDAS', 'VENDAS', 'CONSULTOR', 2, b'1', '733d7be2196ff70efaf6913fc8bdcabf', '0000-00-00 00:00:00');

--
-- inserindo dados da tabela `USUAR`
-- LOGIN: ADMIN SENHA: 123456
-- LOGIN: VENDAS SENHA: 123654

--
-- Índices para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produ`
--
ALTER TABLE `produ`
  MODIFY `Cod_Produt` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `tipo`
--
ALTER TABLE `tipo`
  MODIFY `Cod_Tipo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuar`
--
ALTER TABLE `usuar`
  MODIFY `Cod_Usuari` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
