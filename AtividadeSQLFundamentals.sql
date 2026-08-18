-- ============================================================
-- SCRIPT DE CRIAÇÃO DO BANCO DE DADOS E TABELAS (MS SQL SERVER)
-- Banco de Dados: EMPRESA
-- ============================================================

-- 1. Criação e Seleção do Banco de Dados
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'EMPRESA')
BEGIN
    CREATE DATABASE EMPRESA;
END;
GO

USE EMPRESA;
GO

-- ============================================================
-- 2. CRIAÇÃO DAS TABELAS
-- ============================================================

-- Tabela: DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    DNumero INT NOT NULL,
    DNome VARCHAR(50) NOT NULL,
    Gerente_CPF VARCHAR(11) NULL,
    DataInicioGerente DATE NULL,
    CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (DNumero)
);
GO

-- Tabela: FUNCIONARIO
CREATE TABLE FUNCIONARIO (
    CPF VARCHAR(11) NOT NULL,
    PNome VARCHAR(50) NOT NULL,
    SNome VARCHAR(50) NOT NULL,
    DataNasc DATE NULL,
    Salario DECIMAL(10,2) NULL,
    DNR INT NULL,
    Supervisor_CPF VARCHAR(11) NULL,
    CONSTRAINT PK_FUNCIONARIO PRIMARY KEY (CPF)
);
GO

-- Tabela: PROJETO
CREATE TABLE PROJETO (
    PNumero INT NOT NULL,
    PNome VARCHAR(100) NOT NULL,
    Localizacao VARCHAR(100) NULL,
    DNum INT NULL,
    CONSTRAINT PK_PROJETO PRIMARY KEY (PNumero)
);
GO

-- Tabela: TRABALHA_EM
CREATE TABLE TRABALHA_EM (
    F_CPF VARCHAR(11) NOT NULL,
    P_Numero INT NOT NULL,
    Horas DECIMAL(5,2) NULL,
    CONSTRAINT PK_TRABALHA_EM PRIMARY KEY (F_CPF, P_Numero)
);
GO

-- ============================================================
-- 3. ADIÇÃO DAS CHAVES ESTRANGEIRAS (FOREIGN KEYS)
-- ============================================================

-- Relacionamento: FUNCIONARIO -> DEPARTAMENTO (Pertence ao departamento - DNR)
ALTER TABLE FUNCIONARIO
ADD CONSTRAINT FK_FUNCIONARIO_DEPARTAMENTO
FOREIGN KEY (DNR) REFERENCES DEPARTAMENTO(DNumero);
GO

-- Relacionamento: FUNCIONARIO -> FUNCIONARIO (Auto-relacionamento de Supervisão)
ALTER TABLE FUNCIONARIO
ADD CONSTRAINT FK_FUNCIONARIO_SUPERVISOR
FOREIGN KEY (Supervisor_CPF) REFERENCES FUNCIONARIO(CPF);
GO

-- Relacionamento: DEPARTAMENTO -> FUNCIONARIO (Gerente do departamento)
ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT FK_DEPARTAMENTO_GERENTE
FOREIGN KEY (Gerente_CPF) REFERENCES FUNCIONARIO(CPF);
GO

-- Relacionamento: PROJETO -> DEPARTAMENTO (Departamento responsável)
ALTER TABLE PROJETO
ADD CONSTRAINT FK_PROJETO_DEPARTAMENTO
FOREIGN KEY (DNum) REFERENCES DEPARTAMENTO(DNumero);
GO

-- Relacionamento: TRABALHA_EM -> FUNCIONARIO (CPF do funcionário alocado)
ALTER TABLE TRABALHA_EM
ADD CONSTRAINT FK_TRABALHA_EM_FUNCIONARIO
FOREIGN KEY (F_CPF) REFERENCES FUNCIONARIO(CPF);
GO

-- Relacionamento: TRABALHA_EM -> PROJETO (Número do projeto)
ALTER TABLE TRABALHA_EM
ADD CONSTRAINT FK_TRABALHA_EM_PROJETO
FOREIGN KEY (P_Numero) REFERENCES PROJETO(PNumero);
GO

