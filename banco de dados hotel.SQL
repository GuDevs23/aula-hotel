CREATE TABLE tb_cliente(
    cliente_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_cli VARCHAR(45),
    cpf VARCHAR(14) UNIQUE ,
    rg VARCHAR(12) UNIQUE, 
    senha VARCHAR(32),
    email VARCHAR(70),
    recuperar_senha VARCHAR(100),
    arquivar_em DATETIME
    );
    
	CREATE TABLE cartoes(
    id_cartao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_titular VARCHAR(45),
    numero_titular VARCHAR(21),
    validade VARCHAR(7),
    CVV VARCHAR(3) UNIQUE,
    tipo VARCHAR (12),
    id_clientes INT NOT NULL,
    FOREIGN KEY(id_clientes) REFERENCES tb_cliente(cliente_id));
	
	
	CREATE TABLE telefones(
    telefone_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(20),
    tel_cliente VARCHAR(21),
    cli_id INT ,
    FOREIGN KEY(cli_id) REFERENCES tb_cliente(cliente_id));
	
	
	CREATE TABLE enderecos(
    endereco_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CEP VARCHAR(9),
    cidade VARCHAR(30),
    UF VARCHAR(2),
    logadouro VARCHAR(60),
    numero VARCHAR(6),
    clien_id INT NOT NULL,
    FOREIGN KEY(clien_id) REFERENCES tb_cliente(cliente_id));
	
	CREATE TABLE novidades(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(70),
    email VARCHAR(70));
	
	-------------------------------------------------------------------------------
	
	CREATE TABLE cargos_func(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao TEXT,
    arquivar_em VARCHAR(5));
	
	CREATE TABLE funcionario(
    funcionario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(45),
    data_nasc DATE,
    cpf VARCHAR(14) UNIQUE,
    rg VARCHAR(12) UNIQUE,
    salario DOUBLE(7,2),
    email VARCHAR(70),
    senha VARCHAR(32),
    periodo VARCHAR(20),
    admissao DATETIME,
    demissao DATETIME,
    cargos_id INT,
    FOREIGN KEY(cargos_id) REFERENCES cargos_func(id));
	
	
	CREATE TABLE endereco_funcionario(
    id_endereco INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    logadouro VARCHAR(70),
    numero VARCHAR(5),
    cep VARCHAR(9),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    UF VARCHAR(2),
    funcionario_id INT,
    FOREIGN KEY(funcionario_id) REFERENCES funcionario(funcionario_id));
	
	
	CREATE TABLE telefone_funcionario(
    id_tel INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(20),
    tel VARCHAR(21),
    id_funcionario INT,
    FOREIGN KEY(id_funcionario) REFERENCES funcionario(funcionario_id));
	
	CREATE TABLE historico(
    id_hist INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    logs TEXT,
    data_hora DATETIME,
    id_func INT,
    FOREIGN KEY(id_func) REFERENCES funcionario(funcionario_id));
	
	CREATE TABLE acoes(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cargos_id INT,
    FOREIGN KEY(cargos_id) REFERENCES cargos_func(id));
	
	
	CREATE TABLE permissoes(
    id_perm INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    consulta bit(1),
    deletar bit(1),
    criar bit(1),
    alterar bit(1),
    acoes_id INT,
    FOREIGN KEY(acoes_id) REFERENCES acoes (id));
	---------------------------------------------------------------------------------------------------------------------
	
	CREATE TABLE stats( id_status INT NOT NULL PRIMARY KEY AUTO_INCREMENT, stats VARCHAR(20));
	
	CREATE TABLE Tipo(
    id_tipo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(45));
	
	CREATE TABLE quartos(
    id_quarto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    quarto VARCHAR(45),
    descricao TEXT,
    preco_diaria DOUBLE(6,2),
    qtde_pessoas INT(11),
    destaque BIT(1),
    arquivar_em DATETIME,
    status_id INT,
    tipos_id INT,
    FOREIGN KEY(status_id) REFERENCES stats(id_status),
    FOREIGN KEY(tipos_id) REFERENCES tipo(id_tipo));
	
	
	CREATE TABLE pedido_reserva(
    id_res INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_reserva DATETIME,
    data_entrada DATETIME,
    data_saida DATETIME,
    nome VARCHAR(70),
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(70),
    acompanhantes INT(11),
    quartos_id INT,
    status_id INT,
    FOREIGN KEY(quartos_id) REFERENCES quartos (id_quarto),
    FOREIGN KEY(status_id) REFERENCES stats (id_status));
    
	
	CREATE TABLE reservas(
    id_res INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    preco_total FLOAT(6,2),
    parcelas_total INT(2),
    data_entrada DATETIME,
    data_saida DATETIME,
    pedido_res INT,
    funcionarios_id2 INT,
    status_id2 INT,
    FOREIGN KEY (funcionarios_id2) REFERENCES funcionario (funcionario_id),
     FOREIGN KEY (status_id2) REFERENCES stats (id_status));
	 
	 CREATE TABLE negativas(
    id_negativa INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    motivo_negativa TEXT,
    pedido_reserv_id INT,
    funcionarios_id2 INT,
    FOREIGN KEY(pedido_reserv_id) REFERENCES pedido_reserva (id_res),
    FOREIGN KEY(funcionarios_id2) REFERENCES funcionario(funcionario_id));
	
	CREATE TABLE imagens(
    id_img INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    imagem_caminho_1 VARCHAR(100),
    imagem_caminho_2 VARCHAR(100),
    quartos_id INT,
    FOREIGN KEY(quartos_id) REFERENCES quartos (id_quarto));
	
	CREATE TABLE formas_pagamento(
    id_forma INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(12));
	
	CREATE TABLE pagamentos(
    id_pagto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    entrada FLOAT (6,2),
    restante FLOAT(6,2),
    taxa_juros FLOAT(6,2),
    formas_pagto INT,
    reservas_id INT,
    FOREIGN KEY(formas_pagto) REFERENCES formas_pagamento(id_forma),
    FOREIGN KEY(reservas_id) REFERENCES reservas (id_res));
    
