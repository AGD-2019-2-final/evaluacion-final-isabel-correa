-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
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

b1 = FOREACH (GROUP (FOREACH u GENERATE GetYear(ToDate(a4, 'yyyy-mm-dd'))) by $0) GENERATE group, COUNT($1);


STORE b1 INTO 'output' USING PigStorage (',');