-- INSERINDO 60 REGISTROS NOMINAIS EM CADA TABELA

INSERT INTO DEPARTAMENTO (DNumero, DNome, Gerente_CPF, DataInicioGerente)
VALUES (1, 'Recursos Humanos', NULL, NULL),
(2, 'Tecnologia da Informação', NULL, NULL),
(3, 'Financeiro', NULL, NULL),
(4, 'Marketing', NULL, NULL),
(5, 'Vendas', NULL, NULL),
(6, 'Atendimento ao Cliente', NULL, NULL),
(7, 'Pesquisa e Desenvolvimento', NULL, NULL),
(8, 'Logística', NULL, NULL),
(9, 'Jurídico', NULL, NULL),
(10, 'Compras', NULL, NULL),
(11, 'Operações', NULL, NULL),
(12, 'Garantia de Qualidade', NULL, NULL),
(13, 'Planejamento Estratégico', NULL, NULL),
(14, 'Segurança da Informação', NULL, NULL),
(15, 'Engenharia', NULL, NULL),
(16, 'Comunicação Interna', NULL, NULL),
(17, 'Treinamento e Capacitação', NULL, NULL),
(18, 'Administrativo', NULL, NULL),
(19, 'Inteligência de Mercado', NULL, NULL),
(20, 'Inovação', NULL, NULL),
(21, 'Controladoria', NULL, NULL),
(22, 'Relações Internacionais', NULL, NULL),
(23, 'Auditoria Interna', NULL, NULL),
(24, 'Suporte Técnico', NULL, NULL),
(25, 'Infraestrutura', NULL, NULL),
(26, 'Desenvolvimento de Produtos', NULL, NULL),
(27, 'Design e UX', NULL, NULL),
(28, 'Mídias Sociais', NULL, NULL),
(29, 'Gestão de Riscos', NULL, NULL),
(30, 'Projetos Corporativos', NULL, NULL),
(31, 'Recursos Humanos - Regional SP', NULL, NULL),
(32, 'Tecnologia da Informação - Matriz', NULL, NULL),
(33, 'Financeiro - Regional Sul', NULL, NULL),
(34, 'Marketing - Regional RJ', NULL, NULL),
(35, 'Vendas - Nordeste', NULL, NULL),
(36, 'Atendimento ao Cliente - Operacional', NULL, NULL),
(37, 'Pesquisa e Desenvolvimento - Estratégico', NULL, NULL),
(38, 'Logística - Filial Norte', NULL, NULL),
(39, 'Jurídico - Corporativo', NULL, NULL),
(40, 'Compras - Regional SP', NULL, NULL),
(41, 'Operações - Filial Norte', NULL, NULL),
(42, 'Garantia de Qualidade - Operacional', NULL, NULL),
(43, 'Planejamento Estratégico - Matriz', NULL, NULL),
(44, 'Segurança da Informação - Corporativo', NULL, NULL),
(45, 'Engenharia - Regional Sul', NULL, NULL),
(46, 'Comunicação Interna - Regional RJ', NULL, NULL),
(47, 'Treinamento e Capacitação - Regional SP', NULL, NULL),
(48, 'Administrativo - Matriz', NULL, NULL),
(49, 'Inteligência de Mercado - Estratégico', NULL, NULL),
(50, 'Inovação - Internacional', NULL, NULL),
(51, 'Controladoria - Corporativo', NULL, NULL),
(52, 'Relações Internacionais - Internacional', NULL, NULL),
(53, 'Auditoria Interna - Matriz', NULL, NULL),
(54, 'Suporte Técnico - Operacional', NULL, NULL),
(55, 'Infraestrutura - Regional Sul', NULL, NULL),
(56, 'Desenvolvimento de Produtos - Estratégico', NULL, NULL),
(57, 'Design e UX - Matriz', NULL, NULL),
(58, 'Mídias Sociais - Regional RJ', NULL, NULL),
(59, 'Gestão de Riscos - Corporativo', NULL, NULL),
(60, 'Projetos Corporativos - Internacional', NULL, NULL);

