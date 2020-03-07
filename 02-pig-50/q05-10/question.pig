-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
!hadoop fs -put data.tsv
lines = LOAD 'data.tsv' USING PigStorage('\t')
    AS (f1:CHARARRAY, f2:BAG{t:(p:CHARARRAY)}, f3:CHARARRAY);

letras = FOREACH lines GENERATE FLATTEN(f2) AS (letra:CHARARRAY);
tabla = GROUP letras BY letra;
cuenta = FOREACH tabla GENERATE group, COUNT(letras);

STORE b INTO 'output';
