-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
%load_ext bigdata
%pig_start
%timeout 300
!hadoop fs -put data.tsv
%%pig
u = LOAD 'data.tsv'
    AS (c1:CHARARRAY, c2:BAG{t:(p:CHARARRAY)}, c3:MAP[]);
a1 = FOREACH u GENERATE FLATTEN(c2) AS f1, c3 AS f2;
a2 = FOREACH a1 GENERATE f1 AS r1, FLATTEN(f2);
a3 = FOREACH a2 GENERATE ($0, $1) AS a31;
a4 = GROUP a3 BY $0;
a5 = FOREACH a4 GENERATE group, COUNT ($1);
DUMP a5;
!rm -rf output
!mkdir output
 %%pig
STORE a5 INTO 'output';
fs -get output/ .