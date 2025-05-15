CREATE TABLE Plano (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Especialidade (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE PlanoEspecialidade (
    plano_id INT REFERENCES Plano(id),
    especialidade_id INT REFERENCES Especialidade(id),
    PRIMARY KEY (plano_id, especialidade_id)
);

CREATE TABLE Medico (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    especialidade_id INT REFERENCES Especialidade(id)
);

CREATE TABLE Entidade (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Associado (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    plano_id INT REFERENCES Plano(id)
);

CREATE TABLE Dependente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    associado_id INT REFERENCES Associado(id)
);

CREATE TABLE Atendimento (
    id SERIAL PRIMARY KEY,
    medico_id INT REFERENCES Medico(id),
    associado_id INT REFERENCES Associado(id),
    data DATE,
    servico VARCHAR(100)
);

CREATE TABLE PagamentoCliente (
    id SERIAL PRIMARY KEY,
    associado_id INT REFERENCES Associado(id),
    data_vencimento DATE,
    valor NUMERIC(10,2),
    pago BOOLEAN
);

CREATE TABLE PagamentoMedico (
    id SERIAL PRIMARY KEY,
    medico_id INT REFERENCES Medico(id),
    valor NUMERIC(10,2),
    data DATE
);
