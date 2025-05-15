CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Fornecedor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Servico (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    fornecedor_id INT REFERENCES Fornecedor(id),
    tipo VARCHAR(50)
);

CREATE TABLE Pedido (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES Cliente(id),
    data DATE,
    modalidade_pagamento VARCHAR(50)
);

CREATE TABLE PedidoServico (
    id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES Pedido(id),
    servico_id INT REFERENCES Servico(id),
    valor NUMERIC(10,2)
);

CREATE TABLE OrdemPagamento (
    id SERIAL PRIMARY KEY,
    servico_id INT REFERENCES Servico(id),
    valor NUMERIC(10,2),
    data DATE
);

CREATE TABLE Cobranca (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES Cliente(id),
    data_vencimento DATE,
    valor NUMERIC(10,2),
    pago BOOLEAN
);
