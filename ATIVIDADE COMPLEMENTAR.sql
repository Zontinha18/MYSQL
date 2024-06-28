DROP DATABASE IF EXISTS Zontinha_Oficina;

CREATE DATABASE Zontinha_Oficina;

USE Zontinha_Oficina;

CREATE TABLE Cliente (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE Automovel (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Placa VARCHAR(50) NOT NULL,
    Marca VARCHAR(20) NOT NULL,
    Modelo VARCHAR(20) NOT NULL,
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

-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (Nome, Email) VALUES 
('Mauricio Stalone', 'mauricio@top.com.br'),
('Matheus Toretto', 'matheus@lascou.com.br'),
('Weslen Sampaio', 'weslen@safadao.com.br');

-- Inserção de dados na tabela Automovel
INSERT INTO Automovel (Placa, Marca, Modelo, Ano, ClienteId) VALUES
('ABC1234', 'Chevrolet', 'Prisma', 2018, 1),
('DEF5678', 'Ford', 'EcoSport', 2017, 2),
('GHI9012', 'Volvo', 'FH 540', 2014, 3);

-- Inserção de dados na tabela Servico
INSERT INTO Servico (DescricaoServico, DataAtendimento, AutomovelId) VALUES
('Troca de pistão', '2024-06-15', 1),
('Reparo de freios', '2024-08-20', 2),
('Balanceamento e alinhamento', '2024-10-28', 3),
('Manutenção preventiva', '2024-10-10', 1),
('Troca de pneus', '2024-02-05', 1);

-- Consulta para encontrar o cliente com mais atendimentos
SELECT c.Nome AS Cliente, COUNT(s.Id) AS TotalAtendimentos
FROM Cliente c
JOIN Automovel a ON c.Id = a.ClienteId
JOIN Servico s ON a.Id = s.AutomovelId
GROUP BY c.Nome
ORDER BY TotalAtendimentos DESC
LIMIT 1;

-- Consulta para contar os tipos de veículos
SELECT a.Marca, COUNT(*) AS TotalVeiculos
FROM Automovel a
GROUP BY a.Marca
ORDER BY TotalVeiculos DESC;
