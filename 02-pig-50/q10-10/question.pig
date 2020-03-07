-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
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
b1 =  FOREACH u GENERATE a3 AS r1, TOBAG(SUBSTRING(a3,0,1),SUBSTRING (a3,1,2),SUBSTRING (a3,2,3), 
                                         SUBSTRING(a3,3,4),SUBSTRING(a3,4,5),SUBSTRING(a3,5,6),
                                         SUBSTRING(a3,6,7), SUBSTRING(a3,7,8));
b2 = FOREACH b1 GENERATE r1, FLATTEN($1);
b3 = FILTER b2 BY NOT $1 IN ('');
b4 = GROUP b3 BY r1;
b5 = FOREACH b4 GENERATE group, COUNT($1);
b6 = ORDER b5 BY $1 DESC, $0;

STORE b6 INTO 'output' USING PigStorage (','); 

