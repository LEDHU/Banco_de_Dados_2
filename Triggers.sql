-- Triggers
-- Trigger para mover vendedor para funcionário especial e calcular bônus
DELIMITER //
CREATE TRIGGER VendedorEspecial AFTER INSERT ON venda
FOR EACH ROW
BEGIN
    DECLARE total_vendas DECIMAL(10, 2);
    DECLARE bonus DECIMAL(10, 2);

    SELECT SUM(p.valor)
    INTO total_vendas
    FROM venda v
    JOIN produto p ON v.id = p.id
    WHERE v.id_vendedor = NEW.id_vendedor;

    IF total_vendas > 1000.00 THEN
        SELECT salario INTO bonus FROM funcionario WHERE id = NEW.id_vendedor;
        SET bonus = total_vendas * 0.05;
        UPDATE funcionario SET salario = salario + bonus WHERE id = NEW.id_vendedor;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = CONCAT('Bônus salarial necessário: ', bonus);
    END IF;
END //
DELIMITER ;

-- Trigger para adicionar cliente à tabela de clientes especiais e calcular cashback
DELIMITER //
CREATE TRIGGER ClienteEspecial AFTER INSERT ON venda
FOR EACH ROW
BEGIN
    DECLARE total_compras DECIMAL(10, 2);
    DECLARE cashback DECIMAL(10, 2);

    SELECT SUM(p.valor)
    INTO total_compras
    FROM venda v
    JOIN produto p ON v.id = p.id
    WHERE v.id_cliente = NEW.id_cliente;

    IF total_compras > 500.00 THEN
        SET cashback = total_compras * 0.02;
        INSERT INTO clienteespecial (nome, sexo, idade, id_cliente, cashback)
        SELECT nome, sexo, idade, id, cashback FROM cliente WHERE id = NEW.id_cliente;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = CONCAT('Valor necessário para cashback: ', cashback);
    END IF;
END //
DELIMITER ;

-- Trigger para remover cliente da tabela de clientes especiais quando o cashback é zerado
DELIMITER //
CREATE TRIGGER RemoverClienteEspecial BEFORE UPDATE ON clienteespecial
FOR EACH ROW
BEGIN
    IF NEW.cashback = 0 THEN
        DELETE FROM clienteespecial WHERE id = OLD.id;
    END IF;
END //
DELIMITER ;