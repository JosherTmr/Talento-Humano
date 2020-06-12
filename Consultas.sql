
-- REQ 1 : Listado de los empleados que poseen más de dos hijos. 
SELECT *  

FROM empleado , familiar

WHERE empleado.id_empleado = familiar.id_empleado AND familiar.tipo_fam = 'hijo'; 
-- REQ 2 : Listado de los empleados que están en la Sede Centro. 
SELECT *  

FROM empleado , departamento

WHERE ((empleado.id_departamento = departamento.id_departamento) AND (empleado.sede = "Centro")); 


-- REQ 3 : Listado de los empleados que ganan comisión superior a xxxxxx. 
SELECT *  

FROM empleado, pago_nomina

WHERE ((empleado.id_empleado = pago_nomina.id_empleado) AND (pago_nomina.comision > 50000)); 
-- REQ 4 : Mostrar los empleados que están a cargo del id_ jefe xxxxx. 
SELECT *  

FROM empleado

WHERE (empleado.id_jefe = 100100); 
-- REQ 5 : Listado de los empleados con su cargo, fecha de ingreso y salario base.  
SELECT nombre, apellido1, apellido2, cargo, salario_base 

FROM empleado;
-- REQ 6 : Listado de las comisiones ganadas por los empleados de ventas en los últimos 3 meses.  
SELECT *  

FROM PAGO_NOMINA 

WHERE (comision != 0); 
-- REQ 7 : Listado de departamentos y los empleados que hacen parte de cada uno.  
SELECT departamento.nombre_depto, empleado.nombre, empleado.apellido1, empleado.apellido2 

FROM empleado, departamento 

WHERE empleado.id_departamento = departamento.id_departamento 

ORDER BY  departamento.nombre_depto; 
-- REQ 8 : Mostrar a cada empleado con su jefe y cada jefe qué empleados tiene a su cargo.  
SELECT empleado.id_jefe, empleado.nombre, empleado.apellido1, empleado.apellido2 

FROM empleado 

WHERE (empleado.id_empleado = empleado.id_jefe); 
-- REQ 9 : Listado de los empleados que ganan más de 2 SMMLV 
SELECT * 

FROM PAGO_NOMINA 

WHERE (salario_del_mes > 1755604); 
-- REQ 10 : Listado de los trabajadores del departamento de ventas que entraron a trabajar desde 2001. 
SELECT * 

FROM empleado, departamento, contrato 

WHERE empleado.id_departamento = departamento.id_departamento  

AND departamento.id_departamento = 211 

AND empleado.id_contrato = contrato.id_contrato 

AND contrato.fecha_ini_vigencia > 01-01-2001; 
-- REQ 11 : Listado de los empleados con contrato indefinido. 
SELECT * 

FROM empleado, contrato 

WHERE ((empleado.id_contrato = contrato.id_contrato) AND (contrato.tipo_contrato = 2)); 

-- REQ 12: Mostrar empleados contratados en el año 2019 

SELECT * 

FROM empleado, contrato  

WHERE ((empleado.id_contrato = contrato.id_contrato) AND (contrato.fecha_firma >= '2019-01-01' AND contrato.fecha_firma < '2019-12-31')); 


-- REQ 13 : Listado de empleados afiliados a la EPS XXXX.  
SELECT * 

FROM Empleado 

WHERE (id_eps = 05); 
-- REQ 14 : Cantidad de horas trabajadas por XXXX en el mes XXXX. 
SELECT nombre, apellido1, apellido2, ( horas_ordinarias + horas_recargo_nocturno + horas_extras_diurnas + horas_extras_nocturnas + horas_festivo + horas_extras_diurnas_festivo + horas_extras_nocturnas_festivo)  

FROM empleado, pago_nomina  

WHERE (pago_nomina.id_empleado = 100114 AND mes = 'abril'); 
-- REQ 15 : Dinero total pagado por concepto de ARL en la empresa. 
SELECT SUM(arl)  

FROM pago_nomina 

