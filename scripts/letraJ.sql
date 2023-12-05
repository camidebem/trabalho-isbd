/* Integridade Referencial ao Inserir um Pedido:
Este trigger verifica se o CPF do cliente em um novo pedido existe na tabela Pessoa. */
DELIMITER //
CREATE TRIGGER before_insert_pedido
BEFORE INSERT ON restaurante.Pedido
FOR EACH ROW
BEGIN
    DECLARE cliente_existente INT;
    SELECT COUNT(*) INTO cliente_existente FROM restaurante.Pessoa WHERE CPF = NEW.CPF_Cliente;
    IF cliente_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: CPF do cliente não encontrado na tabela Pessoa.';
    END IF;
END;
//
DELIMITER ;
-- CPF '12345678900' não existe na tabela Pessoa
INSERT INTO restaurante.Pedido (Valor, DataHora, NumMesa, idItem, CPF_Cliente, CPF_Garcom)
VALUES (25.00, '2023-04-15 18:45:00', 2, 3, '12345678900', '13131313131');
-- Resultado: O trigger impedirá a inserção devido à integridade referencial

/* Este trigger é executado após cada atualização na tabela Funcionario. 
Ele verifica se houve uma alteração no salário comparando o valor antigo (OLD.Salario) 
com o novo valor (NEW.Salario). Se houver uma diferença, insere um novo registro na tabela 
HistoricoSalario com o CPF do funcionário, o salário antigo e a data da atualização. */
DELIMITER //
CREATE TRIGGER Salario_Update_Trigger
BEFORE UPDATE ON restaurante.Funcionario
FOR EACH ROW
BEGIN
  IF NEW.Salario <> OLD.Salario THEN
    -- O salário foi atualizado, registre o salário antigo e a data
    INSERT INTO restaurante.HistoricoSalario (CPF_Funcionario, SalarioAntigo, DataAtualizacao)
    VALUES (NEW.CPF, OLD.Salario, NOW());
  END IF;
END;
//
DELIMITER ;
-- Atualização de salário que ativa o trigger
UPDATE restaurante.Funcionario
SET Salario = 4000.00
WHERE CPF = '11111111111';

/* Integridade Referencial ao Excluir uma Pessoa:
Este trigger impede a exclusão de uma pessoa se ela estiver associada a um pedido */
DELIMITER //
CREATE TRIGGER before_delete_pessoa
BEFORE DELETE ON restaurante.Pessoa
FOR EACH ROW
BEGIN
    DECLARE pedidos_associados INT;
    SELECT COUNT(*) INTO pedidos_associados FROM restaurante.Pedido WHERE CPF_Cliente = OLD.CPF;
    IF pedidos_associados > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: Não é possível excluir uma pessoa associada a pedidos.';
    END IF;
END;
//
DELIMITER ;

-- CPF '17171717171' está associado a um pedido na tabela Pedido
DELETE FROM restaurante.Pessoa WHERE CPF = '17171717171';
-- Resultado esperado: O trigger impedirá a exclusão devido à integridade referencial


