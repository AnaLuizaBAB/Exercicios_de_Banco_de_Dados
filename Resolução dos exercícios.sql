-- 1 - Selecionar todos os dados do país Brasil (Brazil);
-- 2 - Selecionar todos os países da America do Sul;
-- 3 - Selecionar as linguagens da Africa do sul;
-- 4 - Selecionar todos os países que iniciam com a letra 'A'
-- 5 - Selecionar o país mais populoso;
-- 6 - Selecionar todas as cidades cadastradas do Brasil;
-- 7 - Selecionar todas as cidades cadastradas do Estados Unidos;
-- 8 - Selecionar o país mais populoso da America do Sul;
-- 9 - Selecionar o code, code2, nome do país de todos os países da Asia
-- 10 - Selecionar o code, nome do país, população e a expectativa de vida do país
--     com maior expectativa de vida;
-- 11 - Selecionar o code, nome do país, população e a expectativa de vida do país com menor expectativa de vida;
-- 12 - Selecionar todos o code, nome do país, ano de independência do países cujo o 
--      ano de independência está entre 1900 e 1999;
-- 13 - Selecionar o nome do país e a população do país com maior área de superfície;
-- 14 - Selecionar o nome e o continente do país com maior GNP;
-- 15 - Selecionar os 10 primeiros países com maior GNP;
-- 16 - Selecionar o nome do país, a população, expectativa de vida do menor país
--    (o país de menor área de superfície)
-- 17 - Alterar o nome do presidente do Brasil, expectativa e da população (pesquisar 
--     a expectativa de vida e população na internet);
-- 18 - Selecionar todos os países da Europa
-- 19 - Alterar o nome do presidente dos estados Unidos, a expectativa e da população (pesquisar as informações na internet);
-- 20 - Alterar a população (atualizar) da china; (pesquisar na internet)
-- 21 - Alterar a população (atualizar) da india; (pesquisar na internet)
-- 22 - Selecionar todos os países (selecione o nome do país) que falam o idioma 
--       Português
-- 23 - Selecionar todos os países que falam o idioma Inglês ou Espanhol ou Mandarim)
-- 24 - Selecionar apenas o idioma oficial de todos os países da Asia
-- 25 - Selecionar os idiomas do Canadá
-- 26 - Selecionar todos os países que não tem cidades cadastradas
-- 27 - Selecionar o nome do país, code, code2, nome da capital e todos os idiomas 
--       falados na China ou Japão
-- 28 - Selecionar todas as cidades que contém a palavra 'City' no nome da cidade
-- 29 - Selecionar os países que tem mais de 2 milhões de habitantes 
-- 30 – Desafio: Selecionar todos os países que falam mais de 10 idiomas


-- 1: 

SELECT * FROM cidade WHERE PaisCode = 'BRA';

SELECT * FROM pais WHERE Nome = 'Brazil';

SELECT * FROM paislinguagem WHERE PaisCode = 'BRA';

-- 2

SELECT * FROM pais WHERE Continente = 'América do sul';

-- 3

SELECT Code, Regiao, Linguagem FROM pais A INNER JOIN paislinguagem B
ON A.Code = B.PaisCode
WHERE Regiao = 'Southern Africa';

--4 

SELECT * FROM pais WHERE Nome LIKE 'A%';

--5

SELECT Nome, max(Populacao) AS "Populaçao total por país" FROM pais
GROUP BY Nome
ORDER BY max(Populacao) DESC
LIMIT 1;

--6

SELECT Nome AS "Cidade", PaisCode FROM cidade
WHERE PaisCode = 'BRA';

--7

SELECT Nome AS 'Cidade', PaisCode FROM cidade
WHERE PaisCode = "USA";

-- 8

SELECT Continente,Nome AS 'País', Regiao, Populacao FROM pais
WHERE Regiao = "América do Sul"
ORDER BY Populacao DESC
LIMIT 1;


-- 9 

SELECT  CODE, CODE2,  Continente, NOME FROM pais
WHERE Continente = 'Asia';


-- 10

SELECT Code, Nome, Populacao, max(ExpectativaVida) AS 'Expectativa_de_Vida'FROM pais
GROUP BY Code, Nome, Populacao
ORDER BY Expectativa_de_Vida DESC
LIMIT 1;


-- 11

SELECT Nome, Populacao, max(ExpectativaVida) AS 'Expectativa_de_vida' FROM pais
GROUP BY Nome, Populacao HAVING Expectativa_de_vida > 0
ORDER BY Expectativa_de_vida
LIMIT 1;

-- 12

SELECT Code, Nome, AnoIndependencia FROM pais
WHERE (1900 < AnoIndependencia) AND (AnoIndependencia < 1999)
ORDER BY AnoIndependencia;


-- 13

SELECT Nome, Populacao, max(AreaSuperficie) AS "Área de Superficie" FROM pais
GROUP BY Nome, Populacao
ORDER BY  max(AreaSuperficie) DESC
LIMIT 1;


-- 14
SELECT Nome, Continente, GNP FROM pais
ORDER BY GNP DESC
LIMIT 1;


-- 15

SELECT NOME, GNP FROM pais
ORDER BY GNP DESC
LIMIT 10;

-- 16

-- MENOR PAIS

SELECT * FROM pais
ORDER BY AreaSuperficie
LIMIT 1;

-- USANDO A CONSULTA A CIMA PARA CHEGAR A RESPOSTA DA QUESTÃO
SELECT Nome, Populacao, ExpectativaVida FROM (SELECT * FROM pais
ORDER BY AreaSuperficie
LIMIT 1) X;

             -- OU

SELECT Nome, Populacao, ExpectativaVida, AreaSuperficie FROM pais
ORDER BY AreaSuperficie
LIMIT 1;