--
-- CURSOS
--

INSERT INTO CURSO (NOMBRE, IMAGEN, HORA_INICIO, HORA_FIN, TEMARIO, ANTECEDENTES, MATERIAL, PRECIO, CUPO, FECHA_INICIO, FECHA_FIN)
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
-- FORMA DE PAGO
--

INSERT INTO FORMA_PAGO (FORMA_PAGO, DESCRIPCION)
    VALUES ('Efectivo', 'Pago en ventanillas con efectivo');

--
-- FICHA DE REFERENCIA
--

INSERT INTO FICHA_REFERENCIA (REFERENCIA)
    VALUES ('12345678910234556789');

--
-- USUARIO
--

INSERT INTO USUARIO (NOMBRE, AP_PATERNO, AP_MATERNO, EDAD, SEXO, CORREO_ELECTRONICO, CONTRASENA, FECHA_NACIMIENTO, TELEFONO, RFC, TIPO_USUARIO_ID, PERFIL_USUARIO_ID)
    VALUES ('Armando', 'Valderrama', 'Navarro', 22, 'M', 'armandoeloriginal@live.com', '123456789', '20/08/1997', '5535587280', 'VANA970820HDF', 1, 1);

--
-- ESTATUS PAGO CURSO
--

INSERT INTO ESTATUS_PAGO_CURSO (NOMBRE, DESCRIPCION)
    VALUES ('Pagado', 'El costo del curso se ha pagado en su totalidad.');

--
--
--

