-- primera introducción al lenguaje SQL 
/* Este codigo servira para poder crear una tabla */
CREATE TABLE mi_tabla (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    edad INTEGER
);


-- Eliminar la tabla 

DROP TABLE mi_tabla;

-- consulta columna de interes en este caso usaremos la tabla demo 

SELECT Name  FROM demo;

- si queremos consltar varias columnas demo

SELECT Name, ID  FROM demo;

/* También puedes utilizar el comando SELECT * para 
consultar todas las columnas de una tabla: */

SELECT * FROM demo; 

/* Para agregar una nueva columna a una tabla ya existente 
usaremos el comando 'ALTER TABLE' con la cláusula 'ADD COLUMN' */

ALTER TABLE demo
ADD COLUMN data_new INTEGER;

/* digamos que quiero agregar datos a mi nueva nueva columna 
asi que esos datos de data_new sera (id*3) veamos como agregarlo */

UPDATE demo
SET data_new = ID*3 ;

/* Ahora me interesa hacer una nueva columna que contenga los valores de 
ID / 3 y la llamara IDD3 */

aLTER TABLE demo
ADD COLUMN IDD3 INTEGER;

UPDATE demo
SET IDD3 = ID/3 ;

-- Verificamos que este hecho correctamente 

SELECT * FROM demo; 

/* diagamos que ahora queremos cambiar una columna de nombre,
usaremos la funcion 'RENAME COLUMN' */

ALTER TABLE demo
RENAME COLUMN data_new TO IDP3;

/* Ahora vamos hacer una copio de una tabla ya existente 
en este caso demo usaremos el comando 'CREATE TABLE' con la 
cláusula 'AS' */

CREATE TABLE cdemo AS
SELECT * FROM demo;

/*Ten en cuenta que esta copia es una copia exacta, incluyendo los datos y la 
estructura de la tabla original. Si deseas copiar solo la estructura de la tabla
sin los datos, puedes utilizar el comando 'CREATE TABLE' con la cláusula 
'LIKE', comando de ejemplo :

CREATE TABLE mi_tabla_copia (
    LIKE mi_tabla
); */

/* Para cambiar el valor de una celda en SQLite, puedes utilizar el comando UPDATE.
usaremos la tabla copia de demo para hacer nuestro ejemplo; cambiaremos una celda de 
IDP3, en especifico la 3 fila en la celda que dice 9 por 18

UPDATE nombre_de_la_tabla
SET columna_a_actualizar = nuevo_valor
WHERE condición_para_seleccionar_la_fila;

*/

SELECT * FROM cdemo; 

UPDATE cdemo
SET IDP3 = 18
WHRE ID = '3';

/* Para cambiar múltiples celdas en SQLite,puedes utilizar el comando UPDATE con 
varias asignaciones en la cláusula SET. El formato básico es el siguiente:

UPDATE nombre_de_la_tabla
SET columna1 = nuevo_valor1,
    columna2 = nuevo_valor2,
    ...
    columnaN = nuevo_valorN
WHERE condición_para_seleccionar_la_fila;

vamos hacer los cambios nuevamente en nuestra tabla cdemo en la parte de IDD3
en su primera fila que es 0 lo cabiaremos a 9 y en su segunda fila que es igual 0
la cambiaremos a 6 */

UPDATE cdemo
SET IDD3 = 9,
    IDP3 = 10
WHERE ID = 1;

UPDATE cdemo
SET IDD3 = 6
WHERE ID = 2;

SELECT * FROM cdemo; 

/*Para consolidar dos tablas en una sola, puedes utilizar el comando UNION 
o UNION ALL en SQLite. El comando UNION devuelve todos los registros de ambas tablas, 
eliminando los duplicados, mientras que el comando UNION ALL devuelve todos los 
registros de ambas tablas, incluyendo los duplicados.

CREATE TABLE tabla_consolidada AS
SELECT * FROM tabla1
UNION
SELECT * FROM tabla2;

CREATE TABLE tabla_consolidada AS
SELECT * FROM tabla1
UNION ALL
SELECT * FROM tabla2;
*/ 

CREATE TABLE TC AS
SELECT * FROM demo
UNION ALL
SELECT * FROM cdemo;

--verificamos 

SELECT * FROM TC; 


/*Si las tablas tienen columnas adicionales que no deseas incluir en la tabla consolidada, 
puedes especificar las columnas que deseas incluir en la cláusula SELECT:

CREATE TABLE tabla_consolidada AS
SELECT columna1, columna2, columna3 FROM tabla1
UNION
SELECT columna1, columna2, columna3 FROM tabla2;
*/ 

CREATE TABLE TCC AS
SELECT name,idp3 , idd3 FROM demo
UNION ALL
SELECT name,idp3 , idd3 FROM cdemo;

--verificamos 

SELECT * FROM TCC; 
