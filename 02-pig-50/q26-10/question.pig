-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname 
--    FROM 
--        u 
--    WHERE 
--        SUBSTRING(firstname, 0, 1) >= 'm';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--


u = LOAD 'data.csv' USING PigStorage(',')
    AS (a1:INT,
        a2:CHARARRAY,
        a3:CHARARRAY,
        a4: CHARARRAY,
        a5: CHARARRAY);
b1 =  FOREACH u GENERATE a2 AS a2;
b2=  FILTER b1 BY LOWER(SUBSTRING(a2, 0, 1)) >= 'm';


STORE b2 INTO 'output';


