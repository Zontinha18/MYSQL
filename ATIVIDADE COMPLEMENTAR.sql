DROP DATABASE Zontinha_Oficina;

CREATE DATABASE Zontinha_Oficina;

USE Zontinha_Oficina;


CREATE TABLE Cliente (

Id INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR (100) NOT NULL,
Email VARCHAR (100) NOT NULL

);

CREATE TABLE Automovel (

Id INT PRIMARY KEY AUTO_INCREMENT,
Placa VARCHAR (50) NOT NULL,
Marca VARCHAR (20) NOT NULL,
Modelo VARCHAR (20) NOT NULL,
Ano INT NOT NULL,

ClienteId INT,
FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)

);

CREATE TABLE Servico (

Id INT PRIMARY KEY AUTO_INCREMENT,
DataAtendimento DATE NOT NULL,
DescricaoServico TEXT,
AutomovelId INT,
FOREIGN KEY (AutomovelId) REFERENCES Automovel(Id)

);

-- Tabela Cliente
INSERT INTO Cliente (nome,Email) VALUES 

('Mauricio Stalone', 'mauricio@top.com.br'),
('Matheus toretto', 'matheus@lascou.com.br' ),
('Weslen Sampaio', 'weslen@safadao.com.br');

-- Tabela Veículos
INSERT INTO Veiculos (veiculo_id, cliente_id, tipo, marca, modelo, ano) VALUES

('Sedan','Mauricio', 'Chevrolet', 'Prisma', '1840' ),
('SUV','Matheus', 'Ford', 'EcoSport', '1970'),
('Caminhão','Weslen', 'Volvo', 'FH 540', 2014);

-- Tabela Serviços
INSERT INTO Servicos (servico_id, veiculo_id, descricao, data, custo) VALUES

('Troca de pistao','Sedan', '2024-06-15', 450.00),
('Reparo de freios','SUV', '2024-08-20', 950.00),
('Balanceamento e alinhamento','Caminhão', '2024-10-28', 1000.00),
('Manutenção preventiva','Sedan', '2024-10-10', 3000.00),
('Troca de pneus','Sedan' '2024-02-05', 1600.00);

SELECT c.nome AS cliente, COUNT(s.servico_id) AS total_atendimentos
FROM Clientes c

JOIN Veiculos v ON c.cliente_id = v.cliente_id
JOIN Servicos s ON v.veiculo_id = s.veiculo_id

GROUP BY c.nome
ORDER BY total_atendimentos DESC
LIMIT 1;

SELECT v.tipo, COUNT(*) AS total_veiculos
FROM Veiculos v

GROUP BY v.tipo
ORDER BY total_veiculos DESC;
















