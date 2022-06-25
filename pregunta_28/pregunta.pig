/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

       /* >>> Escriba su respuesta a partir de este punto <<<*/

A = LOAD './data.csv' using PigStorage(',')
     AS (num:int, name:chararray, LASTNAME:chararray, time:chararray, color:chararray, otre:int);
B = FOREACH A GENERATE SUBSTRING(time,0,4), SUBSTRING(time,2,4);
DUMP B;

STORE B INTO 'output/' using PigStorage(',') ;


