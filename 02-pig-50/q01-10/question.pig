-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

lines = LOAD 'data.tsv' USING PigStorage('\t') AS (f1:CHARARRAY, f2:CHARARRAY, f3:INT);
C= FOREACH lines GENERATE f1 AS f1;
D = GROUP C BY f1;
E =  FOREACH D GENERATE group, COUNT ($1); 

STORE E INTO 'output';
