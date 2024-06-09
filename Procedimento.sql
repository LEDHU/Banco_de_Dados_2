-- Procedimentos
-- Procedimento de reajuste salarial
DELIMITER //
CREATE PROCEDURE ReajusteSalario(IN percentual DECIMAL(5, 2), IN categoria ENUM('vendedor', 'gerente', 'CEO'))
BEGIN
    UPDATE funcionario
    SET salario = salario + (salario * (percentual / 100))
    WHERE cargo = categoria;
END //
DELIMITER ;

-- Procedimento de sorteio
DELIMITER //
CREATE PROCEDURE SorteioCliente()
BEGIN
    DECLARE cliente_id INT;
    DECLARE is_especial BOOLEAN;

    SELECT id INTO cliente_id
    FROM cliente
    ORDER BY RAND()
    LIMIT 1;

    SELECT COUNT(*) INTO is_especial
    FROM clienteespecial
    WHERE id_cliente = cliente_id;

    IF is_especial THEN
        INSERT INTO produto (nome, quantidade, descricao, valor)
        VALUES ('Voucher', 1, 'Voucher de 200 reais', 200.00);
    ELSE
        INSERT INTO produto (nome, quantidade, descricao, valor)
        VALUES ('Voucher', 1, 'Voucher de 100 reais', 100.00);
    END IF;
END //
DELIMITER ;

-- Procedimento de venda
DELIMITER //
CREATE PROCEDURE RegistrarVenda(IN vendedor_id INT, IN cliente_id INT, IN produto_id INT, IN data_venda DATE)
BEGIN
    INSERT INTO venda (id_vendedor, id_cliente, data) VALUES (vendedor_id, cliente_id, data_venda);
    UPDATE produto SET quantidade = quantidade - 1 WHERE id = produto_id;
END //
DELIMITER ;

-- Procedimento de estatísticas
DELIMITER //
CREATE PROCEDURE Estatisticas()
BEGIN
    SELECT p.nome AS produto_mais_vendido, COUNT(v.id) AS total_vendas
    FROM produto p
    JOIN venda v ON p.id = v.id
    GROUP BY p.id
    ORDER BY total_vendas DESC
    LIMIT 1;

    SELECT f.nome AS vendedor_mais_vendido
    FROM funcionario f
    JOIN venda v ON f.id = v.id_vendedor
    JOIN (SELECT p.id FROM produto p
          JOIN venda v ON p.id = v.id
          GROUP BY p.id
          ORDER BY COUNT(v.id) DESC
          LIMIT 1) AS p_max ON v.id = p_max.id
    GROUP BY f.id
    ORDER BY COUNT(v.id) DESC
    LIMIT 1;

    SELECT p.nome AS produto_menos_vendido, COUNT(v.id) AS total_vendas
    FROM produto p
    JOIN venda v ON p.id = v.id
    GROUP BY p.id
    ORDER BY total_vendas ASC
    LIMIT 1;

    SELECT p.nome, SUM(p.valor) AS valor_ganho
    FROM produto p
    JOIN venda v ON p.id = v.id
    GROUP BY p.id
    ORDER BY SUM(p.valor) DESC
    LIMIT 1;

    SELECT p.nome, MONTH(v.data) AS mes_maior_venda, COUNT(v.id) AS total_vendas
    FROM produto p
    JOIN venda v ON p.id = v.id
    GROUP BY p.id, MONTH(v.data)
    ORDER BY COUNT(v.id) DESC
    LIMIT 1;

    SELECT p.nome, MONTH(v.data) AS mes_menor_venda, COUNT(v.id) AS total_vendas
    FROM produto p
    JOIN venda v ON p.id = v.id
    GROUP BY p.id, MONTH(v.data)
    ORDER BY COUNT(v.id) ASC
    LIMIT 1;

    SELECT p.nome, SUM(p.valor) AS valor_ganho
    FROM produto p
    JOIN venda v ON p.id = v.id
    GROUP BY p.id
    ORDER BY SUM(p.valor) ASC
    LIMIT 1;

    SELECT p.nome, MONTH(v.data) AS mes_maior_venda, COUNT(v.id) AS total_vendas
    FROM produto p
    JOIN venda v ON p.id = v.id
    GROUP BY p.id, MONTH(v.data)
    ORDER BY COUNT(v.id) DESC
    LIMIT 1;

    SELECT p.nome, MONTH(v.data) AS mes_menor_venda, COUNT(v.id) AS total_vendas
    FROM produto p
    JOIN venda v ON p.id = v.id
    GROUP BY p.id, MONTH(v.data)
    ORDER BY COUNT(v.id) ASC
    LIMIT 1;
END //
DELIMITER ;