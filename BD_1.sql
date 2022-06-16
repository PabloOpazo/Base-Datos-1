CREATE TABLE DUENO
(
rut_dueno NUMBER(8) PRIMARY KEY,
dv_dueno VARCHAR2(1) NOT NULL,
prim_nom_dueno VARCHAR2(30) NOT NULL,
prim_ap_dueno VARCHAR2(30) NOT NULL
);

CREATE TABLE ESPECIE
(
id_especie NUMBER(5) GENERATED ALWAYS AS IDENTITY
MINVALUE 1
MAXVALUE 99999
START WITH 1000
INCREMENT BY 5,
nom_especie VARCHAR2(30) NOT NULL,
CONSTRAINT pk_especie PRIMARY KEY(id_especie)
);

CREATE TABLE MASCOTA
(
id_chip NUMBER(5) PRIMARY KEY,
nom_mascota VARCHAR2(30) NOT NULL,
fecha_nacimiento VARCHAR(10) NOT NULL,
-- CLAVES FORANEAS
id_especie NUMBER(5) CONSTRAINT fk_especie REFERENCES ESPECIE(id_especie),
rut_dueno NUMBER (8) CONSTRAINT fk_dueno REFERENCES DUENO(rut_dueno)
);

-- claves foràneas son obligatorias
ALTER TABLE MASCOTA MODIFY(id_especie NOT NULL);
ALTER TABLE MASCOTA MODIFY(rut_dueno NOT NULL);

-- Crear objeto secuencia para que trabaje con la tabla 'MASCOTA'
CREATE SEQUENCE seq_mascota
INCREMENT BY 10
START WITH 1000
MAXVALUE 99999
NOCACHE
NOCYCLE;

-- Inserciòn de datos
-- DUEÑO
INSERT INTO DUENO (rut_dueno, dv_dueno, prim_nom_dueno, prim_ap_dueno) VALUES 
(20628750, '0', 'Pablo', 'Opazo');
INSERT INTO DUENO (rut_dueno, dv_dueno, prim_nom_dueno, prim_ap_dueno) VALUES 
(21402551, '5', 'Matias', 'Aniñir');

-- ESPECIE
INSERT INTO ESPECIE (nom_especie) VALUES 
('Gato');
INSERT INTO ESPECIE (nom_especie) VALUES 
('Perro');
INSERT INTO ESPECIE (nom_especie) VALUES 
('Caballo');

-- MASCOTA
INSERT INTO MASCOTA (id_chip, nom_mascota, fecha_nacimiento, id_especie, rut_dueno) VALUES 
(seq_mascota.nextval, 'Juan', '20/05/2009', 1105, 20628750);
INSERT INTO MASCOTA (id_chip, nom_mascota, fecha_nacimiento, id_especie, rut_dueno) VALUES 
(seq_mascota.nextval, 'Pedro', '20/05/2009', 1105, 20628750);
INSERT INTO MASCOTA (id_chip, nom_mascota, fecha_nacimiento, id_especie, rut_dueno) VALUES 
(seq_mascota.nextval, 'Diego', '20/05/2009', 1105, 20628750);
INSERT INTO MASCOTA (id_chip, nom_mascota, fecha_nacimiento, id_especie, rut_dueno) VALUES 
(seq_mascota.nextval, 'Wañaño', '09/06/2022', 1005, 21402551);

-- Agregar columna 'nom_cientifico' a 'ESPECIE'
ALTER TABLE ESPECIE ADD
(nom_cientifico VARCHAR2(30) DEFAULT 'no ingresado' NOT NULL);

-- Borrar tablas.  ---- ej. 'ESPECIE'
DROP TABLE ESPECIE CASCADE CONSTRAINTS;

-- Agregar CONSTRAINT
-- ALTER TABLE MASCOTA ADD CONSTRAINT ck_mascota CHECK(fecha_nacimiento BETWEEN '01/01/1900' AND SYSDATE);
