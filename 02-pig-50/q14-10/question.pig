--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        color 
--    FROM 
--        u 
--    WHERE 
--        color NOT LIKE 'b%';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

u = LOAD 'data.csv' USING PigStorage(',')
    AS (a1:INT,
        a2:CHARARRAY,
        a3:CHARARRAY,
        a4: CHARARRAY,
        a5: CHARARRAY);
b1 =  FOREACH u GENERATE a5 AS r1;
b2 = FILTER b1 BY (r1 < 'B') OR (r1 > 'C');


STORE b2 INTO 'output';
