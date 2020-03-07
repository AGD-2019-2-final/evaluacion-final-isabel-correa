-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT
--        firstname,
--        color
--    FROM 
--        u
--    WHERE color = 'blue' OR firstname LIKE 'K%';
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
b1 =  FOREACH u GENERATE a2 AS a2, a5 AS a5;
b2 = ORDER b1 BY a2;
b3 = FILTER b1 BY ((a2 > 'K') AND (a2 < 'L')) OR (a5 =='blue')  ; 

STORE b1 INTO 'output' USING PigStorage (',');
