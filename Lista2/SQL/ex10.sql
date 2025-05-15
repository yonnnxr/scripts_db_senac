CREATE TABLE Condominio (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Sindico (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE FuncaoSindico (
    id SERIAL PRIMARY KEY,
    sindico_id INT REFERENCES Sindico(id),
    condominio_id INT REFERENCES Condominio(id),
    funcao VARCHAR(50),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Imovel (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(50),
    condominio_id INT REFERENCES Condominio(id)
);

CREATE TABLE Condômino (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Ocupacao (
    id SERIAL PRIMARY KEY,
    condômino_id INT REFERENCES Condômino(id),
    imovel_id INT REFERENCES Imovel(id),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Servico (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    condominio_id INT REFERENCES Condominio(id)
);

CREATE TABLE Verba (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    valor NUMERIC(10,2),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Desconto (
    id SERIAL PRIMARY KEY,
    ocupacao_id INT REFERENCES Ocupacao(id),
    percentual NUMERIC(5,2),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Pagamento (
    id SERIAL PRIMARY KEY,
    ocupacao_id INT REFERENCES Ocupacao(id),
    valor NUMERIC(10,2),
    data_vencimento DATE,
    pago BOOLEAN
);
