-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para veterinaria_app
CREATE DATABASE IF NOT EXISTS `veterinaria_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `veterinaria_app`;

-- Volcando estructura para tabla veterinaria_app.citas
CREATE TABLE IF NOT EXISTS `citas` (
  `ID_citas` int(11) NOT NULL AUTO_INCREMENT,
  `ID_cliente` int(11) DEFAULT NULL,
  `ID_mascota` int(11) DEFAULT NULL,
  `ID_usuario` int(11) DEFAULT NULL,
  `Tipo_cita` varchar(45) NOT NULL,
  `Precio_cita` double NOT NULL,
  `Fecha_cita` date NOT NULL,
  `Hora_cita` time NOT NULL,
  `Duracion_minutos` int(11) NOT NULL,
  PRIMARY KEY (`ID_citas`),
  KEY `ID_cliente` (`ID_cliente`),
  KEY `ID_mascota` (`ID_mascota`),
  KEY `ID_usuario` (`ID_usuario`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_cliente`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`ID_mascota`) REFERENCES `mascota` (`ID_mascota`),
  CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla veterinaria_app.citas_medicamento
CREATE TABLE IF NOT EXISTS `citas_medicamento` (
  `ID_citas` int(11) NOT NULL,
  `ID_medicamento` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  KEY `ID_citas` (`ID_citas`),
  KEY `ID_medicamento` (`ID_medicamento`),
  CONSTRAINT `ID_citas` FOREIGN KEY (`ID_citas`) REFERENCES `citas` (`ID_citas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_medicamento` FOREIGN KEY (`ID_medicamento`) REFERENCES `medicamentos` (`ID_medicamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla veterinaria_app.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `ID_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_cliente` varchar(45) NOT NULL,
  `Apellido_cliente` varchar(45) NOT NULL,
  `Estado_cliente` varchar(20) NOT NULL,
  `Colonia_cliente` varchar(20) NOT NULL,
  `Calle_cliente` varchar(20) NOT NULL,
  `Numero_interior` varchar(5) DEFAULT NULL,
  `Numero_esterior` varchar(5) NOT NULL,
  `Tel_Cliente` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla veterinaria_app.mascota
CREATE TABLE IF NOT EXISTS `mascota` (
  `ID_mascota` int(11) NOT NULL AUTO_INCREMENT,
  `ID_cliente` int(11) DEFAULT NULL,
  `Nombre_mascota` varchar(45) NOT NULL,
  `Tipo_mascota` varchar(20) NOT NULL,
  `Raza_mascota` varchar(20) NOT NULL,
  `Edad_mascota` int(11) NOT NULL,
  `Peso_mascota` float NOT NULL,
  PRIMARY KEY (`ID_mascota`),
  KEY `ID_cliente` (`ID_cliente`),
  CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla veterinaria_app.medicamentos
CREATE TABLE IF NOT EXISTS `medicamentos` (
  `ID_medicamentos` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_medicamento` varchar(45) NOT NULL,
  `Tipo_medicamento` varchar(20) NOT NULL,
  `Precio_medicamento` double NOT NULL,
  `Unidades_disponibles` int(11) NOT NULL,
  PRIMARY KEY (`ID_medicamentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla veterinaria_app.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `ID_producto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_producto` varchar(45) NOT NULL,
  `Tipo_producto` varchar(20) NOT NULL,
  `Precio_producto` double NOT NULL,
  `Unidades_disponibles` int(11) NOT NULL,
  PRIMARY KEY (`ID_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla veterinaria_app.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `ID_rol` int(11) NOT NULL AUTO_INCREMENT,
  `Rol` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_rol`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
