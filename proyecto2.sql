CREATE TABLE oficinas (
	id_oficina integer,
	direccion varchar(30),
	constraint oficina_pk primary key (id_oficina)

);


CREATE TABLE contratos (
	id_tipo_contrato integer,
	tipo varchar(20),
	costo float,
	constraint tipo_contrato_pk primary key (id_tipo_contrato)
	
);



CREATE TABLE estados (
	id_estado_cliente integer,
	estado varchar(20),
	constraint estado_pk primary key (id_estado_cliente)
	
);



CREATE TABLE tipos_cliente (
	id_tipo_cliente integer,
	tipo varchar(20),
	descuento float,
	constraint tipo_cliente_pk primary key (id_tipo_cliente)
	
);




CREATE TABLE nuevos_campos (
	id_campo integer,
	campo varchar(40),
	tipo varchar(10),
	constraint campo_pk primary key (id_campo)
);



CREATE TABLE clientes (
	id_cliente integer,
	nombre varchar(40),
	apellido varchar(40),
	fecha_inicio date default now(), 
	domicilio varchar(40),
	correo varchar(30),
	nit varchar(15),
	pago_total float,
	
	
	oficina integer,
	contrato integer,
	estado integer,
	tipo_cliente integer,

	constraint cliente_pk primary key (id_cliente),
	
	
	constraint oficina_fk foreign key (oficina) references oficinas (id_oficina),
	constraint tipo_contrato_fk foreign key (contrato) references contratos (id_tipo_contrato),
	constraint estado_fk foreign key (estado) references estados (id_estado_cliente),
	constraint tipo_cliente_fk foreign key (tipo_cliente) references tipos_cliente (id_tipo_cliente)

);





CREATE TABLE valores_nuevos_campos(
	id_cliente integer,
	id_campo integer,
	valor varchar(50),
	constraint cliente_fk foreign key (id_cliente) references clientes (id_cliente),
	constraint campo_fk foreign key (id_campo) references nuevos_campos (id_campo)

);




INSERT INTO oficinas VALUES (1, 'Zona 10 Guatemala');
INSERT INTO oficinas VALUES (2, 'Zona 14 Guatemala' );
INSERT INTO oficinas VALUES (3, 'Zona 16 Guatemala');


INSERT INTO contratos VALUES (1, 'Anual', 10000);
INSERT INTO contratos VALUES (2, 'Mensual', 1000);
INSERT INTO contratos VALUES (3, 'Permanente', 50000);

INSERT INTO estados VALUES (1, 'Activo');
INSERT INTO estados VALUES (2, 'Inactivo');
INSERT INTO estados VALUES (3, 'Terminado');

INSERT INTO tipos_cliente VALUES (1, 'Regular' , 0);
INSERT INTO tipos_cliente VALUES (2, 'Familiar' , 0.15);
INSERT INTO tipos_cliente VALUES (3, 'Asociado' , 0.3);