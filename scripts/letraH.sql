-- Criar usuário 'usuario1' com senha 'senha1'
CREATE USER 'paulo'@'localhost' IDENTIFIED BY 'abc123';

-- Criar usuário 'usuario2' com senha 'senha2'
CREATE USER 'gustavo'@'localhost' IDENTIFIED BY '321cba';
-- Conceder todas as permissões no banco de dados 'banco_exemplo' para 'usuario1'
GRANT ALL PRIVILEGES ON restaurante.* TO 'camily'@'localhost';

-- Conceder permissão de leitura no banco de dados 'banco_exemplo' para 'usuario2'
GRANT SELECT ON restaurante.* TO 'gustavo'@'localhost';

-- Recarregar as permissões
FLUSH PRIVILEGES;

-- Revogar permissão de leitura no banco de dados 'banco_exemplo' de 'usuario2'
REVOKE SELECT ON restaurante.* FROM 'gustavo'@'localhost';

-- Recarregar as permissões
FLUSH PRIVILEGES;
