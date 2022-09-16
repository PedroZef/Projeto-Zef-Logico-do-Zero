INSERT INTO Cliente (id, Nome, Telefone, Email) VALUES ('1', 'Manoel Wosvaldo da Mota', '(74)9951.9880', 'manoel@wosvaldo.com');
INSERT INTO Cliente (id, Nome, Telefone, Email) VALUES ('2', 'Nicole Jéssica', '(86)98150.4239', 'nicole@jessica.com');
INSERT INTO Cliente (id, Nome, Telefone, Email) VALUES ('3', 'Liza Mariana Mirella', '(31)91132.0658', 'liza@mariana.com');
INSERT INTO Cliente (id, Nome, Telefone, Email) VALUES ('4','Luana Caleber Ramos', '(12)3934-6780', 'luana@calebe.com');
INSERT INTO Cliente (id, Nome, Telefone, Email) VALUES ('5','Manoel Wosvaldo da Mota LTDA.', '(83)85364-5010', 'manoel@wosvaldo.com');

INSERT INTO StatusOrdemServico (id, Identificacao) VALUES ('1','ABERTO');
INSERT INTO StatusOrdemServico (id, Identificacao) VALUES ('2','EM ANDAMENTO');
INSERT INTO StatusOrdemServico (id, Identificacao) VALUES ('3','EM PAUSA');
INSERT INTO StatusOrdemServico (id, Identificacao) VALUES ('4','CANCELADO');
INSERT INTO StatusOrdemServico (id, Identificacao) VALUES ('5','CONCLUÍDO');

INSERT INTO OrdemServico (id, idCliente, idStatusOrdemServico, Codigo, DataEmissao, DataParaConclusao, Valor, DataAutorizacao, Obs) VALUES ('1',1, 1, '0000000001', '2022-09-09', null, 250, '2022-09-08', null);
INSERT INTO OrdemServico (id, idCliente, idStatusOrdemServico, Codigo, DataEmissao, DataParaConclusao, Valor, DataAutorizacao, Obs) VALUES ('2',2, 1, '0000000002', '2022-09-10', null, 123, '2022-09-08', null);

INSERT INTO Marca (id, Identificacao) VALUES ('1','Ford');
INSERT INTO Marca (id, Identificacao) VALUES ('2','Renault');
INSERT INTO Marca (id, Identificacao) VALUES ('3','Volkswagen');
INSERT INTO Marca (id, Identificacao) VALUES ('4', 'Fiat');

