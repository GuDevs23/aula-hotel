	CREATE DATABASE Unidas_autos;


	CREATE TABLE Proprietario_veiculo(
    dono_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dono_nome varchar(45) NOT NULL, 
    endereco VARCHAR (100),
    bairro VARCHAR (45),
    cpf VARCHAR (45) NOT NULL UNIQUE,
    telefone VARCHAR(45),
    rg VARCHAR(45) NOT NULL UNIQUE, 
    data_nasc_dono DATE
    );
	
	
	CREATE TABLE categoria (
    id_categoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    categoria_veiculo VARCHAR(45));
	
	CREATE TABLE marca (
    id_carro INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(45));
	
	CREATE TABLE estado(
    id_estado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_estado VARCHAR(45));
	
	
	CREATE TABLE municipio (
    municipio_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_municipio VARCHAR(45),
    estado_idestado INT NOT NULL, 
    FOREIGN KEY (estado_idestado) REFERENCES estado(id_estado))
    
	CREATE TABLE veiculo(
    veiculo_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    placa_veiculo VARCHAR(45),
    ano_veiculo DATE, 
    proprietario_id INT NOT NULL, 
    marca_id INT NOT NULL, 
    municipio_idmunicipio INT NOT NULL, 
    municipio_estado_id INT NOT NULL,
    FOREIGN KEY(proprietario_id) REFERENCES proprietario_veiculo (dono_id),
    FOREIGN KEY(marca_id) REFERENCES marca (id_carro),
    FOREIGN KEY(municipio_idmunicipio) REFERENCES municipio (municipio_id),
    FOREIGN KEY(municipio_estado_id) REFERENCES estado (id_estado))
    
    DEFAULT CHARSET = utf8;
	
CREATE PROCEDURE InserirDono (nome VARCHAR(45), datanasc DATE, cpf VARCHAR(45), rg VARCHAR(45),endereco VARCHAR(45), bairro VARCHAR(45), telefone VARCHAR(45))
 INSERT INTO proprietario_veiculo (dono_nome,data_nasc_dono, cpf, rg, endereco, bairro, telefone)
 
                             VALUES (nome, datanasc, cpf, rg, endereco, bairro, telefone) ;


CALL InserirDono ('')

	CREATE PROCEDURE InserirDono(nome VARCHAR(45),dataNasc DATE,cpf VARCHAR(45), rg VARCHAR(45), endereco VARCHAR(45),bairro VARCHAR(45),telefone VARCHAR(45))
INSERT INTO proprietario_veiculo (dono_nome,dono_nasc,rg_dono, cpf_dono, endereco_dono, bairro_dono,telefone_dono)
VALUES							(nome,dataNasc,cpf,rg,endereco,bairro,telefone)
