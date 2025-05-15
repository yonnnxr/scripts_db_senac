CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Inquilino (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Imovel (
    id SERIAL PRIMARY KEY,
    endereco VARCHAR(100),
    cliente_id INT REFERENCES Cliente(id)
);

CREATE TABLE Contrato (
    id SERIAL PRIMARY KEY,
    imovel_id INT REFERENCES Imovel(id),
    inquilino_id INT REFERENCES Inquilino(id),
    data_inicio DATE,
    data_fim DATE,
    ativo BOOLEAN
);

CREATE TABLE Pagamento (
    id SERIAL PRIMARY KEY,
    contrato_id INT REFERENCES Contrato(id),
    valor NUMERIC(10,2),
    data_vencimento DATE,
    pago BOOLEAN
);