INSERT INTO FUNCIONARIO (CPF, PNome, SNome, DataNasc, Salario, DNR, Supervisor_CPF)
VALUES ('10000000001', 'Daniel', 'Marques', '1989-10-25', 13247.93, 1, NULL),
('10000000002', 'Leticia', 'Lopes', '1979-05-18', 12384.44, 2, NULL),
('10000000003', 'Julia', 'Nascimento', '1998-10-24', 12799.30, 3, NULL),
('10000000004', 'Leticia', 'Rocha', '1973-10-22', 15151.75, 4, NULL),
('10000000005', 'Vanessa', 'Almeida', '1976-10-06', 7421.36, 5, NULL),
('10000000006', 'Daniele', 'Ferreira', '1987-10-18', 11132.89, 6, '10000000003'),
('10000000007', 'CRISTIANA', 'Carvalho', '1991-03-08', 5122.95, 7, '10000000004'),
('10000000008', 'Tatiane', 'Gomes', '1991-07-06', 8632.74, 8, '10000000005'),
('10000000009', 'Soraia', 'Barbosa', '1989-08-20', 17094.01, 9, '10000000002'),
('10000000010', 'Daniele', 'Andrade', '1988-06-18', 6382.72, 10, '10000000007'),
('10000000011', 'Simone', 'Pereira', '1995-10-09', 11776.47, 11, '10000000005'),
('10000000012', 'Bruna', 'Martins', '1981-12-07', 7505.74, 12, '10000000010'),
('10000000013', 'Rodrigo', 'Pinto', '1982-12-19', 18361.34, 13, '10000000001'),
('10000000014', 'Matheus', 'Barros', '2001-08-01', 13783.74, 14, '10000000006'),
('10000000015', 'Igor', 'Alves', '1974-06-25', 18274.60, 15, '10000000006'),
('10000000016', 'Carolina', 'Santos', '1990-11-20', 5062.59, 16, '10000000010'),
('10000000017', 'Fabio', 'Dias', '1977-11-19', 12389.54, 17, '10000000013'),
('10000000018', 'Thiago', 'Ribeiro', '1986-06-03', 14066.86, 18, '10000000008'),
('10000000019', 'Nathalia', 'Moraes', '1975-01-22', 15124.97, 19, '10000000018'),
('10000000020', 'Marcos', 'Freitas', '1979-05-18', 12109.92, 20, '10000000001'),
('10000000021', 'Danilo', 'Mendes', '1987-11-23', 6092.41, 21, '10000000015'),
('10000000022', 'Rafaela', 'Neves', '1985-05-16', 6485.43, 22, '10000000009'),
('10000000023', 'Luciana', 'Menezes', '1994-09-02', 10113.88, 23, '10000000003'),
('10000000024', 'Flavia', 'Silva', '1978-04-06', 4310.22, 24, '10000000022'),
('10000000025', 'Renan', 'Cardoso', '1983-08-20', 16120.93, 25, '10000000014'),
('10000000026', 'Carlos', 'Padilha', '1979-09-02', 15549.20, 26, '10000000005'),
('10000000027', 'Erick', 'Castro', '1995-12-09', 10372.24, 27, '10000000020'),
('10000000028', 'Renato', 'Lima', '1980-08-01', 12384.11, 28, '10000000001'),
('10000000029', 'Juliana', 'Teixeira', '1971-08-24', 8920.15, 29, '10000000008'),
('10000000030', 'Gisele', 'Costa', '1992-04-14', 16321.05, 30, '10000000027'),
('10000000031', 'Thais', 'Souza', '1996-03-01', 9831.50, 31, '10000000019'),
('10000000032', 'Michele', 'Santana', '1984-06-21', 14210.80, 32, '10000000012'),
('10000000033', 'Adriana', 'Gonçalves', '1999-11-11', 7890.30, 33, '10000000025'),
('10000000034', 'Diego', 'Moreira', '1988-01-15', 13450.60, 34, '10000000002'),
('10000000035', 'Lucas', 'Ramos', '1993-07-28', 11200.00, 35, '10000000011'),
('10000000036', 'Fernanda', 'Machado', '1972-02-14', 17890.40, 36, '10000000004'),
('10000000037', 'Guilherme', 'Nunes', '1997-09-09', 8900.25, 37, '10000000030'),
('10000000038', 'Sabrina', 'Vieira', '1986-10-30', 9540.70, 38, '10000000016'),
('10000000039', 'Murilo', 'Soares', '2000-04-05', 6780.10, 39, '10000000021'),
('10000000040', 'Camila', 'Oliveira', '1991-12-18', 14560.00, 40, '10000000035'),
('10000000041', 'Henrique', 'Lopes', '1985-08-12', 12900.50, 41, '10000000017'),
('10000000042', 'Amanda', 'Ferreira', '1994-05-23', 8430.20, 42, '10000000028'),
('10000000043', 'Vitor', 'Silva', '1989-01-08', 15600.80, 43, '10000000010'),
('10000000044', 'Paula', 'Ribeiro', '1977-06-17', 16800.00, 44, '10000000003'),
('10000000045', 'Gabriel', 'Santos', '1998-11-03', 7120.90, 45, '10000000039'),
('10000000046', 'Priscila', 'Gomes', '1983-03-29', 13400.30, 46, '10000000023'),
('10000000047', 'Ricardo', 'Martins', '1975-07-14', 18100.00, 47, '10000000001'),
('10000000048', 'Patricia', 'Alves', '1992-09-21', 9300.60, 48, '10000000033'),
('10000000049', 'Eduardo', 'Pereira', '1988-02-11', 11950.40, 49, '10000000040'),
('10000000050', 'Beatriz', 'Costa', '1996-04-19', 10500.00, 50, '10000000026'),
('10000000051', 'Leandro', 'Dias', '1982-10-07', 12750.80, 51, '10000000014'),
('10000000052', 'Jaqueline', 'Rocha', '1990-01-31', 8890.10, 52, '10000000045'),
('10000000053', 'Fernando', 'Carvalho', '1973-08-16', 17400.00, 53, '10000000005'),
('10000000054', 'Claudia', 'Padilha', '1987-12-04', 11300.20, 54, '10000000031'),
('10000000055', 'Roberto', 'Moraes', '1980-05-27', 14900.70, 55, '10000000022'),
('10000000056', 'Larissa', 'Barros', '1995-09-15', 9650.30, 56, '10000000048'),
('10000000057', 'Caio', 'Nascimento', '1999-02-02', 6400.00, 57, '10000000050'),
('10000000058', 'Monique', 'Freitas', '1984-11-13', 13800.50, 58, '10000000018'),
('10000000059', 'Alexandre', 'Santana', '1978-06-09', 16200.00, 59, '10000000009'),
('10000000060', 'Erica', 'Menezes', '1993-07-20', 10800.40, 60, '10000000037');

