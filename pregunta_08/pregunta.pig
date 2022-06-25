/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<

        
*/

A = LOAD 'data.tsv'
    AS (f1:CHARARRAY, f2:BAG{t: TUPLE(p:CHARARRAY)}, f3:MAP[]);
B = FOREACH A GENERATE f2, f3;
C = FOREACH B GENERATE FLATTEN(f2),FLATTEN(f3);
D = GROUP C BY ($0, $1);
E = FOREACH D GENERATE group , COUNT($1);
DUMP E;

STORE E INTO 'output/' using PigStorage(',') ;




