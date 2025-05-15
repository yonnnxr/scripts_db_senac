CREATE TABLE Curso (
    id SERIAL PRIMARY KEY,
    sigla VARCHAR(10) NOT NULL,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Professor (
    matricula VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Turma (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL,
    nome VARCHAR(100),
    periodo VARCHAR(20),
    turno VARCHAR(20),
    curso_id INT REFERENCES Curso(id),
    professor_matricula VARCHAR(20) REFERENCES Professor(matricula)
);

CREATE TABLE Aluno (
    matricula VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE DiarioClasse (
    id SERIAL PRIMARY KEY,
    turma_id INT REFERENCES Turma(id),
    mes INT NOT NULL,
    ano INT NOT NULL
);

CREATE TABLE AlunoTurma (
    id SERIAL PRIMARY KEY,
    aluno_matricula VARCHAR(20) REFERENCES Aluno(matricula),
    turma_id INT REFERENCES Turma(id)
);

CREATE TABLE Frequencia (
    id SERIAL PRIMARY KEY,
    aluno_turma_id INT REFERENCES AlunoTurma(id),
    data DATE NOT NULL,
    status CHAR(1) CHECK (status IN ('P', 'F'))
);
