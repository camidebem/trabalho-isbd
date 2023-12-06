/* Recupera o nome, cidade e estado de todas as pessoas no banco de dados. */ 
SELECT Nome, Cidade, Estado
FROM restaurante.Pessoa;

/* Recupera o número da mesa, valor, data e hora do pedido, juntamente com o CPF do garçom, para pedidos com valor superior a 30.00.*/
SELECT Pedido.NumMesa, Pedido.Valor, Pedido.DataHora, Garcom.CPF
FROM restaurante.Pedido
JOIN restaurante.Garcom ON Pedido.CPF_Garcom = Garcom.CPF
WHERE Pedido.Valor > 30.00;

/* Conta o número de pedidos feitos por cada garçom e retorna apenas aqueles que têm mais de 5 pedidos. */
SELECT CPF_Garcom, COUNT(*) AS NumPedidos
FROM restaurante.Pedido
GROUP BY CPF_Garcom
HAVING NumPedidos > 5;

/* Recupera o nome e salário de todos os funcionários, ordenados pelo salário em ordem decrescente. */
SELECT Pessoa.Nome, Funcionario.Salario
FROM restaurante.Funcionario
JOIN restaurante.Pessoa ON Funcionario.CPF = Pessoa.CPF
ORDER BY Funcionario.Salario DESC;

/* Recupera o nome e a quantidade de pedidos feitos por cada cliente. */
SELECT Pessoa.Nome, (
    SELECT COUNT(*)
    FROM restaurante.Pedido
    WHERE CPF_Cliente = Pessoa.CPF
) AS QuantidadePedidos
FROM restaurante.Pessoa
WHERE Pessoa.CPF IN (SELECT DISTINCT CPF_Cliente FROM restaurante.Pedido);

/* Recupera os números de telefone de duas pessoas diferentes usando a operação UNION. */
SELECT CPF, Telefone
FROM restaurante.Telefone
WHERE CPF = '11111111111'
UNION
SELECT CPF, Telefone
FROM restaurante.Telefone
WHERE CPF = '22222222222';

/* Recupera o nome e o número da mesa das mesas com capacidade maior que 4 e estado livre. */
SELECT NumMesa, Estado
FROM restaurante.Mesa
WHERE Capacidade > 4 AND Estado = 'L';

/* Recupera o número e o estado das mesas com capacidade menor ou igual a 4 ou estado ocupado. */
SELECT NumMesa, Estado
FROM restaurante.Mesa
WHERE Capacidade <= 4 OR Estado = 'O';

/* Recupera o CPF e nome das pessoas de Lavras que não residem no bairro Centro. */
SELECT CPF, Nome
FROM restaurante.Pessoa
WHERE NOT Bairro = 'Centro' AND Cidade = 'Lavras';

/* Recupera o nome e salário de todos os funcionários com salário entre 3500.00 e 4000.00. */
SELECT Pessoa.Nome, Funcionario.Salario
FROM restaurante.Funcionario
JOIN restaurante.Pessoa ON Funcionario.CPF = Pessoa.CPF
WHERE Funcionario.Salario BETWEEN 3500.00 AND 4000.00;

/* Recupera o nome das pessoas cujo nome começa com a letra 'C'. */
SELECT Pessoa.Nome
FROM restaurante.Pessoa
JOIN restaurante.Funcionario ON Pessoa.CPF = Funcionario.CPF
WHERE Pessoa.Nome LIKE 'C%';

/* Recupera o nome dos clientes que fizeram pelo menos dois pedidos. */
SELECT Pessoa.Nome
FROM restaurante.Pessoa
WHERE EXISTS (
    SELECT 1
    FROM restaurante.Pedido
    WHERE CPF_Cliente = Pessoa.CPF
    HAVING COUNT(*) >= 2
);

/* Recupera o nome e a especialidade dos cozinheiros, incluindo aqueles sem especialidade associada. */
SELECT Pessoa.Nome, Cozinheiro.Especialidade
FROM restaurante.Pessoa
LEFT OUTER JOIN restaurante.Cozinheiro ON Pessoa.CPF = Cozinheiro.CPF
WHERE Cozinheiro.CPF IS NOT NULL;

/* Recupera o nome dos cozinheiros que têm pelo menos um item do menu associado a eles. */
SELECT Pessoa.Nome
FROM restaurante.Pessoa
JOIN restaurante.Cozinheiro ON Pessoa.CPF = Cozinheiro.CPF
WHERE Cozinheiro.CPF = ANY (
    SELECT CPF
    FROM restaurante.ItemDoMenu
);

-- Recupera o nome do funcionário cujo salário é maior que todos os outros funcionários
SELECT Pessoa.Nome
FROM restaurante.Pessoa
JOIN restaurante.Funcionario ON Pessoa.CPF = Funcionario.CPF
WHERE Funcionario.Salario > ALL (
    SELECT Salario
    FROM restaurante.Funcionario
    WHERE Funcionario.CPF <> Pessoa.CPF -- Exclui o próprio funcionário da comparação
);


/* Calcula a média do valor dos pedidos para cada garçom. */
SELECT Garcom.CPF, AVG(Pedido.Valor) AS MediaPedidos
FROM restaurante.Garcom
JOIN restaurante.Pedido ON Garcom.CPF = Pedido.CPF_Garcom
GROUP BY Garcom.CPF;

/* Recupera a data e hora do pedido, nome do cliente e CPF do garçom para os últimos 5 pedidos feitos. */
SELECT Pedido.DataHora, Pessoa.Nome, Garcom.CPF
FROM restaurante.Pedido
JOIN restaurante.Pessoa ON Pedido.CPF_Cliente = Pessoa.CPF
JOIN restaurante.Garcom ON Pedido.CPF_Garcom = Garcom.CPF
ORDER BY Pedido.DataHora DESC
LIMIT 5;

/* retorna todos os pedidos cujo valor é maior que todos os pedidos feitos pelo cliente com CPF '18181818181' */
SELECT *
FROM restaurante.Pedido
WHERE Valor > ALL (
  SELECT Valor
  FROM restaurante.Pedido
  WHERE CPF_Cliente = '18181818181'
);










