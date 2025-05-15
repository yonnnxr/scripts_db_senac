CREATE TABLE Associado (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Hospital (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Internacao (
    id SERIAL PRIMARY KEY,
    associado_id INT REFERENCES Associado(id),
    hospital_id INT REFERENCES Hospital(id),
    tipo VARCHAR(20),
    data_inicio DATE,
    data_fim DATE
);
