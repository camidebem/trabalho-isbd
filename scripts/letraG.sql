USE restaurante;

/* Criação da visão CozinheirosAtivos */
CREATE VIEW CozinheirosAtivos AS
SELECT Pessoa.CPF, Pessoa.Nome, Cozinheiro.Especialidade
FROM restaurante.Pessoa
JOIN restaurante.Cozinheiro ON Pessoa.CPF = Cozinheiro.CPF;

/* exemplo de uso - verificar quais cozinheiros são mais ativos no restaurante*/
SELECT * FROM CozinheirosAtivos;

/*  Criação da visão que soma os salários de todos os funcionários */
CREATE VIEW SomaSalariosFuncionarios AS
SELECT SUM(Salario) AS SomaSalarios
FROM restaurante.Funcionario;

/* exemplo de uso - cálculo de gastos mensais com funcionários */
SELECT * FROM SomaSalariosFuncionarios;

/* Criação da visão que conta o número de pedidos para cada item do menu */
CREATE VIEW PedidosPorItemDoMenu AS
SELECT
    ItemDoMenu.idItem,
    ItemDoMenu.Nome AS NomeItem,
    COUNT(Pedido.idPedido) AS NumeroPedidos
FROM
    restaurante.ItemDoMenu
LEFT JOIN
    restaurante.Pedido ON ItemDoMenu.idItem = Pedido.idItem
GROUP BY
    ItemDoMenu.idItem, ItemDoMenu.Nome;

/* exemplo de uso - monitorar os pedidos que mais saem e os que menos saem para possíveis melhorias */
SELECT * FROM PedidosPorItemDoMenu;