CREATE TABLE Departamento (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Empregado (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    departamento_id INT REFERENCES Departamento(id)
);

CREATE TABLE FuncaoDepartamento (
    id SERIAL PRIMARY KEY,
    empregado_id INT REFERENCES Empregado(id),
    departamento_id INT REFERENCES Departamento(id),
    funcao VARCHAR(50),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Projeto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    area VARCHAR(100),
    departamento_id INT REFERENCES Departamento(id),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Fase (
    id SERIAL PRIMARY KEY,
    projeto_id INT REFERENCES Projeto(id),
    nome VARCHAR(100),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Alocacao (
    id SERIAL PRIMARY KEY,
    empregado_id INT REFERENCES Empregado(id),
    projeto_id INT REFERENCES Projeto(id),
    fase_id INT REFERENCES Fase(id),
    funcao VARCHAR(100),
    data_inicio DATE,
    data_fim DATE
);
