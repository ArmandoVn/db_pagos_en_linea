--
-- CURSOS
--

INSERT INTO CURSO (NOMBRE, IMAGEN, HORA_INICIO, HORA_INICIO, TEMARIO, ANTECEDENTES, MATERIAL, PRECIO, CUPO, FECHA_INICIO, FECHA_FIN)
    VALUES ('Desarrollo de paginas web', 'adcncd', '12:30', '10:20', 'skjdcncskd', 'Saber programacion', 'Laptop', 1200.00, 30, '20/08/1997', '30/08/1997');

--
-- TIPOS DE USARIO
--

INSERT INTO TIPO_USUARIO (TIPO_USUARIO, DESCRIPCION)
    VALUES ('General', 'Este usuario unicamente tiene permisos para administrar sus cursos e informacion personal.');

--
-- PERFILES DE USUARIO
--

INSERT INTO PERFIL_USUARIO (PERFIL_USUARIO, DESCRIPCION, PORCIENTO_DESCUENTO)
    VALUES ('Alumnos UNAM', 'Alumnos activos pertenecientes a la Universidad Nacional Autonoma de México', 0.25);

-- 
--
--

