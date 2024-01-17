CREATE DATABASE gamerank
DEFAULT CHARACTER SET utf8 
DEFAULT COLLATE utf8_general_ci;

USE gamerank;

-- Cria tabela de Jogos
CREATE TABLE jogos (
	id INT NOT NULL AUTO_INCREMENT,
    nome varchar(50) NOT NULL,
	ano_lancamento INT,
    genero VARCHAR(20),  
    descricao_curta VARCHAR(200),
	descricao_completa VARCHAR(300),
    nota_media DECIMAL(4, 2),
    url_imagem VARCHAR(50),
    PRIMARY KEY(id)
) DEFAULT CHARSET = utf8;


-- Cria tabela de Usuário
CREATE TABLE usuario (
	id INT NOT NULL AUTO_INCREMENT,
    nome varchar(50) NOT NULL, 
    senha varchar(15) NOT NULL,
    PRIMARY KEY(id)
) DEFAULT CHARSET = utf8;


-- Cria tabela de Avaliações
CREATE TABLE avaliacao (
	id INT NOT NULL AUTO_INCREMENT,
    nota INT not null,
    comentario varchar(500),
	id_jogo INT NOT NULL,
    id_usuario INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_jogo) REFERENCES jogos(id),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
) DEFAULT CHARSET = utf8;


-- Cria tabela de Lista de Desejos
CREATE TABLE lista_de_desejos (
	id_jogo INT NOT NULL,
    id_usuario INT NOT NULL,
	FOREIGN KEY(id_jogo) REFERENCES jogos(id),
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
) DEFAULT CHARSET = utf8;