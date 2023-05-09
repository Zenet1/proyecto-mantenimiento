-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3305
-- Tiempo de generación: 09-05-2023 a las 20:04:29
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fmatbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academicos`
--

CREATE TABLE `academicos` (
  `IDProfesor` int(11) NOT NULL,
  `ClaveProfesor` int(11) NOT NULL,
  `NombreProfesor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ApellidoPaternoProfesor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ApellidoMaternoProfesor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `GradoAcademico` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `CorreoProfesor` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `IDAdmin` int(11) NOT NULL,
  `IDUsuario` int(11) NOT NULL,
  `NombreAdmin` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `IDAlumno` int(11) NOT NULL,
  `Matricula` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `NombreAlumno` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ApellidoPaternoAlumno` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ApellidoMaternoAlumno` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `IDPlanEstudio` int(11) NOT NULL,
  `CorreoAlumno` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Genero` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `IDUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `IDAsignatura` int(11) NOT NULL,
  `ClaveAsignatura` int(11) NOT NULL,
  `NombreAsignatura` varchar(90) COLLATE utf8_spanish_ci NOT NULL,
  `IDPlanEstudio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistenciasalumnos`
--

CREATE TABLE `asistenciasalumnos` (
  `IDAsistenciaAlumnos` int(11) NOT NULL,
  `IDAlumno` int(11) NOT NULL,
  `FechaAl` date NOT NULL,
  `HoraIngresoAl` time NOT NULL,
  `HoraSalidaAl` time NOT NULL,
  `LugarEntradaAl` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistenciasexternos`
--

CREATE TABLE `asistenciasexternos` (
  `IDAsistenciaExternos` int(11) NOT NULL,
  `IDExterno` int(11) NOT NULL,
  `FechaExterno` date NOT NULL,
  `HoraIngresoEx` time NOT NULL,
  `HoraSalidaEx` time NOT NULL,
  `LugarEntradaEx` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capturadores`
--

CREATE TABLE `capturadores` (
  `IDCapturador` int(11) NOT NULL,
  `IDUsuario` int(11) NOT NULL,
  `NombreCapt` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargaacademica`
--

CREATE TABLE `cargaacademica` (
  `IDCarga` int(11) NOT NULL,
  `IDAlumno` int(11) NOT NULL,
  `IDGrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edificios`
--

CREATE TABLE `edificios` (
  `IDEdificio` int(11) NOT NULL,
  `NombreEdificio` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `externos`
--

CREATE TABLE `externos` (
  `IDExterno` int(11) NOT NULL,
  `NombreExterno` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ApellidosExterno` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Empresa` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `CorreoExterno` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `IDGrupo` int(11) NOT NULL,
  `IDAsignatura` int(11) NOT NULL,
  `IDProfesor` int(11) NOT NULL,
  `ClaveGrupo` int(11) NOT NULL,
  `Grupo` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `IDHorario` int(11) NOT NULL,
  `IDGrupo` int(11) NOT NULL,
  `Dia` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `HoraInicioHorario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `HoraFinHorario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `IDSalon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidentes`
--

CREATE TABLE `incidentes` (
  `IDIncidente` int(11) NOT NULL,
  `IDAlumno` int(11) NOT NULL,
  `FechaAl` date NOT NULL,
  `FechaLimiteSuspension` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas`
--

CREATE TABLE `oficinas` (
  `IDOficina` int(11) NOT NULL,
  `NombreOficina` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Departamento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `IDEdificio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planesdeestudio`
--

CREATE TABLE `planesdeestudio` (
  `IDPlanEstudio` int(11) NOT NULL,
  `NombrePlan` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `SiglasPlan` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ClavePlan` int(30) NOT NULL,
  `VersionPlan` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `porcentajecapacidad`
--

CREATE TABLE `porcentajecapacidad` (
  `IDPorcentaje` int(11) NOT NULL,
  `Porcentaje` int(11) NOT NULL,
  `FechaInicio` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `IDPregunta` int(11) NOT NULL,
  `Pregunta` varchar(400) COLLATE utf8_spanish_ci NOT NULL,
  `Respuesta` text COLLATE utf8_spanish_ci NOT NULL,
  `Enlace` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacionesalumnos`
--

CREATE TABLE `reservacionesalumnos` (
  `IDReservaAlumno` int(11) NOT NULL,
  `IDCarga` int(11) NOT NULL,
  `FechaReservaAl` date NOT NULL,
  `HoraInicioReservaAl` time NOT NULL,
  `HoraFinReservaAl` time NOT NULL,
  `FechaAlumno` date NOT NULL,
  `HoraAlumno` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacionesexternos`
--

CREATE TABLE `reservacionesexternos` (
  `IDReservaExterno` int(11) NOT NULL,
  `IDExterno` int(11) NOT NULL,
  `IDOficina` int(11) NOT NULL,
  `FechaReservaExterno` date NOT NULL,
  `FechaExterno` date NOT NULL,
  `HoraExterno` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `IDRol` int(11) NOT NULL,
  `Rol` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salones`
--

CREATE TABLE `salones` (
  `IDSalon` int(11) NOT NULL,
  `IDEdificio` int(11) NOT NULL,
  `NombreSalon` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Capacidad` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IDUsuario` int(11) NOT NULL,
  `Cuenta` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Contraseña` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `IDRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academicos`
--
ALTER TABLE `academicos`
  ADD PRIMARY KEY (`IDProfesor`);

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`IDAdmin`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`IDAlumno`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`IDAsignatura`);

--
-- Indices de la tabla `asistenciasalumnos`
--
ALTER TABLE `asistenciasalumnos`
  ADD PRIMARY KEY (`IDAsistenciaAlumnos`);

--
-- Indices de la tabla `asistenciasexternos`
--
ALTER TABLE `asistenciasexternos`
  ADD PRIMARY KEY (`IDAsistenciaExternos`);

--
-- Indices de la tabla `capturadores`
--
ALTER TABLE `capturadores`
  ADD PRIMARY KEY (`IDCapturador`);

--
-- Indices de la tabla `cargaacademica`
--
ALTER TABLE `cargaacademica`
  ADD PRIMARY KEY (`IDCarga`);

--
-- Indices de la tabla `edificios`
--
ALTER TABLE `edificios`
  ADD PRIMARY KEY (`IDEdificio`);

--
-- Indices de la tabla `externos`
--
ALTER TABLE `externos`
  ADD PRIMARY KEY (`IDExterno`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`IDGrupo`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`IDHorario`);

--
-- Indices de la tabla `incidentes`
--
ALTER TABLE `incidentes`
  ADD PRIMARY KEY (`IDIncidente`);

--
-- Indices de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  ADD PRIMARY KEY (`IDOficina`);

--
-- Indices de la tabla `planesdeestudio`
--
ALTER TABLE `planesdeestudio`
  ADD PRIMARY KEY (`IDPlanEstudio`);

--
-- Indices de la tabla `porcentajecapacidad`
--
ALTER TABLE `porcentajecapacidad`
  ADD PRIMARY KEY (`IDPorcentaje`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`IDPregunta`);

--
-- Indices de la tabla `reservacionesalumnos`
--
ALTER TABLE `reservacionesalumnos`
  ADD PRIMARY KEY (`IDReservaAlumno`);

--
-- Indices de la tabla `reservacionesexternos`
--
ALTER TABLE `reservacionesexternos`
  ADD PRIMARY KEY (`IDReservaExterno`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`IDRol`);

--
-- Indices de la tabla `salones`
--
ALTER TABLE `salones`
  ADD PRIMARY KEY (`IDSalon`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IDUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `academicos`
--
ALTER TABLE `academicos`
  MODIFY `IDProfesor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `IDAdmin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `IDAlumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `IDAsignatura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asistenciasalumnos`
--
ALTER TABLE `asistenciasalumnos`
  MODIFY `IDAsistenciaAlumnos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asistenciasexternos`
--
ALTER TABLE `asistenciasexternos`
  MODIFY `IDAsistenciaExternos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capturadores`
--
ALTER TABLE `capturadores`
  MODIFY `IDCapturador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargaacademica`
--
ALTER TABLE `cargaacademica`
  MODIFY `IDCarga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `edificios`
--
ALTER TABLE `edificios`
  MODIFY `IDEdificio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `externos`
--
ALTER TABLE `externos`
  MODIFY `IDExterno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `IDGrupo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `IDHorario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidentes`
--
ALTER TABLE `incidentes`
  MODIFY `IDIncidente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  MODIFY `IDOficina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planesdeestudio`
--
ALTER TABLE `planesdeestudio`
  MODIFY `IDPlanEstudio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `porcentajecapacidad`
--
ALTER TABLE `porcentajecapacidad`
  MODIFY `IDPorcentaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `IDPregunta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservacionesalumnos`
--
ALTER TABLE `reservacionesalumnos`
  MODIFY `IDReservaAlumno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservacionesexternos`
--
ALTER TABLE `reservacionesexternos`
  MODIFY `IDReservaExterno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `IDRol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salones`
--
ALTER TABLE `salones`
  MODIFY `IDSalon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IDUsuario` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
