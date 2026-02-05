-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Ecommerce;
USE Ecommerce;

-- 1. Tabela Produto
CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Categoria VARCHAR(45) NOT NULL,
    Descricao VARCHAR(45),
    Valor VARCHAR(45)
);

-- 2. Tabela Fornecedor
CREATE TABLE Fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    CNPJ VARCHAR(45) NOT NULL,
    CONSTRAINT unique_fornecedor UNIQUE (CNPJ)
);

-- 3. Tabela Estoque
CREATE TABLE Estoque (
    idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    Local VARCHAR(45)
);

-- 4. Tabela Terceiro - Vendedor
CREATE TABLE Vendedor (
    idVendedor INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    Local VARCHAR(45),
    NomeFantasia VARCHAR(45),
    Endereco VARCHAR(45),
    CONSTRAINT unique_vendedor UNIQUE (RazaoSocial)
);

-- 5. Tabela de Relacionamento: Disponibilizando um Produto (Fornecedor e Produto)
CREATE TABLE Disponibilizando_um_produto (
    idFornecedor INT,
    idProduto INT,
    PRIMARY KEY (idFornecedor, idProduto),
    CONSTRAINT fk_disponibiliza_fornecedor FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
    CONSTRAINT fk_disponibiliza_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- 6. Tabela de Relacionamento: Produtos por Vendedor (Terceiro)
CREATE TABLE Produtos_por_Vendedor (
    idVendedor INT,
    idProduto INT,
    Quantidade INT DEFAULT 0,
    PRIMARY KEY (idVendedor, idProduto),
    CONSTRAINT fk_prod_vendedor_vendedor FOREIGN KEY (idVendedor) REFERENCES Vendedor(idVendedor),
    CONSTRAINT fk_prod_vendedor_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- 7. Tabela de Relacionamento: Produto_has_Estoque
CREATE TABLE Produto_has_Estoque (
    idProduto INT,
    idEstoque INT,
    Quantidade INT DEFAULT 0,
    PRIMARY KEY (idProduto, idEstoque),
    CONSTRAINT fk_estoque_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    CONSTRAINT fk_estoque_local FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque)
);