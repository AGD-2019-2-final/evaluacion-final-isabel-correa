-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

u = LOAD 'data.tsv'
    AS (c1:CHARARRAY, c2:BAG{t:(p:CHARARRAY)}, c3:MAP[]);
r = FOREACH u GENERATE FLATTEN(c3) AS (c3:CHARARRAY);
grouped = GROUP r by c3;
cuenta = FOREACH grouped GENERATE group, COUNT(r);

STORE b INTO 'output';
fs -get output/ .
