/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

       /* >>> Escriba su respuesta a partir de este punto <<<*/

A = LOAD './data.csv' using PigStorage(',')
     AS (num:int, name:chararray, LASTNAME:chararray, time:chararray, color:chararray, otre:int);
B = FOREACH A GENERATE color;
C = FILTER B BY ($0 matches '.*b.*');

DUMP B;

STORE C INTO 'output/' using PigStorage(',');