UPDATE FUNCIONARIO SET Supervisor_CPF = '10000000002' WHERE CPF = '10000000001';
UPDATE FUNCIONARIO SET Supervisor_CPF = '10000000003' WHERE CPF = '10000000002';
UPDATE FUNCIONARIO SET Supervisor_CPF = '10000000004' WHERE CPF = '10000000003';
UPDATE FUNCIONARIO SET Supervisor_CPF = '10000000005' WHERE CPF = '10000000004';
UPDATE FUNCIONARIO SET Supervisor_CPF = '10000000001' WHERE CPF = '10000000005';

UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000001', DataInicioGerente = GETDATE() WHERE DNumero = 1;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000002', DataInicioGerente = GETDATE() WHERE DNumero = 2;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000003', DataInicioGerente = GETDATE() WHERE DNumero = 3;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000004', DataInicioGerente = GETDATE() WHERE DNumero = 4;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000005', DataInicioGerente = GETDATE() WHERE DNumero = 5;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000006', DataInicioGerente = GETDATE() WHERE DNumero = 6;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000007', DataInicioGerente = GETDATE() WHERE DNumero = 7;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000008', DataInicioGerente = GETDATE() WHERE DNumero = 8;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000009', DataInicioGerente = GETDATE() WHERE DNumero = 9;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000010', DataInicioGerente = GETDATE() WHERE DNumero = 10;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000011', DataInicioGerente = GETDATE() WHERE DNumero = 11;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000012', DataInicioGerente = GETDATE() WHERE DNumero = 12;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000013', DataInicioGerente = GETDATE() WHERE DNumero = 13;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000014', DataInicioGerente = GETDATE() WHERE DNumero = 14;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000015', DataInicioGerente = GETDATE() WHERE DNumero = 15;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000016', DataInicioGerente = GETDATE() WHERE DNumero = 16;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000017', DataInicioGerente = GETDATE() WHERE DNumero = 17;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000018', DataInicioGerente = GETDATE() WHERE DNumero = 18;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000019', DataInicioGerente = GETDATE() WHERE DNumero = 19;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000020', DataInicioGerente = GETDATE() WHERE DNumero = 20;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000021', DataInicioGerente = GETDATE() WHERE DNumero = 21;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000022', DataInicioGerente = GETDATE() WHERE DNumero = 22;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000023', DataInicioGerente = GETDATE() WHERE DNumero = 23;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000024', DataInicioGerente = GETDATE() WHERE DNumero = 24;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000025', DataInicioGerente = GETDATE() WHERE DNumero = 25;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000026', DataInicioGerente = GETDATE() WHERE DNumero = 26;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000027', DataInicioGerente = GETDATE() WHERE DNumero = 27;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000028', DataInicioGerente = GETDATE() WHERE DNumero = 28;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000029', DataInicioGerente = GETDATE() WHERE DNumero = 29;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000030', DataInicioGerente = GETDATE() WHERE DNumero = 30;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000031', DataInicioGerente = GETDATE() WHERE DNumero = 31;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000032', DataInicioGerente = GETDATE() WHERE DNumero = 32;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000033', DataInicioGerente = GETDATE() WHERE DNumero = 33;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000034', DataInicioGerente = GETDATE() WHERE DNumero = 34;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000035', DataInicioGerente = GETDATE() WHERE DNumero = 35;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000036', DataInicioGerente = GETDATE() WHERE DNumero = 36;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000037', DataInicioGerente = GETDATE() WHERE DNumero = 37;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000038', DataInicioGerente = GETDATE() WHERE DNumero = 38;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000039', DataInicioGerente = GETDATE() WHERE DNumero = 39;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000040', DataInicioGerente = GETDATE() WHERE DNumero = 40;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000041', DataInicioGerente = GETDATE() WHERE DNumero = 41;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000042', DataInicioGerente = GETDATE() WHERE DNumero = 42;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000043', DataInicioGerente = GETDATE() WHERE DNumero = 43;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000044', DataInicioGerente = GETDATE() WHERE DNumero = 44;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000045', DataInicioGerente = GETDATE() WHERE DNumero = 45;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000046', DataInicioGerente = GETDATE() WHERE DNumero = 46;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000047', DataInicioGerente = GETDATE() WHERE DNumero = 47;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000048', DataInicioGerente = GETDATE() WHERE DNumero = 48;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000049', DataInicioGerente = GETDATE() WHERE DNumero = 49;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000050', DataInicioGerente = GETDATE() WHERE DNumero = 50;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000051', DataInicioGerente = GETDATE() WHERE DNumero = 51;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000052', DataInicioGerente = GETDATE() WHERE DNumero = 52;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000053', DataInicioGerente = GETDATE() WHERE DNumero = 53;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000054', DataInicioGerente = GETDATE() WHERE DNumero = 54;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000055', DataInicioGerente = GETDATE() WHERE DNumero = 55;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000056', DataInicioGerente = GETDATE() WHERE DNumero = 56;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000057', DataInicioGerente = GETDATE() WHERE DNumero = 57;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000058', DataInicioGerente = GETDATE() WHERE DNumero = 58;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000059', DataInicioGerente = GETDATE() WHERE DNumero = 59;
UPDATE DEPARTAMENTO SET Gerente_CPF = '10000000060', DataInicioGerente = GETDATE() WHERE DNumero = 60;

