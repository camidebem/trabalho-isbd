INSERT INTO restaurante.Pessoa (CPF, Nome, Cidade, Estado, Rua, CEP, Numero, Bairro, Complemento)
VALUES 
  ('11111111111', 'Camily de Bem', 'Lavras', 'MG', 'Rua X', '22222222', '101', 'Copacabana', NULL),
  ('22222222222', 'Carlos Silva', 'Lavras', 'MG', 'Rua Y', '33333333', '202', 'Vila Madalena', 'Apto 303'),
  ('33333333333', 'Laura Costa', 'Lavras', 'MG', 'Rua Z', '44444444', '303', 'Savassi', NULL),
  ('44444444444', 'Rafael Santos', 'Lavras', 'MG', 'Rua W', '55555555', '404', 'Moinhos de Vento', 'Apto 505'),
  ('55555555555', 'Juliana Lima', 'Lavras', 'MG', 'Rua V', '66666666', '505', 'Boa Viagem', NULL),
  ('66666666666', 'Pedro Henrique Cabral', 'Lavras', 'MG', 'Rua U', '77777777', '606', 'Aldeota', 'Apto 606'),
  ('77777777777', 'Paulo Eduardo Pereira Carvalho', 'Lavras', 'MG', 'Rua T', '88888888', '707', 'Barra', NULL),
  ('88888888888', 'Lucas Pereira', 'Lavras', 'MG', 'Rua S', '99999999', '808', 'Centro', NULL),
  ('99999999999', 'Carolina Souza', 'Lavras', 'MG', 'Rua R', '00000000', '909', 'Batel', 'Apto 909'),
  ('10101010101', 'Gustavo Costa', 'Lavras', 'MG', 'Rua Q', '12121212', '1010', 'Asa Sul', 'Apto 1010');
  

-- Inserção de mais 10 valores na tabela Pessoa com nomes diferentes
INSERT INTO restaurante.Pessoa (CPF, Nome, Cidade, Estado, Rua, CEP, Numero, Bairro, Complemento)
VALUES 
  ('12121212121', 'Carlos Silva Filho', 'Lavras', 'MG', 'Rua K', '11111111', '110', 'Centro', 'Apto 1101'),
  ('13131313131', 'Isabela Pereira', 'Lavras', 'MG', 'Rua L', '22222222', '120', 'Centro', 'Apto 1201'),
  ('14141414141', 'Ricardo Oliveira', 'Lavras', 'MG', 'Rua M', '33333333', '130', 'Centro', 'Apto 1301'),
  ('15151515151', 'Juliana Lima Oliveira', 'Lavras', 'MG', 'Rua N', '44444444', '140', 'Centro', 'Apto 1401'),
  ('16161616161', 'Leonardo Costa', 'Lavras', 'MG', 'Rua O', '55555555', '150', 'Centro', 'Apto 1501'),
  ('17171717171', 'Camila Rodrigues', 'Lavras', 'MG', 'Rua P', '66666666', '160', 'Centro', 'Apto 1601'),
  ('18181818181', 'Fernanda Souza', 'Lavras', 'MG', 'Rua Q', '77777777', '170', 'Centro', 'Apto 1701'),
  ('19191919191', 'Giovanni Santos', 'Lavras', 'MG', 'Rua R', '88888888', '180', 'Centro', 'Apto 1801'),
  ('20202020202', 'Natália Lima', 'Lavras', 'MG', 'Rua S', '99999999', '190', 'Centro', 'Apto 1901'),
  ('21212121212', 'Lucas Pereira Filho', 'Lavras', 'MG', 'Rua T', '00000000', '200', 'Centro', 'Apto 2001');


  INSERT INTO restaurante.Funcionario (Salario, CPF)
VALUES 
  (4000.00, '11111111111'),
  (3500.00, '22222222222'),
  (4200.00, '33333333333'),
  (3800.00, '44444444444'),
  (4100.00, '55555555555'),
  (3900.00, '66666666666'),
  (4300.00, '77777777777'),
  (3700.00, '88888888888'),
  (4000.00, '99999999999'),
  (3600.00, '10101010101');

INSERT INTO restaurante.Funcionario (Salario, CPF)
VALUES
	(2000.00, '12121212121'),
    (2000.00, '13131313131'),
    (2000.00, '14141414141'),
    (2000.00, '15151515151'),
    (2000.00, '16161616161');

  -- Inserção de 10 valores na tabela Cozinheiro
