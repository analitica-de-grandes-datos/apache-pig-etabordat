/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
salida.

   1971-07-08,08,8,jue,jueves
   1974-05-23,23,23,jue,jueves
   1973-04-22,22,22,dom,domingo
   1975-01-29,29,29,mie,miercoles
   1974-07-03,03,3,mie,miercoles
   1974-10-18,18,18,vie,viernes
   1970-10-05,05,5,lun,lunes
   1969-02-24,24,24,lun,lunes
   1974-10-17,17,17,jue,jueves
   1975-02-28,28,28,vie,viernes
   1969-12-07,07,7,dom,domingo
   1973-12-24,24,24,lun,lunes
   1970-08-27,27,27,jue,jueves
   1972-12-12,12,12,mar,martes
   1970-07-01,01,1,mie,miercoles
   1974-02-11,11,11,lun,lunes
   1973-04-01,01,1,dom,domingo
   1973-04-29,29,29,dom,domingo

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
        date:chararray,
        color:chararray,
        Cantidad:int
    );

B = FOREACH data_table GENERATE date,  ToString(ToDate(date,'yyyy-MM-dd',
    'America/Bogota'),'dd'), ToString(ToDate(date,'yyyy-MM-dd',
    'America/Bogota'),'d'), ToString(ToDate(date,'yyyy-MM-dd',
    'America/Bogota'),'EEEE');
C = FOREACH B GENERATE $0, REPLACE($3,'Monday','lunes'), $1, $2;

D = FOREACH C GENERATE $0, REPLACE($1,'Tuesday','martes'), $2, $3;
E = FOREACH D GENERATE $0, REPLACE($1,'Wednesday','miercoles'), $2, $3;
F = FOREACH E GENERATE $0, REPLACE($1,'Thursday','jueves'), $2, $3;
G = FOREACH F GENERATE $0, REPLACE($1,'Friday','viernes'), $2, $3;
H = FOREACH G GENERATE $0, REPLACE($1,'Saturday','sabado'), $2, $3;
I = FOREACH H GENERATE $0, REPLACE($1,'Sunday','domingo'), $2, $3;
J = FOREACH I  GENERATE $0,$2,$3, SUBSTRING($1, 0, 3),$1;

STORE J  INTO 'output' USING PigStorage(',');




