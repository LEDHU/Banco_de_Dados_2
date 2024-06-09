CREATE DATABASE Empresa;

USE Empresa;

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sexo ENUM('m', 'f', 'o') NOT NULL,
    idade INT NOT NULL,
    nascimento DATE NOT NULL
);

CREATE TABLE clienteespecial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sexo ENUM('m', 'f', 'o') NOT NULL,
    idade INT NOT NULL,
    id_cliente INT NOT NULL,
    cashback DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    sexo ENUM('m', 'f', 'o') NOT NULL,
    cargo ENUM('vendedor', 'gerente', 'CEO') NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    nascimento DATE NOT NULL
);

CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    descricao TEXT,
    valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_vendedor INT NOT NULL,
    id_cliente INT NOT NULL,
    data DATE NOT NULL,
    FOREIGN KEY (id_vendedor) REFERENCES funcionario(id),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

INSERT INTO produto (nome, quantidade, descricao, valor) VALUES
('Smartphone', 50, 'Smartphone de última geração', 2999.99),
('Notebook', 30, 'Notebook para jogos', 4999.99),
('Tablet', 40, 'Tablet com tela de 10 polegadas', 1999.99),
('Smartwatch', 60, 'Relógio inteligente com várias funções', 999.99),
('Câmera', 25, 'Câmera digital de alta resolução', 2999.99),
('Fone de Ouvido', 100, 'Fone de ouvido com cancelamento de ruído', 499.99),
('Monitor', 20, 'Monitor 4K de 27 polegadas', 1999.99),
('Teclado Mecânico', 75, 'Teclado mecânico RGB', 499.99),
('Mouse Gamer', 80, 'Mouse gamer com alta precisão', 299.99),
('Impressora', 15, 'Impressora multifuncional', 799.99),
('HD Externo', 45, 'HD externo de 1TB', 499.99),
('SSD', 50, 'SSD de 512GB', 999.99),
('Placa de Vídeo', 10, 'Placa de vídeo para jogos', 3999.99),
('Processador', 35, 'Processador de última geração', 2499.99),
('Memória RAM', 60, 'Memória RAM de 16GB', 799.99),
('Fonte de Alimentação', 40, 'Fonte de alimentação 650W', 399.99),
('Placa-Mãe', 25, 'Placa-mãe para desktop', 1099.99),
('Gabinete', 30, 'Gabinete ATX com vidro temperado', 599.99),
('Ventoinha', 70, 'Ventoinha para gabinete', 79.99),
('Cabo HDMI', 100, 'Cabo HDMI de 2 metros', 49.99);

INSERT INTO funcionario (nome, idade, sexo, cargo, salario, nascimento) VALUES
('Carlos Silva', 28, 'm', 'vendedor', 3000.00, '1995-06-15'),
('Mariana Almeida', 32, 'f', 'vendedor', 3200.00, '1991-08-22'),
('João Pereira', 45, 'm', 'gerente', 5000.00, '1978-02-12'),
('Ana Souza', 38, 'f', 'gerente', 5200.00, '1985-11-30'),
('Lucas Fernandes', 50, 'm', 'CEO', 10000.00, '1973-04-01');