INSERT INTO Modelo (id, idMarca, Identificacao, Ano) VALUES ('1', 1, 'KA', 2015);
INSERT INTO Modelo (id, idMarca, Identificacao, Ano) VALUES (2', 1, 'Fiesta', 2013);
INSERT INTO Modelo (id, idMarca, Identificacao, Ano) VALUES ('3', 2, 'Gol', 2015);
INSERT INTO Modelo (id, idMarca, Identificacao, Ano) VALUES ('4', 3, 'Fiat', 2010);

INSERT INTO Equipe (id, Identificacao) VALUES ('1', 'Borracharia');
INSERT INTO Equipe (id, Identificacao) VALUES ('2', 'Pintura');
INSERT INTO Equipe (id, Identificacao) VALUES ('3', 'Funilaria');
INSERT INTO Equipe (id, Identificacao) VALUES ('4', 'Mecanica');
INSERT INTO Equipe (id, Identificacao) VALUES ('5', 'Elétrica');

INSERT INTO StatusServico (id, Identificacao) VALUES ('1', 'A FAZER');
INSERT INTO StatusServico (id, Identificacao) VALUES ('2', 'FAZENDO');
INSERT INTO StatusServico (id, Identificacao) VALUES ('5','AGUARANDO PEÇA');
INSERT INTO StatusServico (id, Identificacao) VALUES ('4','CANCELADO');
INSERT INTO StatusServico (id, Identificacao) VALUES ( 7, 'CONCLUÍDO');

INSERT INTO TabelaServico (id, Identificacao, ValorTabela) VALUES ('5', 'Pintura geral', 2000);
INSERT INTO TabelaServico (id, Identificacao, ValorTabela) VALUES ('3', 'Troca do motor', 1500);
INSERT INTO TabelaServico (id, Identificacao, ValorTabela) VALUES ('2', 'Troca de lampada do farol', 30);
INSERT INTO TabelaServico (id, Identificacao, ValorTabela) VALUES ('1', 'Troca de pneu', 50);
INSERT INTO TabelaServico (id, Identificacao, ValorTabela) VALUES ('4', 'Alinhamento', 50);

INSERT INTO Veiculo (id, idOrdemServico, idModelo, Cor, Placa) VALUES (0, 1, 1, 250025, 2015);
INSERT INTO Veiculo (id, idOrdemServico, idModelo, Cor, Placa) VALUES (1, 1, 2, 250025, 2013);
INSERT INTO Veiculo (id, idOrdemServico, idModelo, Cor, Placa) VALUES (2, 3, 3, 250025, 2015);
INSERT INTO Veiculo (id, idOrdemServico, idModelo, Cor, Placa) VALUES (4, 3, 4, 250025, 2010);

INSERT INTO Servico (id, idVeiculo, idTabelaServico, idEquipe, idStatusServico, Descricao, ValorPecas, ValorMaoDeObra, DataInicio, DataTermino) VALUES (0, 1, 1, 1, 1, 'Trocar Pneu', 0, 50, '2022-09-10', '2022-09-10');
INSERT INTO Servico (id, idVeiculo, idTabelaServico, idEquipe, idStatusServico, Descricao, ValorPecas, ValorMaoDeObra, DataInicio, DataTermino) VALUES (1, 2, 2, 2, 2, 'Instalar som', 1500, 250, '2022-09-10', '2022-09-10');
INSERT INTO Servico (id, idVeiculo, idTabelaServico, idEquipe, idStatusServico, Descricao, ValorPecas, ValorMaoDeObra, DataInicio, DataTermino) VALUES (2, 3, 3, 3, 3, 'Trocar palamala', 1000, 300, '2022-09-10', '2022-09-10');
INSERT INTO Servico (id, idVeiculo, idTabelaServico, idEquipe, idStatusServico, Descricao, ValorPecas, ValorMaoDeObra, DataInicio, DataTermino) VALUES (3, 4, 4, 4, 4, 'Consertar motor', 100, 1000, '2022-09-10', '2022-09-10');

INSERT INTO Especialidade (id, Identificacao) VALUES (0, 'Trocar Pneu');
INSERT INTO Especialidade (id, Identificacao) VALUES (1, 'Pintar');
INSERT INTO Especialidade (id, Identificacao) VALUES (2, 'Lixar');
INSERT INTO Especialidade (id, Identificacao) VALUES (3, 'Mecanica Hidráulico');
INSERT INTO Especialidade (id, Identificacao) VALUES (4, 'Instalar som');

INSERT INTO Mecanico (id, idEspecialidade, idEquipe, Codigo, Nome, CEP, Logradouro, Numero,	Complemento) VALUES (0, 1, 1, 'JÃO', 'Antonio da Silva', '00000-000', 'Rua..', 'S/N', null);
INSERT INTO Mecanico (id, idEspecialidade, idEquipe, Codigo, Nome, CEP, Logradouro, Numero,	Complemento) VALUES (1, 2, 2, 'Zef', 'Pedro da Silva', '00000-000', 'Rua..', 'S/N', null);
INSERT INTO Mecanico (id, idEspecialidade, idEquipe, Codigo, Nome, CEP, Logradouro, Numero,	Complemento) VALUES (2, 3, 3, 'Bora Bill!', 'Bora Bill!', '00000-000', 'Rua..', 'S/N', null);
INSERT INTO Mecanico (id, idEspecialidade, idEquipe, Codigo, Nome, CEP, Logradouro, Numero,	Complemento) VALUES (3, 4, 4, 'Fil do Bill', 'Fil do Bill', '00000-000', 'Rua..', 'S/N', null);

INSERT INTO Peca (id, Identificacao, ValorReferencia) VALUES (100, 'Tinta Galão', 150);
INSERT INTO Peca (id, Identificacao, ValorReferencia) VALUES (200, 'Óloe 1lt', 40);
INSERT INTO Peca (id, Identificacao, ValorReferencia) VALUES (300, 'Lâmpada do farol', 30);
INSERT INTO Peca (id, Identificacao, ValorReferencia) VALUES (400, 'Pneu', 450);
INSERT INTO Peca (id, Identificacao, ValorReferencia) VALUES (500, 'Filtro de óleo', 50);

INSERT INTO ServicoPeca (id, idServico, idPeca, ValorPeca) VALUES (0, 1, 100, 50);
INSERT INTO ServicoPeca (id, idServico, idPeca, ValorPeca) VALUES (1, 2, 200, 50);
INSERT INTO ServicoPeca (id, idServico, idPeca, ValorPeca) VALUES (4, 3, 300, 50);
INSERT INTO ServicoPeca (id, idServico, idPeca, ValorPeca) VALUES (5, 4, 400, 50);
