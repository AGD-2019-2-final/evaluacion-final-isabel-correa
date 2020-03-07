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
--        LOCATE('ia', firstname) 
--    FROM 
--        u;
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

%load_ext bigdata
%timeout 300
%pig_start
!hadoop fs -put data.csv
%%pig

u = LOAD 'data.csv' USING PigStorage(',')
    AS (a1:INT,
        a2:CHARARRAY,
        a3:CHARARRAY,
        a4: CHARARRAY,
        a5: CHARARRAY);

b1 = FOREACH u GENERATE ToString(ToDate(a4, 'YYYY-MM-DD'),'YYYY'), ToString(ToDate(a4, 'YYYY-MM-DD'),'yy');

DUMP b1;
!rm -rf output
!mkdir output
 %%pig
STORE b1 INTO 'output';
fs -get output/ .

