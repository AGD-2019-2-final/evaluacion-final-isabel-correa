-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
-- salida esperada es la siguiente:
-- 
--   (Hamilton)
--   (Holcomb)
--   (Garrett)
--   (Fry)
--   (Kinney)
--   (Klein)
--   (Diaz)
--   (Guy)
--   (Estes)
--   (Jarvis)
--   (Knight)
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
        a3:CHARARRAY);
b1 =  FOREACH u GENERATE a3 AS r1;
b2 = FILTER b1 BY ($0 >= 'D') AND ($0 < 'L');

STORE b2 INTO 'output';

