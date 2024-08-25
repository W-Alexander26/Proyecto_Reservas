CREATE DATABASE Proyecto_MySQL_Reservas DEFAULT CHARACTER SET = 'utf8mb4';

USE Proyecto_MySQL_Reservas

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(15) NOT NULL,
    apellido_cliente VARCHAR(20) NOT NULL,
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES Pais (id_pais),
    ced_id INT NOT NULL,
    correo VARCHAR(50),
    celular VARCHAR(15),
)

CREATE TABLE Pais (
    id_pais INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_pais VARCHAR(15) NOT NULL,
    pais_tel_codigo VARCHAR(20) NOT NULL,
)


INSERT INTO Clientes (nombre_cliente, apellido_cliente, ced_id, correo, celular)
VALUES 
("Laura", "Lopez", 123456789, "lauralopez@gmail.com", 8765-4321),
("Carlos", "Fernandez", 776543212, "carlosfernandez@gmail.com", 2456-7890),
("Sofia", "Rodriguez", 354764367, "sofiarodriguez@gmail.com", 6254-6975),
("Diego", "Martinez", 538511353, "dmartinez@gmail.com", 7245-6843),
("Daddy", "Yankee", 652348713, "digua@gmail.com", 6236-7534),
("Andrea", "Solano", 542672842, "andreasolano@gmail.com", 4312-5436),
("Andres", "Castillo", 463463278, "andres123@gmail.com", 6345-6273);

INSERT TABLE Pais (nombre_pais, pais_tel_codigo)
VALUES 
("Costa Rica", "+506"),
("Mexico", "+52"),
("Colombia", "+57"),
("España", "+34"),
("USA", "+1"),
("Panamá", "+507"),
("Brasil", "+55");