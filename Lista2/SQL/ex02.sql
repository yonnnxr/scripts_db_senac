CREATE TABLE Pais (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Equipe (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    pais_id INT REFERENCES Pais(id)
);

CREATE TABLE Piloto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    nacionalidade_id INT REFERENCES Pais(id),
    equipe_id INT REFERENCES Equipe(id)
);

CREATE TABLE Campeonato (
    id SERIAL PRIMARY KEY,
    ano INT NOT NULL
);

CREATE TABLE GrandePremio (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    pais_id INT REFERENCES Pais(id),
    campeonato_id INT REFERENCES Campeonato(id)
);

CREATE TABLE Participacao (
    id SERIAL PRIMARY KEY,
    piloto_id INT REFERENCES Piloto(id),
    gp_id INT REFERENCES GrandePremio(id),
    pontos INT NOT NULL
);
