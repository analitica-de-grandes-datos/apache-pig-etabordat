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
   WHERE 
      color REGEXP '^[^b]';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
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
filter_rows = FILTER specific_columns BY NOT STARTSWITH(color,'b');
STORE filter_rows INTO 'output' USING PigStorage(',');
