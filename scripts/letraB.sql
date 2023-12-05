# Letra B - Trabalho

# Exemplo 01 - Adicionar uma coluna nova à tabela existente
ALTER TABLE restaurante.Pessoa
ADD COLUMN Email VARCHAR(50);

# Exemplo 02 - Modificação do tipo de dado de uma coluna
ALTER TABLE restaurante.Mesa
MODIFY COLUMN Capacidade INT(5);

# Exemplo 03 - Remover uma coluna
ALTER TABLE restaurante.Funcionario
DROP COLUMN Salario;

# Criação de tabela nova apenas para exemplificação do uso do drop de tabelas
CREATE TABLE IF NOT EXISTS restaurante.Exemplo(
	`idExemplo` INT AUTO_INCREMENT,
    `DescricaoExemplo`  VARCHAR(100) NOT NULL,
    PRIMARY KEY (`idExemplo`)
);

DROP TABLE IF EXISTS restaurante.ExemploExtra;
