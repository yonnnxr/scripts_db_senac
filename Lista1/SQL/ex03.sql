

CREATE TABLE USUARIO (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255),
    Curso VARCHAR(100),
    DataInicioCurso DATE,
    DataFimCurso DATE,
    TipoUsuario ENUM('Aluno', 'Professor', 'Funcionário') NOT NULL
);

CREATE TABLE LINGUA (
    ID_Lingua INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE MIDIA (
    ID_Midia INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE OBRA (
    ID_Obra INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(255) NOT NULL,
    Classificacao VARCHAR(100),
    ID_Lingua INT NOT NULL,
    ID_Midia INT NOT NULL,
    FOREIGN KEY (ID_Lingua) REFERENCES LINGUA(ID_Lingua),
    FOREIGN KEY (ID_Midia) REFERENCES MIDIA(ID_Midia)
);

CREATE TABLE AUTOR (
    ID_Autor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Nacionalidade VARCHAR(100)
);

CREATE TABLE EDITORA (
    ID_Editora INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE EXEMPLAR (
    ID_Exemplar INT PRIMARY KEY AUTO_INCREMENT,
    ISBN VARCHAR(20) UNIQUE,
    AnoEdicao INT,
    ID_Obra INT NOT NULL,
    ID_Editora INT NOT NULL,
    FOREIGN KEY (ID_Obra) REFERENCES OBRA(ID_Obra),
    FOREIGN KEY (ID_Editora) REFERENCES EDITORA(ID_Editora)
);

CREATE TABLE OBRA_AUTOR (
    ID_Obra INT NOT NULL,
    ID_Autor INT NOT NULL,
    PRIMARY KEY (ID_Obra, ID_Autor),
    FOREIGN KEY (ID_Obra) REFERENCES OBRA(ID_Obra),
    FOREIGN KEY (ID_Autor) REFERENCES AUTOR(ID_Autor)
);

CREATE TABLE EMPRESTIMO (
    ID_Emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    DataEmprestimo DATE NOT NULL,
    DataDevolucaoPrevista DATE NOT NULL,
    DataDevolucaoReal DATE,
    ID_Usuario INT NOT NULL,
    ID_Exemplar INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES USUARIO(ID_Usuario),
    FOREIGN KEY (ID_Exemplar) REFERENCES EXEMPLAR(ID_Exemplar)
);