/* Proyecto 4: SQL
 David Santiago Acuña Toro
 Base de datos donde tengo la informacion: demo (bookings)
 */

--EJERCICIO 1.
--Enunciado: Escribe una consulta que recupere los Vuelos (flights) y su identificador que figuren con status On Time.
SELECT * FROM flights
WHERE status = 'On Time';
/*La primeras consultas que he hecho han ido con errores hehe, 
es que no sabia muy bien por donde empezar, entonces he decidido un select *,
sin embargo, se podria solamente preguntar por el id del vuelo, como lo pondre
a continuacion, y luego especifico que quiero buscar dentro de la base de datos 
con un where.*/
SELECT flight_id FROM flights
WHERE status = 'On Time';
/*La diferencia con este es que solamente me va a arrojar el identificador del 
vuelo, pero no me va a dar mas informacion, para una consulta rapida podria
funcionar, pero para algo mas importante quizas quede obsoleto*/

/**/

--EJERCICIO 2.
/*Enunciado: Escribe una consulta que extraiga todas las columnas 
de la tabla bookings y refleje todas las reservas que han supuesto 
una cantidad total mayor a 1.000.000 (Unidades monetarias).*/
SELECT * FROM bookings
WHERE total_amount > 1000000;
/*Vale aqui poseemos problemas hehehe porque la base de datos que descargue
solamente me viene con resultados menores a los expuestos por ti heheh, entonces
simplemente decidi poner tres ejemplos con rangos menores y funciona mejor*/
--Primer ejemplo:
SELECT * FROM bookings
WHERE total_amount > 900000;
--Segundo ejemplo:
SELECT * FROM bookings
WHERE total_amount > 10000;
--Tercer ejemplo:
SELECT * FROM bookings
WHERE total_amount < 50000;

/**/

--EJERCICIO 3.
/*Enunciado: Escribe una consulta que extraiga todas las columnas de los datos de los modelos de aviones disponibles (aircraft_data). Puede que os aparezca en alguna actualización como "aircrafts_data", revisad las tablas y elegid la que corresponda.*/
SELECT * FROM airplanes_data;
/*Vale no se si me descargue la opcion correcta en este punto,
pero no me aparece la base de datos como aircraft_data, sin embargo, 
en la parte superior dejo claro que me aparecen 10 aviones con formato json,
con eso en mente he decidido tomar de referencia esta tabla para este ejercicio*/

SELECT airplane_code FROM airplanes_data;
/*Muy parecido al primer ejercicio donde se podia poner un * o un airplane_code,
sin embargo solamente me saldra como su placa, pero con el ejemplo de arriba si 
sale todo el elemento json*/

/**/

--Ejercicio 4.
/*Enunciado: Con el resultado anterior visualizado previamente, 
escribe una consulta que extraiga los identificadores de vuelo 
que han volado con un Boeing 737. (Código Modelo Avión = 733)*/

SELECT * FROM airplanes_data
WHERE airplane_code = '733';
/*Aquí tengo el mismo error que en el ejercicio anterior, al haber 
descargado la version mas pequeña en el ordenador no puedo acceder al 
avion que esperas que alcancemos, sin embargo he dejado listado 4 aviones
diferentes con su respectiva query para ejemplificar el ejercicio mejor*/

--Primer ejemplo:
SELECT * FROM airplanes_data
WHERE airplane_code = '32N';
--Segundo ejemplo:
SELECT * FROM airplanes_data
WHERE airplane_code = '76F';
--Tercer Ejemplo:
SELECT airplane_code FROM airplanes_data
ORDER BY speed ASC
LIMIT 1;
/*En este ejercicio decidi hacer algo un poco mas curioso que he visto en mis clases de base de datos y es a ordenar elementos de mayor a menor, y si aplicamos una pequeña condicion con un limite me devolvera el avion mas lento porque va de menor a mayor*/
--Caurto Ejemplo:
SELECT airplane_code from airplanes_data
ORDER BY speed DESC
LIMIT 1;
/*Y en este ejercicio pasa lo mismo que el anterior ejemplo pero al reves hehehe, aqui simplemente he puesto que empiece a contar de mayor a menor y se quede con el primer resultado es decir con el mas veloz kuchau*/

--Ejercicio Extra--
/*como no entendi muy bien el ejercicio porque no tenia el numero de avion 733 decidi algo mas divertido que no esta dentro del temario pero que aprendi en la fp y es hacer un join entre el vuelo y las rutas para obtener el avion que busco, porque hay un pequeño problema y esque los vuelos no conectan directamente con el el avion sino que son las routes*/

SELECT * FROM flights as f
JOIN routes as r on f.route_no = r.route_no
WHERE r.airplane_code = '733';

/**/

--Ejercicio 5.
/*Enunciado: Escribe una consulta que te muestre la información 
detallada de los tickets que han comprado las personas que se llaman Irina.*/
SELECT * FROM tickets
WHERE passenger_name LIKE 'Irina%';
/*Casi igual a otros ejercicios pero si solamente ponemos el nombre
irina sin mas, entonces no nos va a devolver nada porque todos los elementos 
tienen nombre y apellidos, entonces es necesario hacer un like, donde nos dice
que un si o si empieza con irina pero luego puede tener cualquier apellido*/

/**/