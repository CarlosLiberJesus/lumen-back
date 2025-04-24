

SELECT * FROM cidadaos;

SELECT cc.id, c.nome, ic.cargo, ic.tipo, ic.instituicao_id, cc.inicio, cc.fim
FROM cidadao_cargos cc, cidadaos c, instituicao_cargos ic 
WHERE cc.cidadao_id = 2032
AND cc.cargo_id = ic.id
AND cc.cidadao_id = c.id;

SELECT d.id, c.nome, ic.cargo, cc.inicio, cc.fim, l.sigla, l.nome, i.nome
FROM deputados d, cidadao_cargos cc, cidadaos c, 
	instituicoes i, instituicao_cargos ic, 
	instituicao_legislaturas il, legislaturas l
WHERE c.nome = 'Mário Soares'
AND cc.cargo_id = ic.id
AND ic.instituicao_id = il.id
AND il.id = l.id
AND d.partido_id = i.id
AND cc.cidadao_id = c.id
AND cc.id = d.deputado_id;

SELECT
    cc.id AS cidadao_cargo_id,
    c.nome AS nome_cidadao,
    ic.cargo AS nome_cargo,
    ic.tipo AS tipo_cargo,
    cc.inicio,
    cc.fim,
    i.nome AS instituicao_nome
FROM cidadao_cargos cc
JOIN cidadaos c
    ON cc.cidadao_id = c.id
JOIN instituicao_cargos ic
    ON cc.cargo_id = ic.id
JOIN instituicao_governos ig
    ON ic.instituicao_id = ig.id
JOIN instituicoes i
    ON ig.instituicao_id = i.id
WHERE ig.governo_id = 159
ORDER BY cc.inicio, c.nome;

/*
-- Display Eleições 
SELECT e.id, e.data, e.data_desconhecida, et.tipo
FROM eleicoes e, eleicao_tipos et 
WHERE e.eleicao_tipo_id = et.id ORDER BY e.id, e.eleicao_tipo_id ASC;
*/

--SELECT * FROM republicas;
--Select * from instituicoes ORDER BY id ASC;
--SELECT * from legislaturas;




-- Find duplicated nomes with count
SELECT nome, COUNT(*) as count
FROM cidadaos
GROUP BY nome
HAVING COUNT(*) > 1
ORDER BY count DESC, nome ASC;


/*
-- More detailed version showing all records with duplicated names
SELECT c1.id, c1.nome, c1.nome_completo
FROM cidadaos c1
INNER JOIN (
    SELECT nome
    FROM cidadaos
    GROUP BY nome
    HAVING COUNT(*) > 1
) c2 ON c1.nome = c2.nome
ORDER BY c1.nome, c1.id;

-- Alternative version including more fields
SELECT 
    c1.id,
    c1.nome,
    c1.nome_completo,
    c1.created_at,
    COUNT(*) OVER (PARTITION BY c1.nome) as total_duplicates
FROM cidadaos c1
WHERE EXISTS (
    SELECT 1 
    FROM cidadaos c2 
    WHERE c2.nome = c1.nome 
    GROUP BY c2.nome 
    HAVING COUNT(*) > 1
)
ORDER BY c1.nome, c1.id;

*/
