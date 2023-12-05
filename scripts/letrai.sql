/* Este procedimento recebe o CPF de um funcionário e o novo salário como parâmetros de entrada e atualiza o salário correspondente na tabela Funcionario. */
DELIMITER //
CREATE PROCEDURE AtualizarSalario(IN p_CPF VARCHAR(11), IN p_NovoSalario DECIMAL(10,2))
BEGIN
    UPDATE restaurante.Funcionario
    SET Salario = p_NovoSalario
    WHERE CPF = p_CPF;
END //
DELIMITER ;
/* exemplo de uso: */
CALL AtualizarSalario('11111111111', 4500.00);

/* este procedimento atualiza a especialidade de um cozinheiro */
DELIMITER //
CREATE PROCEDURE AtualizarEspecialidade(IN p_CPF VARCHAR(11), IN p_NovaEspecialidade VARCHAR(50))
BEGIN
    -- Verifica se o cozinheiro existe
    IF EXISTS (SELECT 1 FROM restaurante.Cozinheiro WHERE CPF = p_CPF) THEN
        -- Atualiza a especialidade
        UPDATE restaurante.Cozinheiro
        SET Especialidade = p_NovaEspecialidade
        WHERE CPF = p_CPF;
    ELSE
        SELECT 'Cozinheiro não encontrado.' AS Mensagem;
    END IF;
END //

DELIMITER ;
/* exemplo de uso */
CALL AtualizarEspecialidade('11111111111', 'Comida Italiana');

/* Este procedimento recebe o nome, tipo e valor de um novo item como parâmetros de entrada e insere esse item na tabela ItemDoMenu. */
DELIMITER //
CREATE PROCEDURE InserirNovoItemNoMenu(
    IN p_NomeItem VARCHAR(50),
    IN p_Peso INT,
    IN p_Valor DECIMAL(5,2),
    IN p_TipoItem VARCHAR(20),
    IN p_CPF_Cozinheiro VARCHAR(11)
)
BEGIN
    INSERT INTO restaurante.ItemDoMenu (Nome, Peso, Valor, Tipo, CPF_Cozinheiro)
    VALUES (p_NomeItem, p_Peso, p_Valor, p_TipoItem, p_CPF_Cozinheiro);
END //
DELIMITER ;

/* exemplo de uso */
CALL InserirNovoItemNoMenu('Salmão Grelhado', 400, 45.99, 'Principal', '11111111111');

