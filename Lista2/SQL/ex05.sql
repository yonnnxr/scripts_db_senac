CREATE TABLE Loja (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Empregado (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    loja_id INT REFERENCES Loja(id)
);

CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE NotaFiscal (
    id SERIAL PRIMARY KEY,
    numero VARCHAR(20),
    cliente_id INT REFERENCES Cliente(id),
    empregado_id INT REFERENCES Empregado(id),
    data_emissao DATE,
    valor_total NUMERIC(10,2)
);

CREATE TABLE Material (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE ItemNota (
    id SERIAL PRIMARY KEY,
    nota_id INT REFERENCES NotaFiscal(id),
    material_id INT REFERENCES Material(id),
    quantidade INT,
    valor_unitario NUMERIC(10,2),
    valor_total NUMERIC(10,2)
);
