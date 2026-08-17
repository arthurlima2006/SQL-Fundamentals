CREATE DATABASE EMPRESA

USE EMPRESA

-- Criação da tabela DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    DNumero INT NOT NULL,
    DNome VARCHAR(50) NOT NULL,
    Gerente_CPF VARCHAR(11),
    DataInicioGerente DATE,
    CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (DNumero)
);

-- Criação da tabela FUNCIONÁRIO
CREATE TABLE FUNCIONARIO (
    CPF VARCHAR(11) NOT NULL,
    PNome VARCHAR(50) NOT NULL,
    SNome VARCHAR(50) NOT NULL,
    DataNasc DATE,
    Salario DECIMAL(10, 2),
    DNr INT,
    Supervisor_CPF VARCHAR(11),
    CONSTRAINT PK_FUNCIONARIO PRIMARY KEY (CPF),
    CONSTRAINT FK_FUNCIONARIO_DEPARTAMENTO FOREIGN KEY (DNr) 
        REFERENCES DEPARTAMENTO(DNumero),
    CONSTRAINT FK_FUNCIONARIO_SUPERVISOR FOREIGN KEY (Supervisor_CPF) 
        REFERENCES FUNCIONARIO(CPF)
);

-- Adicionando a chave estrangeira do Gerente na tabela DEPARTAMENTO 
-- (necessário fazer após a criação da tabela FUNCIONARIO devido à referência circular)
ALTER TABLE DEPARTAMENTO
    ADD CONSTRAINT FK_DEPARTAMENTO_GERENTE FOREIGN KEY (Gerente_CPF) 
        REFERENCES FUNCIONARIO(CPF);

-- Criação da tabela PROJETO
CREATE TABLE PROJETO (
    PNumero INT NOT NULL,
    PNome VARCHAR(100) NOT NULL,
    Localizacao VARCHAR(100),
    DNum INT,
    CONSTRAINT PK_PROJETO PRIMARY KEY (PNumero),
    CONSTRAINT FK_PROJETO_DEPARTAMENTO FOREIGN KEY (DNum) 
        REFERENCES DEPARTAMENTO(DNumero)
);

-- Criação da tabela TRABALHA_EM (Relacionamento N:M entre Funcionário e Projeto)
CREATE TABLE TRABALHA_EM (
    F_CPF VARCHAR(11) NOT NULL,
    P_Numero INT NOT NULL,
    Horas DECIMAL(5, 2),
    CONSTRAINT PK_TRABALHA_EM PRIMARY KEY (F_CPF, P_Numero),
    CONSTRAINT FK_TRABALHA_EM_FUNCIONARIO FOREIGN KEY (F_CPF) 
        REFERENCES FUNCIONARIO(CPF),
    CONSTRAINT FK_TRABALHA_EM_PROJETO FOREIGN KEY (P_Numero) 
        REFERENCES PROJETO(PNumero)
);

select * from DEPARTAMENTO
select * from DEPARTAMENTO

select * from DEPARTAMENTO

-- INSERINDO OS DADOS NA TABELA DEPARTAMENTO
-- INSERINDO SEM INFORMAR OS CAMPOS

insert into DEPARTAMENTO
values (1, 'TECNOLOGIA', NULL, NULL)

-- INSERINDO ESPECIFICAR A COLUNA
insert into DEPARTAMENTO (DNumero, DNome)
values (2, 'RECURSOS HUMANOS')

-- INSERINDO DIVERSOS REGISTROS
INSERT INTO DEPARTAMENTO (DNumero, DNome, Gerente_CPF, DataInicioGerente) VALUES
(3, 'Financeiro e Controladoria', NULL, NULL),
(4, 'Marketing Digital e Mídia', NULL, NULL),
(5, 'Vendas e Expansão Comercial', NULL, NULL),
(6, 'Atendimento e Experiência do Cliente', NULL, NULL),
(7, 'Pesquisa e Desenvolvimento (P&D)', NULL, NULL),
(8, 'Logística e Cadeia de Suprimentos', NULL, NULL),
(9, 'Jurídico, Riscos e Compliance', NULL, NULL),
(10, 'Compras e Suprimentos Corporativos', NULL, NULL),
(11, 'Operações e Processos Industriais', NULL, NULL),
(12, 'Garantia e Controle de Qualidade', NULL, NULL),
(13, 'Planejamento Estratégico e Novos Negócios', NULL, NULL),
(14, 'Segurança da Informação e Cibersegurança', NULL, NULL),
(15, 'Engenharia e Infraestrutura', NULL, NULL),
(16, 'Comunicação Interna e Relações Públicas', NULL, NULL),
(17, 'Treinamento, Capacitação e Desenvolvimento', NULL, NULL),
(18, 'Administrativo e Serviços Gerais', NULL, NULL),
(19, 'Inteligência de Mercado e Ciência de Dados', NULL, NULL),
(20, 'Inovação e Transformação Digital', NULL, NULL);

SELECT * FROM DEPARTAMENTO

-- ALTERAR UM REGISTRO
UPDATE DEPARTAMENTO 
SET DataInicioGerente = GETDATE()

UPDATE DEPARTAMENTO
SET DNome = 'AUDITORIA'
WHERE Dnumero = 20

select * from DEPARTAMENTO

-- ELIMINAR UM REGISTRO

DELETE FROM DEPARTAMENTO
WHERE DNumero = 20

-- FUNCIONARIO
SELECT * FROM FUNCIONARIO

INSERT INTO FUNCIONARIO
VALUES('12', 'PRIMEIRO', 'SOBRENOME', '2000-01-01', 1234.56, 15, NULL)

-- INSERINDO COM SELECT
INSERT INTO FUNCIONARIO
SELECT TOP 1 'CPF12', 'PNOME', 'SNOME', '2001-01-01', 999.99, Dnumero, NULL FROM DEPARTAMENTO

SELECT * FROM FUNCIONARIO


