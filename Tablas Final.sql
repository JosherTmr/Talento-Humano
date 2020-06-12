-- TIPOS DE CONTRATO
create database if not exists talentohumano;
CREATE TABLE IF NOT EXISTS `talentohumano`.`tipos_contrato`(
tipo_contrato INT NOT NULL PRIMARY KEY,
descr_tipo_contrato VARCHAR(30)
);

-- CONTRATO
CREATE TABLE IF NOT EXISTS `talentohumano`.`contrato`(
id_contrato INT NOT NULL PRIMARY KEY,
fecha_firma DATE,
fecha_ini_vigencia DATE,
fecha_vencimiento DATE,
fecha_fin_prueba DATE DEFAULT NULL,
tipo_contrato INT, 
FOREIGN KEY(`tipo_contrato`)
REFERENCES `talentohumano`.`tipos_contrato`(`tipo_contrato`),
cont_renovacion_contrato INT
);

-- TIPOS_DOCUMENTO
CREATE TABLE IF NOT EXISTS  `talentohumano`.`tipos_documento` (
tipo_documento INT NOT NULL PRIMARY KEY,
descrip_tipo_documento VARCHAR (32) NOT NULL
);
-- DEPARTAMENTO
CREATE TABLE IF NOT EXISTS `talentohumano`.`departamento` (
id_departamento INT NOT NULL PRIMARY KEY,
nombre_depto VARCHAR (32) NOT NULL
);
-- EPS
CREATE TABLE IF NOT EXISTS `talentohumano`.`eps`(
id_eps INT NOT NULL PRIMARY KEY,
nombre_eps VARCHAR(100)
);

-- ARL
CREATE TABLE IF NOT EXISTS `talentohumano`.`arl`(
id_arl INT NOT NULL PRIMARY KEY,
nombre_arl VARCHAR(100)
);

-- PENSIONES
CREATE TABLE IF NOT EXISTS `talentohumano`.`pensiones`(
id_pensiones INT NOT NULL PRIMARY KEY,
nombre_pensiones VARCHAR(100)
);

-- CAJA DE COMPENSACION
CREATE TABLE IF NOT EXISTS `talentohumano`.`caja_compensacion`(
id_caja_compensacion INT NOT NULL PRIMARY KEY,
nombre_caja_compensacion VARCHAR (100)

);


-- EMPLEADO
CREATE TABLE IF NOT EXISTS `talentohumano`.`empleado` (
id_empleado INT NOT NULL PRIMARY KEY,
tipo_documento INT NOT NULL,
FOREIGN KEY(`tipo_documento`)
REFERENCES `talentohumano`.`tipos_documento`(`tipo_documento`),
nombre VARCHAR(32) NOT NULL,
apellido1 VARCHAR(32) NOT NULL,
apellido2 VARCHAR(32) NOT NULL,
fecha_nacimiento DATE NOT NULL,
cargo VARCHAR(32) NOT NULL,
salario_base INT NOT NULL,
id_departamento INT NOT NULL,
FOREIGN KEY(`id_departamento`)
REFERENCES `talentohumano`.`departamento`(`id_departamento`),
id_jefe INT,
id_contrato INT NOT NULL,
FOREIGN KEY(`id_contrato`)
REFERENCES `talentohumano`.`contrato`(`id_contrato`),
estado_civil VARCHAR(32) NOT NULL,
estado_empleado VARCHAR(32) NOT NULL,
genero_empleado VARCHAR(32) NOT NULL,
sede VARCHAR (32) NOT NULL,
localizacion INT NOT NULL,
id_eps	INT NOT NULL,
FOREIGN KEY(`id_eps`)
REFERENCES `talentohumano`.`eps`(`id_eps`),
id_arl INT NOT NULL,
FOREIGN KEY(`id_arl`)
REFERENCES `talentohumano`.`arl`(`id_arl`),
id_caja_compensacion INT NOT NULL,
FOREIGN KEY(`id_caja_compensacion`)
REFERENCES `talentohumano`.`caja_compensacion`(`id_caja_compensacion`),
id_pensiones INT NOT NULL,
FOREIGN KEY(`id_pensiones`)
REFERENCES `talentohumano`.`pensiones`(`id_pensiones`)
);

