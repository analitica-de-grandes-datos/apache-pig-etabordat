/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data_table = LOAD 'data.tsv' USING PigStorage('\t')
    AS (
        columna1:chararray,
        columna2:BAG{dict:TUPLE(letter:chararray)},
        columna3:MAP[]
    );

specific_columns = FOREACH data_table GENERATE columna2;
words = FOREACH specific_columns GENERATE FLATTEN(columna2) AS word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(words);

STORE wordcount INTO 'output' USING PigStorage(',');