INSERT INTO PROJETO (PNumero, PNome, Localizacao, DNum)
VALUES (1, 'Projeto Portal ERP v1', 'São Paulo - SP', 1),
(2, 'Projeto Migração Analytics v2', 'Rio de Janeiro - RJ', 2),
(3, 'Projeto Módulo Vendas Online v3', 'Belo Horizonte - MG', 3),
(4, 'Projeto Sistema Segurança v4', 'Porto Alegre - RS', 4),
(5, 'Projeto Redesenho Folha de Pagamento v5', 'Curitiba - PR', 5),
(6, 'Projeto Automação Atendimento v6', 'Salvador - BA', 6),
(7, 'Projeto Expansão CRM v7', 'Recife - PE', 7),
(8, 'Projeto Upgrade Cloud v8', 'Fortaleza - CE', 8),
(9, 'Projeto Gestão Compliance v9', 'Brasília - DF', 9),
(10, 'Projeto Modernização Estoque v10', 'Campinas - SP', 10),
(11, 'Projeto Plataforma E-commerce v11', 'Guarulhos - SP', 11),
(12, 'Projeto Otimização Logística v12', 'São Bernardo do Campo - SP', 12),
(13, 'Projeto Implementação IA v13', 'Santo André - SP', 13),
(14, 'Projeto Reestruturação Dados v14', 'Osasco - SP', 14),
(15, 'Projeto Integração API Gateway v15', 'Santos - SP', 15),
(16, 'Projeto Sistema BI v16', 'Niterói - RJ', 16),
(17, 'Projeto Portal Mobile v17', 'Duque de Caxias - RJ', 17),
(18, 'Projeto Módulo Checkout v18', 'Uberlândia - MG', 18),
(19, 'Projeto Automação RH Digital v19', 'Joinville - SC', 19),
(20, 'Projeto Gestão Faturamento v20', 'Florianópolis - SC', 20),
(21, 'Projeto Modernização CRM v21', 'São Paulo - SP', 21),
(22, 'Projeto Sistema Analytics v22', 'Rio de Janeiro - RJ', 22),
(23, 'Projeto Upgrade ERP v23', 'Belo Horizonte - MG', 23),
(24, 'Projeto Expansão Vendas Online v24', 'Porto Alegre - RS', 24),
(25, 'Projeto Otimização Atendimento v25', 'Curitiba - PR', 25),
(26, 'Projeto Reestruturação Segurança v26', 'Salvador - BA', 26),
(27, 'Projeto Automação Logística v27', 'Recife - PE', 27),
(28, 'Projeto Migração Cloud v28', 'Fortaleza - CE', 28),
(29, 'Projeto Plataforma IA v29', 'Brasília - DF', 29),
(30, 'Projeto Portal RH Digital v30', 'Campinas - SP', 30),
(31, 'Projeto Sistema E-commerce v31', 'Guarulhos - SP', 31),
(32, 'Projeto Módulo BI v32', 'São Bernardo do Campo - SP', 32),
(33, 'Projeto Gestão Dados v33', 'Santo André - SP', 33),
(34, 'Projeto Integração API Gateway v34', 'Osasco - SP', 34),
(35, 'Projeto Redesenho Checkout v35', 'Santos - SP', 35),
(36, 'Projeto Modernização Faturamento v36', 'Niterói - RJ', 36),
(37, 'Projeto Implementação Folha de Pagamento v37', 'Duque de Caxias - RJ', 37),
(38, 'Projeto Otimização Estoque v38', 'Uberlândia - MG', 38),
(39, 'Projeto Upgrade Mobile v39', 'Joinville - SC', 39),
(40, 'Projeto Expansão Compliance v40', 'Florianópolis - SC', 40),
(41, 'Projeto Automação ERP v41', 'São Paulo - SP', 41),
(42, 'Projeto Sistema CRM v42', 'Rio de Janeiro - RJ', 42),
(43, 'Projeto Portal Analytics v43', 'Belo Horizonte - MG', 43),
(44, 'Projeto Redesenho Cloud v44', 'Porto Alegre - RS', 44),
(45, 'Projeto Reestruturação Vendas Online v45', 'Curitiba - PR', 45),
(46, 'Projeto Implementação Atendimento v46', 'Salvador - BA', 46),
(47, 'Projeto Gestão Segurança v47', 'Recife - PE', 47),
(48, 'Projeto Otimização Logística v48', 'Fortaleza - CE', 48),
(49, 'Projeto Upgrade IA v49', 'Brasília - DF', 49),
(50, 'Projeto Plataforma RH Digital v50', 'Campinas - SP', 50),
(51, 'Projeto Migração E-commerce v51', 'Guarulhos - SP', 51),
(52, 'Projeto Sistema BI v52', 'São Bernardo do Campo - SP', 52),
(53, 'Projeto Módulo Dados v53', 'Santo André - SP', 53),
(54, 'Projeto Portal API Gateway v54', 'Osasco - SP', 54),
(55, 'Projeto Automação Checkout v55', 'Santos - SP', 55),
(56, 'Projeto Expansão Faturamento v56', 'Niterói - RJ', 56),
(57, 'Projeto Modernização Folha de Pagamento v57', 'Duque de Caxias - RJ', 57),
(58, 'Projeto Reestruturação Estoque v58', 'Uberlândia - MG', 58),
(59, 'Projeto Gestão Mobile v59', 'Joinville - SC', 59),
(60, 'Projeto Implementação Compliance v60', 'Florianópolis - SC', 60);

