/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT  
       firstname,
       SUBSTRING_INDEX(firstname, 'a', 1)
   FROM 
       u;

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

specific_columns = FOREACH data_table GENERATE INDEXOF(firstname,'a');
STORE specific_columns INTO 'output' USING PigStorage(',');
