-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS T1;

CREATE TABLE T1 (Letra  STRING, Fecha DATA, Numero INT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'

LOAD DATA INPATH 'data.tsv' INTO TABLE T1;

INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE

SELECT Numero
FROM T1
ORDER BY Numero
LIMIT 5;
