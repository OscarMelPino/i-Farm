drop database if exists i_farm;
create database if not exists i_farm;
use i_farm;
drop table if exists granja_zumo, granja_planta, granja_semilla, granja_suelo, suelo, semilla, planta, zumo, granja, usuario;

CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(75) NOT NULL,
    edad DATETIME NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    contrasena VARCHAR(20) NOT NULL,
    nick VARCHAR(20) NOT NULL UNIQUE,
    n_monedas INT DEFAULT 0 NOT NULL,
    nivel INT DEFAULT 1 NOT NULL,
    privacidad boolean default false
);

CREATE TABLE IF NOT EXISTS granja (
    id_granja INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    elemento ENUM('fuego', 'agua', 'tierra', 'aire') NOT NULL,
    fk_id_usuario INT NOT NULL,
    FOREIGN KEY (fk_id_usuario)
        REFERENCES usuario (id_usuario)
);

CREATE TABLE IF NOT EXISTS semilla (
    id_semilla INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    elemento ENUM('fuego', 'agua', 'tierra', 'aire') NOT NULL,
    nivel INT NOT NULL DEFAULT 1,
    tiempo_espera int not null default 5 /*minutos*/
);

CREATE TABLE IF NOT EXISTS granja_semilla (
    id_granja_semilla INT PRIMARY KEY AUTO_INCREMENT,
    n_semilla INT DEFAULT 0 NOT NULL,
    fk_id_granja INT,
    fk_id_semilla INT,
    FOREIGN KEY (fk_id_granja)
        REFERENCES granja (id_granja),
    FOREIGN KEY (fk_id_semilla)
        REFERENCES semilla (id_semilla)
);

CREATE TABLE IF NOT EXISTS planta (
    id_planta INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    elemento ENUM('fuego', 'agua', 'tierra', 'aire') NOT NULL,
    nivel INT NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS granja_planta (
    id_granja_planta INT PRIMARY KEY AUTO_INCREMENT,
    n_planta INT DEFAULT 0 NOT NULL,
    fk_id_granja INT,
    fk_id_planta INT,
    FOREIGN KEY (fk_id_granja)
        REFERENCES granja (id_granja),
    FOREIGN KEY (fk_id_planta)
        REFERENCES planta (id_planta)
);

CREATE TABLE IF NOT EXISTS zumo (
    id_zumo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    elemento ENUM('fuego', 'agua', 'tierra', 'aire') NOT NULL,
    tipo INT NOT NULL,
    tiempo_espera int not null default 5 /*minutos*/
);

CREATE TABLE IF NOT EXISTS granja_zumo (
    id_granja_zumo INT PRIMARY KEY AUTO_INCREMENT,
    n_zumo INT DEFAULT 0 NOT NULL,
    fk_id_granja INT,
    fk_id_zumo INT,
    FOREIGN KEY (fk_id_granja)
        REFERENCES granja (id_granja),
    FOREIGN KEY (fk_id_zumo)
        REFERENCES zumo (id_zumo)
);

CREATE TABLE IF NOT EXISTS suelo (
    id_suelo INT PRIMARY KEY AUTO_INCREMENT,
    coor_x INT NOT NULL,
    coor_y INT NOT NULL,
    elemento ENUM('fuego', 'agua', 'tierra', 'aire') NOT NULL,
    fk_id_granja int,
    foreign key(fk_id_granja) references granja(id_granja)
);

CREATE TABLE semilla_suelo (
    id_semilla_suelo INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_semilla INT NOT NULL,
    fk_id_suelo INT NOT NULL,
    FOREIGN KEY (fk_id_semilla)
        REFERENCES semilla (id_semilla),
    FOREIGN KEY (fk_id_suelo)
        REFERENCES suelo (id_suelo)
);
use i_farm;