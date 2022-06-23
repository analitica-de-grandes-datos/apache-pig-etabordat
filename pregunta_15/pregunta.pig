/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

data_table = LOAD 'data.csv' USING PigStorage(',')
    AS (
        Id:int,
        firstname:chararray,
        Apellido:chararray,
        Fecha:datetime,
        color:chararray,
        Cantidad:int
    );

specific_columns = FOREACH data_table GENERATE firstname, color;
filter_rows = FILTER specific_columns BY color == 'blue' AND STARTSWITH(firstname,'Z');
format_output = FOREACH filter_rows GENERATE CONCAT(firstname,' ',color);
STORE format_output INTO 'output' USING PigStorage(',');
