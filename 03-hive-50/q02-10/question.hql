-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS T1;

CREATE TABLE T1 (Letra  STRING, Fecha DATA, Numero INT) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'

LOAD DATA LOCAL INPATH 'data.tsv'OVERWRITE INTO TABLE T1;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE

SELECT Letra, Fecha, Numero
FROM T1
ORDER BY Letra, Numero;

