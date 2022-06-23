/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data_table = LOAD 'data.csv' USING PigStorage(',')
    AS (
        Id:int,
        Nombre:chararray,
        Apellido:chararray,
        Fecha:datetime,
        Color:chararray,
        Cantidad:int
    );

specific_columns = FOREACH data_table GENERATE Apellido , SIZE(Apellido) AS tamano;
columns_order = ORDER specific_columns BY tamano desc, Apellido;
limit_output = LIMIT columns_order 5;
STORE limit_output INTO 'output' USING PigStorage(',');
