-- Questao 3
-- 3.1
-- 1. Seleciona as colunas de suas respectivas tabelas a serem usadas
-- 2. Aplica INNER JOIN para as tabelas pessoa, tempo e loja com o intuito de selecionar os registros que possuem valores correspondentes em ambas as tabelas
-- 3. Identifica os campos solicitados pelo item da questao (numero do mes, numero do ano e uf)
-- 4. Retorna o resultado esperado

SELECT d_Pessoa.ID_PESSOA, 
		d_Pessoa.NM_PESSOA,
		d_Tempo.DT_REF,
		f_Vendas.VL_VENDA
FROM f_Vendas
INNER JOIN d_Pessoa ON 
	f_Vendas.ID_PESSOA =  d_Pessoa.ID_PESSOA
INNER JOIN d_Tempo ON
	f_Vendas.ID_TEMPO = d_Tempo.ID_TEMPO
INNER JOIN d_Loja ON
	f_Vendas.ID_LOJA = d_Loja.ID_LOJA
WHERE d_Tempo.NU_MES = 1
		AND d_Tempo.NU_ANO = 2020
		AND d_Loja.DS_UF = 'CE';

-- 3.2
-- 1. Seleciona as colunas de suas respectivas tabelas a serem usadas e a quantidade de vendas
-- 2. Aplica INNER JOIN para as tabelas pessoa e tempo com o intuito de selecionar os registros que possuem valores correspondentes em ambas as tabelas 
-- 3. Identifica os campos solicitados pelo item
-- 4. Agrupa os resultados pelo ID_PESSOA
-- 5. Retorna o resultado esperado

SELECT d_Pessoa.ID_PESSOA,
		COUNT(f_Vendas.NU_VENDA)
FROM f_Vendas
INNER JOIN d_Pessoa ON
	f_Vendas.ID_PESSOA = d_Pessoa.ID_PESSOA
INNER JOIN d_Tempo ON
	f_Vendas.ID_TEMPO = d_Tempo.ID_TEMPO
WHERE d_Tempo.NU_MES = 3
	AND d_Tempo.NU_ANO = 2020
GROUP BY d_Pessoa.ID_PESSOA;

--3.3
-- 1. Seleciona as colunas de suas respectivas tabelas a serem usadas
-- 2. Utiliza a condicao de inexistencia (NOT IN) para que a query retorne apenas os valores que não estão presentes no item 3
-- 3. Dentro da primeira selecao, realiza uma segunda com o intuito de retornar o id das pessoas que compraram em marco de 2020
-- 4. Retorna o resultado esperado

SELECT d_Pessoa.ID_PESSOA,
	d_Pessoa.NM_PESSOA
FROM d_Pessoa
WHERE d_Pessoa.ID_PESSOA NOT IN (SELECT d_Pessoa.ID_PESSOA
				FROM f_Vendas
				INNER JOIN d_Tempo ON
				f_Vendas.ID_TEMPO = d_Tempo.ID_TEMPO
				WHERE d_Tempo.NU_ANO = 2020
				AND d_Tempo.NU_MES = 3
				AND f_Vendas.ID_PESSOA = d_Pessoa.ID_PESSOA);

-- 3.4
-- 1. Seleciona as colunas de suas respectivas tabelas a serem usadas
-- 2. Aplica INNER JOIN para as tabelas pessoa e tempo com o intuito de selecionar os registros que possuem valores correspondentes em ambas as tabelas
-- 3. Agrupa por os resultados por ID_PESSOA
-- 4. Retorna o resultado esperado


SELECT d_Pessoa.ID_PESSOA,
		d_Pessoa.NM_PESSOA,
		MAX(d_Tempo.DT_REF)
FROM f_Vendas
INNER JOIN d_Pessoa ON
	f_Vendas.ID_PESSOA = d_Pessoa.ID_PESSOA
INNER JOIN d_Tempo ON
	f_Vendas.ID_TEMPO = d_Tempo.ID_TEMPO
GROUP BY d_Pessoa.ID_PESSOA, d_Pessoa.NM_PESSOA;