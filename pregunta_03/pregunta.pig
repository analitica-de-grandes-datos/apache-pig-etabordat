/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

A = LOAD './data.tsv' AS (letter:chararray, date:chararray, amount:int);
B = ORDER A BY amount;
C = limit B 5;
D = FOREACH C GENERATE amount;

STORE D INTO 'output/' using PigStorage(',');
