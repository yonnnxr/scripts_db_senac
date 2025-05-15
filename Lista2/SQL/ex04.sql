CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    tipo VARCHAR(20)
);

CREATE TABLE Veiculo (
    id SERIAL PRIMARY KEY,
    placa VARCHAR(10),
    usuario_id INT REFERENCES Usuario(id)
);

CREATE TABLE Estacionamento (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Acesso (
    id SERIAL PRIMARY KEY,
    veiculo_id INT REFERENCES Veiculo(id),
    usuario_id INT REFERENCES Usuario(id),
    estacionamento_id INT REFERENCES Estacionamento(id),
    data_hora_entrada TIMESTAMP,
    data_hora_saida TIMESTAMP
);
