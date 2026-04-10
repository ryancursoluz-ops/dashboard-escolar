DESCRIBE unidade;


CREATE TABLE departamentos(
id_departamento NUMBER GENERATED ALWAYS AS IDENTITY,
departamento varchar(100),
id_unidade NUMBER,

CONSTRAINT pk_funcionario 
PRIMARY KEY (id_departamento),

CONSTRAINT fk_depto_unidade 
FOREIGN KEY (id_unidade) 
REFERENCES unidade(id)        
);

ALTER TABLE departamentos 
RENAME CONSTRAINT pk_funcionario TO pk_departamento;

SELECT *
FROM departamentos;

DROP TABLE funcionario;

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE funcionario CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN -- -942 é o erro de "tabela não existe"
         RAISE;
      END IF;
END;

CREATE TABLE funcionarios (
id_funcionario    NUMBER GENERATED ALWAYS AS IDENTITY,
cpf               VARCHAR2(14),
first_name        VARCHAR2(100),
last_name         VARCHAR2(100),
idade             NUMBER(3),
sexo              CHAR(1),
cargo             VARCHAR2(100),
id_unidade        NUMBER,          -- Ajustado: Deve ser NUMBER para bater com unidade(id)
id_departamento   NUMBER,          -- Ajustado: Deve ser NUMBER para bater com departamentos(id_departamento)

CONSTRAINT pk_funcionario PRIMARY KEY (id_funcionario),
CONSTRAINT uk_cpf UNIQUE (cpf),
CONSTRAINT ck_func_sexo CHECK (sexo IN ('M', 'F')), -- Adicionada a vírgula aqui

CONSTRAINT fgk_unidade 
    FOREIGN KEY (id_unidade) 
     REFERENCES unidade(id),

CONSTRAINT fgk_departamento 
    FOREIGN KEY (id_departamento) 
    REFERENCES departamentos(id_departamento)
);