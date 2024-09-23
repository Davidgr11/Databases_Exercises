



CREATE TABLE p (
    cve_p varchar(3) NOT NULL,
    parte VARCHAR(50),
    color VARCHAR(30),
    peso float,
    ciudad VARCHAR(50)
);



CREATE TABLE v (
    cve_v VARCHAR(3) NOT NULL,
    proveedor VARCHAR(50),
    status integer,
    ciudad VARCHAR(50)
);



CREATE TABLE vpy (
    cant integer,
    cve_v VARCHAR(3) NOT NULL,
    cve_p VARCHAR(3) NOT NULL,
    cve_y VARCHAR(3) NOT NULL
);


CREATE TABLE y (
    cve_y VARCHAR(3) NOT NULL,
    proyecto VARCHAR(50),
    ciudad VARCHAR(50)
);

ALTER TABLE y
    ADD CONSTRAINT PK_y PRIMARY KEY (cve_y);


ALTER TABLE p
    ADD CONSTRAINT PK_p PRIMARY KEY (cve_p);


ALTER TABLE v
    ADD CONSTRAINT PK_v PRIMARY KEY (cve_v);


ALTER TABLE vpy
    ADD CONSTRAINT PK_vpy PRIMARY KEY (cve_v, cve_p, cve_y);

ALTER TABLE vpy
    ADD CONSTRAINT FK_p_vpy FOREIGN KEY (cve_p) REFERENCES p(cve_p);


ALTER TABLE vpy
    ADD CONSTRAINT FK_v_vpy FOREIGN KEY (cve_v) REFERENCES v(cve_v);


ALTER TABLE vpy
    ADD CONSTRAINT FK_y_vpy FOREIGN KEY (cve_y) REFERENCES y(cve_y);



insert into  p (cve_p, parte, color, peso, ciudad) values
('P1','Tuerca','Rojo',12,'Londres');
insert into  p (cve_p, parte, color, peso, ciudad) values
('P2','Perno','Verde',17,'Paris');
insert into  p (cve_p, parte, color, peso, ciudad) values
('P3','Tornillo','Azul',17,'Roma');
insert into  p (cve_p, parte, color, peso, ciudad) values
('P4','Tornillo','Rojo',14,'Londres');
insert into  p (cve_p, parte, color, peso, ciudad) values
('P5','Leva','Azul',12,'Paris');
insert into  p (cve_p, parte, color, peso, ciudad) values
('P6','Engrane','Rojo',10,'Londres');
commit;

insert into v(cve_v, proveedor, status, ciudad) values
('V1','Smith',20,'Londres');
insert into v(cve_v, proveedor, status, ciudad) values
('V2','Jones',10,'Paris');
insert into v(cve_v, proveedor, status, ciudad) values
('V3','Blake',30,'Paris');
insert into v(cve_v, proveedor, status, ciudad) values
('V4','Clark',20,'Londres');
insert into v(cve_v, proveedor, status, ciudad) values
('V5','Adams',30,'Atenas');
insert into v(cve_v, proveedor, status, ciudad) values
('V6','Test',40,'Mexico');
commit;

insert into y (cve_y, proyecto, ciudad) values
('Y1','Clasificador','Paris');
insert into y (cve_y, proyecto, ciudad) values
('Y2','Monitor','Roma');
insert into y (cve_y, proyecto, ciudad) values
('Y3','OCR','Atenas');
insert into y (cve_y, proyecto, ciudad) values
('Y4','Consola','Atenas');
insert into y (cve_y, proyecto, ciudad) values
('Y5','RAID','Londres');
insert into y (cve_y, proyecto, ciudad) values
('Y6','EDS','Oslo');
insert into y (cve_y, proyecto, ciudad) values
('Y7','Cinta','Londres');
commit;


insert into vpy (cant, cve_v, cve_p, cve_y) values
(200,'V1','P1','Y1');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(700,'V1','P1','Y4');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(400,'V2','P3','Y1');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(200,'V2','P3','Y2');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(200,'V2','P3','Y3');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(500,'V2','P3','Y4');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(600,'V2','P3','Y5');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(400,'V2','P3','Y6');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(800,'V2','P3','Y7');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(100,'V2','P5','Y2');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(200,'V3','P3','Y1');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(500,'V3','P4','Y2');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(300,'V4','P6','Y3');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(300,'V4','P6','Y7');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(200,'V5','P2','Y2');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(100,'V5','P2','Y4');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(500,'V5','P5','Y5');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(100,'V5','P5','Y7');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(200,'V5','P6','Y2');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(100,'V5','P1','Y4');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(200,'V5','P3','Y4');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(800,'V5','P4','Y4');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(400,'V5','P5','Y4');
insert into vpy (cant, cve_v, cve_p, cve_y) values
(500,'V5','P6','Y4');
commit;
