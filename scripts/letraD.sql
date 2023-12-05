-- Exemplos de modificação de dados em 5 tabelas. Mostre pelo menos um exemplo com UPDATE aninhado, envolvendo mais de uma tabela (1,7%)

-- EXEMPLO 01 - Alterar salário de funcionário 
UPDATE restaurante.Funcionario
SET Salario = Salario + 1000
WHERE CPF = '11111111111';

-- EXEMPLO 02 - Alterar especialidade do cozinheiro
UPDATE restaurante.Cozinheiro
SET Especialidade = 'Nordestina'
WHERE CPF = '22222222222';

-- EXEMPLO 03 - Alterar o estado da mesa
UPDATE restaurante.Mesa
SET Estado = 'O'
WHERE NumMesa = 1;

-- EXEMPLO 04 - Alterar o preço de um produto do menu
UPDATE restaurante.ItemDoMenu
SET Valor = Valor * 4
WHERE idItem = 6;

-- EXEMPLO 05 UPDATE ANINHADO - Aumentar o salário em 10% dos funcionários que residem em 'Lavras', no bairro 'Centro'.
UPDATE restaurante.Funcionario
SET Salario = Salario * 1.1  -- Aumento de 10%
WHERE CPF IN (
    SELECT CPF
    FROM restaurante.Pessoa
    WHERE Bairro = 'Centro' AND Cidade = 'Lavras'
);



