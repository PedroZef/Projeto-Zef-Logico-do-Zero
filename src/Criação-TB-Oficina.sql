CREATE DATABASE OFICINA;

USE OFICINA;

CREATE TABLE Cliente (
	id INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Telefone VARCHAR(25) NOT NULL,
	Email VARCHAR(100),
	CONSTRAINT pk_Cliente_id PRIMARY KEY (id)
);

CREATE TABLE StatusOrdemServico (
	id INT NOT NULL ,
	Identificacao VARCHAR(45) NOT NULL,
	CONSTRAINT unique_StatusOrdemServico_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_StatusOrdemServico_id PRIMARY KEY (id)
);

CREATE TABLE OrdemServico (
	id INT NOT NULL ,
	idCliente INT NOT NULL,
	idStatusOrdemServico INT NOT NULL,
	Codigo VARCHAR(10) NOT NULL,
	DataEmissao DATETIME NOT NULL,
	DataParaConclusao DATETIME,
	Valor DECIMAL(18,2),
	DataAutorizacao DATETIME,
	Obs TEXT,
	CONSTRAINT unique_OrdemServico_Codigo UNIQUE (Codigo),
	CONSTRAINT pk_OrdemServico_id PRIMARY KEY (id),
	CONSTRAINT fk_OrdemServico_idCliente_Cliente_id FOREIGN KEY (idCliente) REFERENCES Cliente(id),
	CONSTRAINT fk_OrdemServico_idStatusOrdemServico_StatusOrdemServico_id FOREIGN KEY (idStatusOrdemServico) REFERENCES StatusOrdemServico(id)
);

CREATE TABLE Marca (
	id INT NOT NULL ,
	Identificacao VARCHAR(45) NOT NULL,
	CONSTRAINT unique_Marca_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_Marca_id PRIMARY KEY (id)
);

CREATE TABLE Modelo (
	id INT NOT NULL ,
	idMarca INT NOT NULL,
	Identificacao VARCHAR(45) NOT NULL,
	Ano INT NOT NULL,
	CONSTRAINT unique_Modelo_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_Modelo_id PRIMARY KEY (id),
	CONSTRAINT fk_Modelo_idMarca_Marca_id FOREIGN KEY (idMarca) REFERENCES Marca(id)
);

CREATE TABLE Equipe (
	id INT NOT NULL ,
	Identificacao VARCHAR(45) NOT NULL,
	CONSTRAINT unique_Equipe_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_Equipe_id PRIMARY KEY (id)
);

CREATE TABLE StatusServico (
	id INT NOT NULL ,
	Identificacao VARCHAR(45) NOT NULL,
	CONSTRAINT unique_StatusServico_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_StatusServico_id PRIMARY KEY (id)
);

CREATE TABLE TabelaServico (
	id INT NOT NULL,
	Identificacao VARCHAR(100) NOT NULL,
	ValorTabela DECIMAL(18,2),
	CONSTRAINT unique_TabelaServico_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_TabelaServico_id PRIMARY KEY (id)
);

CREATE TABLE Veiculo (
	id INT NOT NULL,
	idOrdemServico INT NOT NULL,
	idModelo INT NOT NULL,
	Cor INT NOT NULL,
	Placa VARCHAR(20),
	CONSTRAINT pk_Veiculo_id PRIMARY KEY (id),
	CONSTRAINT fk_Veiculo_idOrdemServico_OrdemServico_id FOREIGN KEY (idOrdemServico) REFERENCES OrdemServico(id),
	CONSTRAINT fk_Veiculo_idModelo_Modelo_id FOREIGN KEY (idModelo) REFERENCES Modelo(id)
);

CREATE TABLE Servico (
	id INT NOT NULL ,
	idVeiculo INT NOT NULL,
	idTabelaServico INT NOT NULL,
	idEquipe INT NOT NULL,
	idStatusServico INT NOT NULL,
	Descricao TEXT NOT NULL,
	ValorPecas DECIMAL(18,2) NOT NULL,
	ValorMaoDeObra DECIMAL(18,2) NOT NULL,
	DataInicio DATETIME,
	DataTermino DATETIME,
	CONSTRAINT pk_Servico_id PRIMARY KEY (id),
	CONSTRAINT fk_Servico_idVeiculo_Veiculo_id FOREIGN KEY (idVeiculo) REFERENCES Veiculo(id),
	CONSTRAINT fk_Servico_idTabelaServico_TabelaServico_id FOREIGN KEY (idTabelaServico) REFERENCES TabelaServico(id),
	CONSTRAINT fk_Servico_idEquipe_Equipe_id FOREIGN KEY (idEquipe) REFERENCES Equipe(id),
	CONSTRAINT fk_Servico_idStatusServico_StatusServico_id FOREIGN KEY (idStatusServico) REFERENCES StatusServico(id)
);

CREATE TABLE Especialidade (
	id INT NOT NULL,
	Identificacao VARCHAR(45) NOT NULL,
	CONSTRAINT unique_Especialidade_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_Especialidade_id PRIMARY KEY (id)
);

CREATE TABLE Mecanico (
	id INT NOT NULL,
	idEspecialidade INT NOT NULL,
	idEquipe INT NOT NULL,
	Codigo VARCHAR(45) NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	CEP VARCHAR(10) NOT NULL,
	Logradouro VARCHAR(150) NOT NULL,
	Numero VARCHAR(10) NOT NULL,
	Complemento VARCHAR(10),
	CONSTRAINT unique_Mecanico_Codigo UNIQUE (Codigo),
	CONSTRAINT pk_Mecanico_id PRIMARY KEY (id),
	CONSTRAINT fk_Mecanico_idEspecialidade_Especialidade_id FOREIGN KEY (idEspecialidade) REFERENCES Especialidade(id),
	CONSTRAINT fk_Mecanico_idEquipe_Equipe_id FOREIGN KEY (idEquipe) REFERENCES Equipe(id)
);

CREATE TABLE Peca (
	id INT NOT NULL,
	Identificacao VARCHAR(45) NOT NULL,
	ValorReferencia DECIMAL(18,2) NOT NULL,
	CONSTRAINT unique_Peca_Identificacao UNIQUE (Identificacao),
	CONSTRAINT pk_Peca_id PRIMARY KEY (id)
);

CREATE TABLE ServicoPeca (
	id INT NOT NULL,
	idServico INT NOT NULL,
	idPeca INT NOT NULL,
	ValorPeca DECIMAL(18,2) NOT NULL,
	CONSTRAINT pk_ServicoPeca_id PRIMARY KEY (id),
	CONSTRAINT fk_ServicoPeca_idServico_Servico_id FOREIGN KEY (idServico) REFERENCES Servico(id),
	CONSTRAINT fk_ServicoPeca_idPeca_Peca_id FOREIGN KEY (idPeca) REFERENCES Peca(id)
);

show databases;


