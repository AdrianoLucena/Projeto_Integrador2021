/*DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios(


);*/
/*CREATE DATABASE sis_chamados;*/

DROP TABLE IF EXISTS tb_usuarios;
CREATE TABLE tb_usuarios ( id_usuario INTEGER PRIMARY KEY , nome_usuario VARCHAR(40)  , login_usuario VARCHAR(40)  , senha_usuario VARCHAR(40)  , email_usuario VARCHAR(40)  , dt_criacao DATETIME  , status_usuario INTEGER  , acesso_usuario INTEGER );

DROP TABLE IF EXISTS tb_cliente;
CREATE TABLE tb_cliente ( id_cliente INTEGER  , nome_cliente VARCHAR(40)  , endereco_id INTEGER  , rg_cliente INTEGER(11)  , cpf_cliente INTEGER(11)  , email_cliente VARCHAR(40)  , telefone_cliente INTEGER(15)  , telefone2_cliente INTEGER(15)  , PRIMARY KEY (id_cliente));

DROP TABLE IF EXISTS tb_endereco;
CREATE TABLE tb_endereco ( id_endereco INTEGER  , logradouro VARCHAR(40)  , numero INTEGER(5)  , cep VARCHAR(9)  , estado VARCHAR(20)  , cidade VARCHAR(40)  , id_cliente INTEGER  , PRIMARY KEY (id_endereco));

DROP TABLE IF EXISTS tb_chamados;
CREATE TABLE tb_chamados ( id_chamado INTEGER PRIMARY KEY ,
                            id_cliente INTEGER(11) ,
                            nome VARCHAR(40),
                            email VARCHAR(200), id_status INTEGER(5)  , descricao TEXT  , dt_criacao DATETIME  , tipo_servico INTEGER , servico varchar (200), dt_entrega DATETIME );

DROP TABLE IF EXISTS tb_status;
CREATE TABLE tb_status ( id_status INTEGER  , descricao VARCHAR(40)  , PRIMARY KEY (id_status));

DROP TABLE IF EXISTS tb_servicos;
CREATE TABLE tb_servicos ( id_servico INTEGER  , descricao VARCHAR(40)  , PRIMARY KEY (id_servico));