WHERE año=2020 AND mes= 'abril'; 
-- REQ 16 : Dinero total pagado a los EMPLEADOS por concepto de nómina en el mes XXXX. 
SELECT empleado.id_empleado, (pago_nomina.salario_del_mes -(pago_nomina.salud_empleado + pago_nomina.pension_empleado)) 

FROM pago_nomina, empleado 

WHERE pago_nomina.año=2020 AND  pago_nomina.mes='mayo' AND empleado.id_empleado = pago_nomina.id_empleado; 
-- REQ 17 : Cantidad de horas nocturnas trabajadas por XXXX en el mes XXXX. 
SELECT empleado.nombre, empleado.apellido1, empleado.apellido2, pago_nomina.horas_recargo_nocturno 

FROM empleado, pago_nomina 

WHERE (empleado.id_empleado = 100113 AND pago_nomina.id_empleado=100113 AND pago_nomina.mes = 'mayo'); 
-- REQ 18 : Listado de empleados que están en periodo de prueba. 
SELECT empleado.nombre, empleado.apellido1, empleado.apellido2, contrato.*

FROM contrato , empleado

WHERE (contrato.id_contrato= empleado.id_contrato) AND(contrato.fecha_fin_prueba BETWEEN '2020-07-01' AND '2020-12-31'); 
-- REQ 19 : Empleados de ventas con más de 30 pedidos en el mes. 
SELECT * 

FROM empleado 

WHERE (empleado.salario_base NOT BETWEEN 2000000 AND 1000000); 
-- REQ 20 : Empleados con su(s) cliente(s) asignados. 
SELECT empleado.id_empleado, empleado.nombre, empleado.apellido1, cliente.id_cliente, cliente.nombre

FROM empleado, cliente 

WHERE empleado.id_empleado = cliente.id_empleado; 
-- REQ 21 : Listado de los empleados que se les ha renovado el contrato más de 1 vez. 
SELECT * 

FROM empleado, contrato 

WHERE (empleado.id_contrato = contrato.id_contrato) AND (contrato.cont_renovacion_contrato > 1); 
-- REQ 22 : Mostrar empleados que tienen más de 10 horas extras nocturnas los festivos. 
SELECT *  

FROM pago_nomina, empleado 

WHERE ((empleado.id_empleado = pago_nomina.id_empleado) AND (pago_nomina.horas_extras_nocturnas_festivo > 5)); 
-- REQ 23 : Listado de los empleados que tienen una fecha de vencimiento de contrato en los próximos dos meses. 
SELECT empleado.* 

FROM empleado, contrato 

WHERE empleado.id_contrato = contrato.id_contrato 

AND contrato.fecha_vencimiento BETWEEN '2020-6-11' AND '2020-8-11'; 
-- REQ 24 : Listado de los empleados que su fecha de tiempo de prueba finalizo antes del 2019. 
SELECT *  

FROM empleado, contrato 

WHERE ((empleado.id_contrato = contrato.id_contrato) AND (contrato.fecha_fin_prueba BETWEEN '2010-01-01' AND '2018-12-31')); 
-- REQ 25 : Listado de los empleados que tienen vacaciones pendientes. 
SELECT *  

FROM empleado  

WHERE ((empleado.estado_empleado = 'vacaciones')); 
-- REQ 26 : Listado de los empleados que cumplen en diciembre. 
SELECT *  

FROM empleado  

WHERE MONTH(fecha_nacimiento) = 12; 
-- REQ 27 : Listado de los empleados que han recibido el bono en los últimos dos meses. 
SELECT * 

FROM pago_nomina 

WHERE (bono != 0); 
-- REQ 28 : Listado de empleados que se encuentran en vacaciones. 
SELECT * 

FROM Empleado 

WHERE (estado_empleado = 'vacaciones' ); 
-- REQ 29 : Mostrar el listado de hijos de trabajadores que están entre los 5 y 15 años. 
SELECT * 

FROM familiar 

WHERE (fecha_nacimiento_fam BETWEEN '10-06-2005' AND  '10-06-2015'); 
-- REQ 30 : Listados de los clientes que son persona jurídica.  
SELECT * 

FROM cliente 

WHERE (tipo_documento  = 6); 