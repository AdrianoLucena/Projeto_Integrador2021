/*DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios(


);*/
CREATE DATABASE `sis_chamados`

DROP TABLE IF EXISTS tb_usuarios;
CREATE TABLE `sis_chamados`.`tb_usuarios` ( `id_usuario` INT(2) NOT NULL , `nome_usuario` VARCHAR(40) NOT NULL , `login_usuario` VARCHAR(40) NOT NULL , `senha_usuario` VARCHAR(40) NOT NULL , `email_usuario` VARCHAR(40) NOT NULL , `dt_criacao` DATETIME NOT NULL , `status_usuario` INT(2) NOT NULL , `acesso_usuario` INT(2) NOT NULL , PRIMARY KEY (`id_usuario`)) ENGINE = MyISAM;

DROP TABLE IF EXISTS tb_cliente;
CREATE TABLE `sis_chamados`.`tb_cliente` ( `id_cliente` INT NOT NULL , `nome_cliente` VARCHAR(40) NOT NULL , `endereco_id` INT NOT NULL , `rg_cliente` INT(11) NOT NULL , `cpf_cliente` INT(11) NOT NULL , `email_cliente` VARCHAR(40) NOT NULL , `telefone_cliente` INT(15) NOT NULL , `telefone2_cliente` INT(15) NOT NULL , PRIMARY KEY (`id_cliente`)) ENGINE = MyISAM;

DROP TABLE IF EXISTS tb_endereco;
CREATE TABLE `sis_chamados`.`tb_endereco` ( `id_endereco` INT NOT NULL , `logradouro` VARCHAR(40) NOT NULL , `numero` INT(5) NOT NULL , `cep` VARCHAR(9) NOT NULL , `estado` VARCHAR(20) NOT NULL , `cidade` VARCHAR(40) NOT NULL , `id_cliente` INT NOT NULL , PRIMARY KEY (`id_endereco`), INDEX (`id_cliente`)) ENGINE = MyISAM;

DROP TABLE IF EXISTS tb_chamados;
CREATE TABLE `sis_chamados`.`tb_chamados` ( `id_chamado` INT(11) NOT NULL , `id_cliente` INT(11) NOT NULL , `id_status` INT(5) NOT NULL , `descricao` TEXT NOT NULL , `dt_criacao` DATETIME NOT NULL , `tipo_servico` INT NOT NULL , `dt_entrega` DATETIME NOT NULL , PRIMARY KEY (`id_chamado`), INDEX (`id_cliente`)) ENGINE = MyISAM;

DROP TABLE IF EXISTS tb_status;
CREATE TABLE `sis_chamados`.`tb_status` ( `id_status` INT NOT NULL , `descricao` VARCHAR(40) NOT NULL , PRIMARY KEY (`id_status`)) ENGINE = MyISAM

DROP TABLE IF EXISTS tb_servicos;
CREATE TABLE `sis_chamados`.`tb_servicos` ( `id_servico` INT NOT NULL , `descricao` VARCHAR(40) NOT NULL , PRIMARY KEY (`id_servico`)) ENGINE = MyISAM;