INSERT INTO cliente (nome, sexo, idade, nascimento) VALUES
('Pedro Santos', 'm', 35, '1988-03-10'),
('Julia Ramos', 'f', 28, '1995-07-25'),
('Roberto Lima', 'm', 40, '1983-01-20'),
('Aline Oliveira', 'f', 31, '1992-12-05'),
('Fernando Souza', 'm', 25, '1998-09-17'),
('Camila Rocha', 'f', 22, '2001-04-18'),
('Rafael Costa', 'm', 30, '1993-11-15'),
('Larissa Mendes', 'f', 27, '1996-05-21'),
('Gabriel Silva', 'm', 33, '1990-08-09'),
('Beatriz Ferreira', 'f', 29, '1994-10-13'),
('Carlos Henrique', 'm', 26, '1997-02-10'),
('Alice Martins', 'f', 24, '1999-06-05'),
('Júlio César', 'm', 31, '1992-01-25'),
('Clara Lopes', 'f', 30, '1993-03-15'),
('Diego Albuquerque', 'm', 28, '1995-08-22'),
('Mariana Castro', 'f', 25, '1998-11-30'),
('Luís Figueira', 'm', 32, '1991-04-12'),
('Isabela Ferreira', 'f', 27, '1996-07-19'),
('Ricardo Gomes', 'm', 29, '1994-12-08'),
('Valentina Soares', 'f', 22, '2001-05-28'),
('Thiago Moreira', 'm', 34, '1989-09-03'),
('Sofia Braga', 'f', 21, '2002-11-11'),
('Arthur Silveira', 'm', 33, '1990-02-27'),
('Laura Pinto', 'f', 26, '1997-06-17'),
('Rodrigo Almeida', 'm', 28, '1995-01-30'),
('Helena Cunha', 'f', 25, '1998-04-21'),
('Gustavo Rocha', 'm', 27, '1996-07-15'),
('Luísa Martins', 'f', 23, '2000-10-05'),
('Eduardo Mendes', 'm', 31, '1992-12-18'),
('Marta Duarte', 'f', 29, '1994-09-24'),
('Vinícius Lima', 'm', 32, '1991-08-11'),
('Alice Santos', 'f', 24, '1999-02-14'),
('Henrique Ramos', 'm', 30, '1993-04-25'),
('Luana Vieira', 'f', 27, '1996-06-30'),
('André Barros', 'm', 29, '1994-01-05'),
('Lorena Dias', 'f', 22, '2001-03-28'),
('Matheus Santana', 'm', 34, '1989-11-07'),
('Juliana Teixeira', 'f', 23, '2000-05-14'),
('Fábio Costa', 'm', 28, '1995-08-23'),
('Gabriela Ribeiro', 'f', 26, '1997-12-19'),
('Lucas Correia', 'm', 30, '1993-02-08'),
('Manuela Oliveira', 'f', 25, '1998-09-27'),
('Daniel Freitas', 'm', 32, '1991-07-15'),
('Catarina Araújo', 'f', 21, '2002-11-30'),
('Renato Nogueira', 'm', 29, '1994-06-12'),
('Carolina Silva', 'f', 24, '1999-04-10'),
('Murilo Rezende', 'm', 27, '1996-03-21'),
('Bianca Melo', 'f', 26, '1997-10-19'),
('Leandro Cardoso', 'm', 31, '1992-05-09'),
('Nicole Fernandes', 'f', 23, '2000-07-26'),
('Marcelo Araújo', 'm', 30, '1993-11-16'),
('Rafaela Borges', 'f', 22, '2001-01-13'),
('Felipe Ribeiro', 'm', 28, '1995-04-23'),
('Jéssica Moraes', 'f', 24, '1999-08-17'),
('Vitor Sousa', 'm', 34, '1989-06-25'),
('Patrícia Carvalho', 'f', 27, '1996-12-14'),
('Leonardo Gonçalves', 'm', 29, '1994-10-07'),
('Amanda Lima', 'f', 25, '1998-03-29'),
('Rafael Duarte', 'm', 32, '1991-09-18'),
('Estela Vasconcelos', 'f', 22, '2001-11-27'),
('Bernardo Alves', 'm', 33, '1990-02-04'),
('Raquel Moreira', 'f', 26, '1997-06-13'),
('Murilo Mendes', 'm', 31, '1992-01-21'),
('Vivian Santos', 'f', 21, '2002-10-12'),
('Pedro Guimarães', 'm', 27, '1996-03-17'),
('Sabrina Pires', 'f', 24, '1999-08-20'),
('Guilherme Ferreira', 'm', 34, '1989-11-02'),
('Nathália Rocha', 'f', 23, '2000-05-19'),
('Thiago Fernandes', 'm', 29, '1994-07-08'),
('Clarissa Silveira', 'f', 26, '1997-02-24'),
('Renato Martins', 'm', 32, '1991-12-07'),
('Mariana Costa', 'f', 25, '1998-11-10'),
('Fernando Almeida', 'm', 31, '1992-09-15'),
('Érica Souza', 'f', 22, '2001-01-19'),
('Rodrigo Martins', 'm', 28, '1995-07-30'),
('Tainá Oliveira', 'f', 24, '1999-03-05'),
('Daniel Carvalho', 'm', 29, '1994-11-25'),
('Fernanda Vieira', 'f', 23, '2000-04-22'),
('Igor Costa', 'm', 30, '1993-06-09'),
('Carla Ferreira', 'f', 26, '1997-12-03'),
('Renato Alves', 'm', 32, '1991-10-14'),
('Vivian Gonçalves', 'f', 21, '2002-07-04'),
('Marcos Lima', 'm', 27, '1996-02-28'),
('Bruna Santos', 'f', 25, '1998-09-23'),
('Lucas Martins', 'm', 31, '1992-01-02'),
('Priscila Araújo', 'f', 23, '2000-05-25'),
('Daniel Moura', 'm', 29, '1994-12-29'),
('Amanda Teixeira', 'f', 27, '1996-10-03'),
('Alexandre Rodrigues', 'm', 32, '1991-08-14'),
('Débora Silva', 'f', 25, '1998-11-20'),
('Mauro Gomes', 'm', 34, '1989-04-11'),
('Carla Souza', 'f', 21, '2002-03-26'),
('Luis Eduardo', 'm', 25, '1998-09-23'),
('Lucas Felinto', 'm', 31, '1992-01-02'),
('Luis Gustavo', 'm', 23, '2000-05-25'),
('Daniel Moura', 'm', 29, '1994-12-29'),
('João Gabriel', 'm', 27, '1996-10-03'),
('Alexandre Rodrigues', 'm', 32, '1991-08-14'),
('Débora Silva', 'f', 25, '1998-11-20'),
('Mauro Gomes', 'm', 34, '1989-04-11');

CREATE VIEW ClienteCompras AS
SELECT c.id, c.nome, SUM(p.valor) AS total_compras
FROM cliente c
JOIN venda v ON c.id = v.id_cliente
JOIN produto p ON v.id = p.id
GROUP BY c.id, c.nome;

CREATE VIEW FuncionarioVendas AS
SELECT f.id, f.nome, SUM(p.valor) AS total_vendas
FROM funcionario f
JOIN venda v ON f.id = v.id_vendedor
JOIN produto p ON v.id = p.id
GROUP BY f.id, f.nome;

CREATE VIEW ProdutoVendas AS
SELECT p.id, p.nome, SUM(p.valor) AS total_vendido
FROM produto p
JOIN venda v ON p.id = v.id
GROUP BY p.id, p.nome;

CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'adm1234';
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'ger1234';
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'fun1234';

GRANT ALL PRIVILEGES ON BancoEDados.* TO 'administrador'@'localhost';

GRANT SELECT, UPDATE, DELETE ON BancoEDados.* TO 'gerente'@'localhost';

GRANT INSERT, SELECT ON BancoEDados.* TO 'funcionario'@'localhost';

FLUSH PRIVILEGES;