INSERT INTO restaurante.Cozinheiro (Especialidade, CPF)
VALUES 
  ('Churrasco', '11111111111'),
  ('Vegetariano', '22222222222'),
  ('Massas', '33333333333'),
  ('Frutos do Mar', '44444444444'),
  ('Sobremesas', '55555555555'),
  ('Comida Oriental', '66666666666'),
  ('Saladas', '77777777777'),
  ('Pratos Típicos', '88888888888'),
  ('Comida Mexicana', '99999999999'),
  ('Pizzas', '10101010101');


-- Inserção de 5 valores na tabela Garçom
INSERT INTO restaurante.Garcom (CPF)
VALUES
	('12121212121'),
    ('13131313131'),
    ('14141414141'),
    ('15151515151'),
    ('16161616161');

-- Inserção de 10 valores na tabela ItemDoMenu
ALTER TABLE restaurante.ItemDoMenu
MODIFY COLUMN Valor DECIMAL(5,2);

INSERT INTO restaurante.ItemDoMenu (Nome, Peso, Valor, Tipo, CPF)
VALUES 
  ('Picanha', 500, 75.90, 'Principal', '11111111111'),
  ('Salada', 300, 22.50, 'Entrada', '77777777777'),
  ('Sushi', 400, 30.00, 'Principal', '66666666666'),
  ('Lasanha', 600, 35.90, 'Principal', '33333333333'),
  ('Mousse de Chocolate', 150, 15.00, 'Sobremesa', '55555555555'),
  ('Camarão Grelhado', 450, 50.00, 'Principal', '44444444444'),
  ('Pizza Calabresa', 800, 40.00, 'Principal', '10101010101'),
  ('Burrito', 200, 18.90, 'Principal', '99999999999'),
  ('Sorvete Chocomenta', 200, 20.00, 'Sobremesa', '88888888888'),
  ('Frango Assado', 350, 42.50, 'Principal', '22222222222');

-- Inserção de 10 valores na tabela Mesa
INSERT INTO restaurante.Mesa (Capacidade, Estado)
VALUES 
  (4, 'L'),
  (6, 'O'),
  (2, 'R'),
  (8, 'L'),
  (4, 'O'),
  (10, 'L'),
  (6, 'O'),
  (2, 'R'),
  (8, 'L'),
  (4, 'O');

-- Inserção de 10 valores na tabela Pedido
INSERT INTO restaurante.Pedido (Valor, DataHora, NumMesa, idItem, CPF_Cliente, CPF_Garcom)
VALUES 
  (55.20, '2023-01-01 12:30:00', 1, 1, '17171717171', '12121212121'),
  (32.50, '2023-01-02 19:45:00', 2, 3, '18181818181', '13131313131'),
  (40.00, '2023-01-03 20:15:00', 3, 7, '19191919191', '14141414141'),
  (22.90, '2023-01-04 13:00:00', 4, 9, '20202020202', '15151515151'),
  (15.00, '2023-01-05 14:30:00', 5, 5, '21212121212', '16161616161'),
  (45.90, '2023-02-15 18:00:00', 6, 2, '22222222222', '12121212121'),
  (28.00, '2023-02-20 19:30:00', 8, 4, '44444444444', '13131313131'),
  (35.50, '2023-02-25 21:15:00', 10, 6, '66666666666', '14141414141'),
  (18.20, '2023-03-05 12:45:00', 3, 8, '88888888888', '15151515151'),
  (60.00, '2023-03-10 20:30:00', 7, 10, '10101010101', '16161616161');


-- Inserção de 10 valores na tabela Pagamento
INSERT INTO restaurante.Pagamento (MetodoPagamento, idPedido)
VALUES 
  ('Crédito', 1),
  ('Dinheiro', 2),
  ('Débito', 3),
  ('Pix', 4),
  ('Débito', 5),
  ('Crédito', 6),
  ('VR', 7),
  ('Pix', 8),
  ('VR', 9),
  ('Dinheiro', 10);

-- Inserção de 10 valores na tabela Telefone
INSERT INTO restaurante.Telefone (CPF, Telefone)
VALUES 
  ('11111111111', '123456789'),
  ('22222222222', '987654321'),
  ('33333333333', '1122334455'),
  ('44444444444', '5544332211'),
  ('55555555555', '99998888777'),
  ('66666666666', '3344556677'),
  ('77777777777', '8899777666'),
  ('88888888888', '9988776655'),
  ('99999999999', '1122334455'),
  ('10101010101', '5544332211');