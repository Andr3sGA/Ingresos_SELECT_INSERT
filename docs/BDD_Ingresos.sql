-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-02-2024 a las 07:18:39
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ingresos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE `accesos` (
  `idAccesos` int(11) NOT NULL,
  `IdTipoAcceso` int(11) NOT NULL,
  `Ultimo` datetime NOT NULL,
  `Usuarios_idUsuarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRoles` int(11) NOT NULL,
  `Rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRoles`, `Rol`) VALUES
(6, 'ADMINISTRADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `SucursalId` int(11) NOT NULL,
  `Nombre` text NOT NULL,
  `Direccion` text NOT NULL,
  `Telefono` text NOT NULL,
  `Correo` text NOT NULL,
  `Parroquia` text NOT NULL,
  `Canton` text NOT NULL,
  `Provincia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`SucursalId`, `Nombre`, `Direccion`, `Telefono`, `Correo`, `Parroquia`, `Canton`, `Provincia`) VALUES
(6, 'Santo Domingo', 'Av. Quito, calle Lorena.', '0995681921', 'santodomingo@gmail.com', 'San Gabriel', 'San Gabriel ', 'Santo Domingo de los Tsáchilas'),
(7, 'Ambato', 'Km 5 1/2 vía Baños, Av. Confraternidad', '0996031568', 'ambato@gmail.com', 'San Antonio', 'Ambato', 'Tungurahua'),
(13, 'Puyo', 'C. Teniente Hugo Ortíz', '0998291092', 'puyo@gmail.com', 'San Antonio', 'Pastaza', 'Pastaza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_acceso`
--

CREATE TABLE `tipo_acceso` (
  `IdTipoAcceso` int(11) NOT NULL,
  `Detalle` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` text NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `SucursalId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuarios`, `Nombres`, `Apellidos`, `contrasenia`, `Correo`, `SucursalId`) VALUES
(5, 'Juan', 'Ochoa', '1234', 'juanito@gmail.com', 6),
(6, 'Andrés ', 'García', '1234', 'andres_garcia3010@hotmail.com', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_roles`
--

CREATE TABLE `usuarios_roles` (
  `Usuarios_idUsuarios` int(11) NOT NULL,
  `Roles_idRoles` int(11) NOT NULL,
  `idUsuariosRoles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios_roles`
--

INSERT INTO `usuarios_roles` (`Usuarios_idUsuarios`, `Roles_idRoles`, `idUsuariosRoles`) VALUES
(5, 6, 7),
(6, 6, 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`idAccesos`),
  ADD KEY `fk_Accesos_Usuarios1_idx` (`Usuarios_idUsuarios`),
  ADD KEY `Acceso_tipoAcceso` (`IdTipoAcceso`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRoles`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`SucursalId`);

--
-- Indices de la tabla `tipo_acceso`
--
ALTER TABLE `tipo_acceso`
  ADD PRIMARY KEY (`IdTipoAcceso`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuarios`),
  ADD KEY `Usuarios_Sucursales` (`SucursalId`);

--
-- Indices de la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD PRIMARY KEY (`idUsuariosRoles`),
  ADD KEY `fk_Usuarios_has_Roles_Roles1_idx` (`Roles_idRoles`),
  ADD KEY `fk_Usuarios_has_Roles_Usuarios1_idx` (`Usuarios_idUsuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesos`
--
ALTER TABLE `accesos`
  MODIFY `idAccesos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRoles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `SucursalId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tipo_acceso`
--
ALTER TABLE `tipo_acceso`
  MODIFY `IdTipoAcceso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  MODIFY `idUsuariosRoles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `Acceso_tipoAcceso` FOREIGN KEY (`IdTipoAcceso`) REFERENCES `tipo_acceso` (`IdTipoAcceso`),
  ADD CONSTRAINT `fk_Accesos_Usuarios1` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `Usuarios_Sucursales` FOREIGN KEY (`SucursalId`) REFERENCES `sucursales` (`SucursalId`);

--
-- Filtros para la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD CONSTRAINT `fk_Usuarios_has_Roles_Roles1` FOREIGN KEY (`Roles_idRoles`) REFERENCES `roles` (`idRoles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuarios_has_Roles_Usuarios1` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
