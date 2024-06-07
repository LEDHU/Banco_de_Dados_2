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