CREATE TABLE IF NOT EXISTS `talentohumano`.`estados_cliente` (
estado_cliente INT NOT NULL PRIMARY KEY,
descpripicion_estado_cliente VARCHAR(8)
);

-- CLIENTE
CREATE TABLE IF NOT EXISTS `talentohumano`.`cliente` (
id_cliente INT NOT NULL PRIMARY KEY,
tipo_documento INT NOT NULL,
FOREIGN KEY(`tipo_documento`)
REFERENCES `talentohumano`.`tipos_documento`(`tipo_documento`),
numero_documento INT NOT NULL,
nombre VARCHAR (280),
direccion_departamento VARCHAR(32),
direccion_calle VARCHAR(32),
direccion_codigo_postal INT,
correo VARCHAR(320),
telefono_fijo INT,
telefono_celular INT NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY(`id_empleado`)
REFERENCES `talentohumano`.`empleado`(`id_empleado`),
estado_cliente INT NOT NULL, 
FOREIGN KEY(`estado_cliente`)
REFERENCES `talentohumano`.`estados_cliente`(`estado_cliente`)
);

-- PEDIDO
CREATE TABLE IF NOT EXISTS `talentohumano`.`pedido` (
id_pedido INT NOT NULL PRIMARY KEY,
fecha_pedido DATE NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY(`id_empleado`)
REFERENCES `talentohumano`.`empleado`(`id_empleado`),
id_cliente INT NOT NULL,
FOREIGN KEY(`id_cliente`)
REFERENCES `talentohumano`.`cliente`(`id_cliente`),
total_a_pagar INT
);

-- TIPOS DE PRODUCTO
CREATE TABLE IF NOT EXISTS `talentohumano`.`tipos_producto` (
tipos_producto INT NOT NULL PRIMARY KEY,
descpripicion_tipos_producto VARCHAR(8)
);

-- PRODUCTO
CREATE TABLE IF NOT EXISTS `talentohumano`.`producto` (
id_producto INT NOT NULL PRIMARY KEY,
tipos_producto INT NOT NULL,
FOREIGN KEY(`tipos_producto`)
REFERENCES `talentohumano`.`tipos_producto`(`tipos_producto`),
stock INT,
descripcion VARCHAR(250),
nombre VARCHAR(280),
fecha_restock DATE,
precio INT,
unidades INT NOT NULL
);

-- PEDIDO_PRODUCTO
CREATE TABLE IF NOT EXISTS `talentohumano`.`pedido_producto` (
id_producto INT NOT NULL PRIMARY KEY,
id_pedido INT NOT NULL,
FOREIGN KEY(`id_pedido`)
REFERENCES `talentohumano`.`pedido`(`id_pedido`),
unidades INT NOT NULL
);


-- PAGO_NOMINA
CREATE TABLE IF NOT EXISTS `talentohumano`.`pago_nomina` (
id_empleado INT NOT NULL,
FOREIGN KEY(`id_empleado`)
REFERENCES `talentohumano`.`empleado`(`id_empleado`),
mes VARCHAR(15),
año INT,
comision INT,
salario_del_mes INT,
horas_ordinarias INT,
horas_recargo_nocturno INT,
horas_extras_diurnas INT,
horas_extras_nocturnas INT,
horas_festivo INT,
horas_extras_diurnas_festivo INT,
horas_extras_nocturnas_festivo INT,
arl INT,
salud_empleado INT,
salud_empresa INT,
pension_empleado INT,
pension_empresa INT,
cesantias INT,
int_cesantias INT,
primas INT,
vacaciones INT,
icbf INT,
sena INT,
cpf INT,
bono INT
);

-- FAMILIAR
CREATE TABLE IF NOT EXISTS `talentohumano`.`familiar` (
id_empleado INT NOT NULL,
FOREIGN KEY(`id_empleado`)
REFERENCES `talentohumano`.`empleado`(`id_empleado`),
tipo_documento INT,
num_docu_fam INT NOT NULL PRIMARY KEY, 
tipo_fam VARCHAR (6),
genero_fam VARCHAR(10),
nombre_familiar VARCHAR(32),
apellido1_fam VARCHAR(32),
apellido2_fam VARCHAR(32),
fecha_nacimiento_fam DATE NOT NULL
);

