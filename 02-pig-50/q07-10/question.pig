-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
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
!hadoop fs -rm *.tsv
!hadoop fs -put data.tsv
%%pig
u = LOAD 'data.tsv' USING PigStorage('\t')
    AS (columna1:CHARARRAY, columna2:BAG{Tuple()}, columna3:MAP[CHARARRAY]);
DUMP u;
%%pig
g1= FOREACH u GENERATE (columna1,columna2) AS g11, FLATTEN(columna3);
g2 = GROUP g1 BY g11;
g3 = FOREACH g2 GENERATE group, COUNT($1);
DUMP g3;
%%pig 
g4 =FOREACH g3 GENERATE FLATTEN($0) AS (f1,f2),$1 AS f3;
DUMP g4;
%%pig
g5 =FOREACH g4 GENERATE (f1,f3,f2) AS m1, f2 AS m2;
DUMP g5;
%%pig
g6= FOREACH g5 GENERATE m1,FLATTEN(m2) AS (g61,g62);
g7= GROUP g6 BY $0;
g8= FOREACH g7 GENERATE group, COUNT($1);
DUMP g8;
g9 =FOREACH g8 GENERATE FLATTEN($0) AS (g91:CHARARRAY,g92:INT,g93:BAG{}),$1 AS g94;
g10= FOREACH g9 GENERATE g91,g94,g92;
DUMP g10;
g11 = ORDER g10 BY $0, $1, $2;
DUMP g11;
!rm -rf output
!mkdir output
 %%pig
STORE g11 INTO 'output';
fs -get output/ .