INSERT INTO TRABALHA_EM (F_CPF, P_Numero, Horas) 
VALUES ('10000000001', 41, 32.50),
('10000000002', 7, 25.00),
('10000000003', 18, 15.00),
('10000000003', 44, 20.00),
('10000000004', 52, 38.00),
('10000000005', 9, 12.50),
('10000000006', 14, 28.00),
('10000000007', 3, 30.00),
('10000000008', 29, 22.00),
('10000000009', 11, 40.00),
('10000000010', 36, 18.50),
('10000000011', 5, 27.00),
('10000000012', 49, 35.00),
('10000000013', 2, 10.00),
('10000000013', 58, 25.00),
('10000000014', 21, 16.00),
('10000000015', 33, 31.00),
('10000000016', 60, 20.00),
('10000000017', 15, 24.50),
('10000000018', 8, 39.00),
('10000000019', 27, 11.00),
('10000000020', 43, 29.00),
('10000000021', 1, 33.00),
('10000000022', 19, 17.50),
('10000000023', 50, 36.00),
('10000000024', 12, 14.00),
('10000000025', 38, 22.50),
('10000000026', 4, 30.00),
('10000000027', 47, 26.00),
('10000000028', 23, 19.00),
('10000000029', 55, 34.00),
('10000000030', 10, 21.00),
('10000000031', 31, 28.00),
('10000000032', 17, 13.00),
('10000000033', 45, 37.00),
('10000000034', 6, 25.00),
('10000000035', 53, 18.00),
('10000000036', 22, 32.00),
('10000000037', 39, 15.50),
('10000000038', 16, 23.00),
('10000000039', 57, 30.00),
('10000000040', 28, 20.00),
('10000000041', 35, 27.50),
('10000000042', 13, 12.00),
('10000000043', 48, 38.00),
('10000000044', 20, 16.00),
('10000000045', 54, 29.00),
('10000000046', 30, 21.50),
('10000000047', 25, 33.00),
('10000000048', 42, 19.00),
('10000000049', 59, 26.00),
('10000000050', 34, 14.50),
('10000000051', 26, 31.00),
('10000000052', 51, 22.00),
('10000000053', 37, 35.00),
('10000000054', 24, 17.00),
('10000000055', 46, 28.50),
('10000000056', 56, 11.00),
('10000000057', 32, 24.00),
('10000000058', 40, 39.00),
('10000000059', 3, 23.00),
('10000000060', 18, 30.00);

-- TESTANDO OS INSERTS:

SELECT * FROM DEPARTAMENTO
SELECT * FROM FUNCIONARIO
SELECT * FROM PROJETO
SELECT * FROM TRABALHA_EM