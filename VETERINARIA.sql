CREATE DATABASE veterinariauh

USE veterinariauh

CREATE TABLE USUARIO
(
  ID INT IDENTITY (1,1),
  Email varchar (100) ,
  Password varchar (100),
  CONSTRAINT FK_ID PRIMARY KEY (ID),
  CONSTRAINT UQ_EMAIL UNIQUE (Email)
)

GO
INSERT INTO USUARIO VALUES ('examen@gmail.com', 'examen2023')
GO

CREATE TABLE Mae_Usuario
(
  Login_Usuario INT IDENTITY (1,1) PRIMARY KEY,
  Clave_Usuario VARCHAR (100) NOT NULL,
  Nombre_Usuario VARCHAR (100) NOT NULL,
)

CREATE TABLE Mae_Mascotas(
  ID_Mascota INT IDENTITY (1,1) PRIMARY KEY,
  Nombre_Mascota VARCHAR (100) UNIQUE, 
  Tipo_Mascota VARCHAR (100),
  Comida_Favorita VARCHAR (100)
)

CREATE TABLE Control_Citas (
  ID_Mascota INT NOT NULL FOREIGN KEY REFERENCES Mae_Mascotas (ID_Mascota),
  Proxima_fecha VARCHAR (100),
  Medico_Asignado VARCHAR (100)
)

--Procedimiento Mae_Usuario--

CREATE PROCEDURE SesionLogin
  @Email varchar(100) = '',
  @Password varchar(100) = ''
AS
BEGIN
  SELECT Email, Password
  FROM USUARIO
  WHERE Email = @Email AND Password = @Password
END

--PROCEDIMIENTOS MAE USUARIO --
GO
CREATE PROCEDURE SP_AGREGARUSUARIO
(
    @Clave_Usuario VARCHAR,
    @Nombre_Usuario VARCHAR
)
AS
BEGIN
    INSERT INTO Mae_Usuario(Clave_Usuario, Nombre_Usuario)
    VALUES (@Clave_Usuario, @Nombre_Usuario)
END
GO

CREATE PROCEDURE SP_BORRARUSUARIO
(
    @Login_Usuario INT 
)
AS
BEGIN
    DELETE FROM Mae_Usuario WHERE Login_Usuario  = @Login_Usuario 
END
GO

CREATE PROCEDURE SP_CONSULTARUSUARIO
(
   @Login_Usuario INT 
)
AS
BEGIN
    SELECT * FROM Mae_Usuario WHERE Login_Usuario  = @Login_Usuario
END
GO

CREATE PROCEDURE SP_MODIFICARUSUARIO
(
	@Login_Usuario INT,
    @Clave_Usuario VARCHAR,
    @Nombre_Usuario VARCHAR
)
AS
BEGIN
	UPDATE Mae_Usuario SET

		Clave_Usuario = @Clave_Usuario,
		Nombre_Usuario = @Nombre_Usuario

	WHERE Login_Usuario = @Login_Usuario
END
GO

--PROCEDIMIENTOS MAE MASCOTAS --
GO
CREATE PROCEDURE SP_AGREGARMASCOTAS
(
    @Nombre_Mascota VARCHAR,  
    @Tipo_Mascota VARCHAR, 
    @Comida_Favorita VARCHAR
)
AS
BEGIN
    INSERT INTO Mae_Mascotas(Nombre_Mascota, Tipo_Mascota, Comida_Favorita)
    VALUES (@Nombre_Mascota, @Tipo_Mascota, @Comida_Favorita)
END
GO

CREATE PROCEDURE SP_BORRARMASCOTAS
(
    @ID_Mascota INT
)
AS
BEGIN
    DELETE FROM Mae_Mascotas WHERE ID_Mascota = @ID_Mascota
END
GO

CREATE PROCEDURE SP_CONSULTARMASCOTAS
(
    @ID_Mascota INT
)
AS
BEGIN
    SELECT * FROM Mae_Mascotas WHERE ID_Mascota = @ID_Mascota
END
GO

CREATE PROCEDURE SP_MODIFICARMASCOTAS
(
	@ID_Mascota INT,
    @Nombre_Mascota VARCHAR, 
    @Tipo_Mascota VARCHAR,
    @Comida_Favorita VARCHAR
)
AS
BEGIN
	UPDATE Mae_Mascotas SET

		Nombre_Mascota = @Nombre_Mascota,
		Tipo_Mascota = @Tipo_Mascota,
		Comida_Favorita = @Comida_Favorita

	WHERE ID_Mascota = @ID_Mascota
END
GO

--PROCEDIMIENTOS CONTROL CITAS --

CREATE PROCEDURE SP_AgregarCitas
(
    @Proxima_Fecha varchar(100),
    @Medico_Asignado varchar(100)
)
AS
BEGIN
    INSERT INTO Control_Citas(Proxima_Fecha, Medico_Asignado)
    VALUES (@Proxima_Fecha, @Medico_Asignado)
END
GO

CREATE PROCEDURE SP_BorrarCitas
(
    @ID_Mascota int
)
AS
BEGIN
    DELETE FROM Control_Citas WHERE ID_Mascota = @ID_Mascota
END
GO

CREATE PROCEDURE SP_ModificarCitas
(
    @ID_Mascota int,
    @Proxima_Fecha varchar(100),
    @Medico_Asignado varchar(100)
)
AS
BEGIN
	UPDATE Control_Citas SET
		Proxima_Fecha = @Proxima_Fecha,
		Medico_Asignado = @Medico_Asignado
	WHERE ID_Mascota = @ID_Mascota
END
GO