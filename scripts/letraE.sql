-- LETRA E Exemplos de exclusão de dados em 5 tabelas. Mostre pelo menos um exemplo com DELETE aninhado, envolvendo mais de uma tabela.

-- EXEMPLO 01 - Exclusão do(s) cozinheiro(s) especialista(s) em culinária Nordestina

DELETE FROM restaurante.Cozinheiro
WHERE Especialidade = 'Nordestina';

-- EXEMPLO 02 - Exclusão de um item do menu.
DELETE FROM restaurante.ItemDoMenu
WHERE Nome = 'Salada';

-- EXEMPLO 03 - Exclusão de uma pessoa.

INSERT INTO restaurante.Pessoa (CPF, Nome, Cidade, Estado, Rua, CEP, Numero, Bairro, Complemento)
VALUES 
  ('90909090909', 'Carlos Piloto', 'Lavras', 'MG', 'Rua K', '8273231', '110', 'Centro', 'Apto 1987');
  
DELETE FROM restaurante.Pessoa
WHERE CPF = '90909090909';

-- EXEMPLO 04 - Exclusão de um pedido.
INSERT INTO restaurante.Pedido (idPedido, Valor, DataHora, NumMesa, idItem, CPF_Cliente, CPF_Garcom)
VALUES 
  (1, 75.90, '2022-07-21 12:30:00', 1, 1, '11111111111', '12121212121');
  
DELETE FROM restaurante.Pedido
WHERE idPedido = 1;

-- EXEMPLO 05 - Exclusão aninhada 

-- Exclusão aninhada de funcionários que vivem no bairro Asa Sul em Lavras
DELETE FROM restaurante.Funcionario
WHERE CPF IN (
    SELECT f.CPF
    FROM restaurante.Funcionario f
    JOIN restaurante.Pessoa p ON f.CPF = p.CPF
    WHERE p.Bairro = 'Asa Sul' AND p.Cidade = 'Lavras'
);
