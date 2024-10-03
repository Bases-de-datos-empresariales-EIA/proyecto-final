-- DROP SCHEMA retail;

CREATE SCHEMA retail AUTHORIZATION postgres;
-- retail.grupo definition

-- Drop table

-- DROP TABLE retail.grupo;

CREATE TABLE retail.grupo (
	id uuid NOT NULL,
	nombre varchar(50) NULL,
	CONSTRAINT pk_grupo PRIMARY KEY (id)
);


-- retail.impuesto definition

-- Drop table

-- DROP TABLE retail.impuesto;

CREATE TABLE retail.impuesto (
	id uuid NOT NULL,
	porcentaje float4 NULL,
	CONSTRAINT pk_impuesto PRIMARY KEY (id)
);


-- retail.necesidad definition

-- Drop table

-- DROP TABLE retail.necesidad;

CREATE TABLE retail.necesidad (
	id uuid NOT NULL,
	nombre varchar(50) NULL,
	CONSTRAINT pk_necesidad PRIMARY KEY (id)
);


-- retail.proveedor definition

-- Drop table

-- DROP TABLE retail.proveedor;

CREATE TABLE retail.proveedor (
	id uuid NOT NULL,
	codigo text NULL,
	nit text NULL,
	nombre text NULL,
	CONSTRAINT pk_proveedor PRIMARY KEY (id)
);


-- retail.tienda definition

-- Drop table

-- DROP TABLE retail.tienda;

CREATE TABLE retail.tienda (
	id uuid NOT NULL,
	nombre varchar(50) NULL,
	codigo text NULL,
	CONSTRAINT pk_tienda PRIMARY KEY (id)
);


-- retail.categoria definition

-- Drop table

-- DROP TABLE retail.categoria;

CREATE TABLE retail.categoria (
	id uuid NOT NULL,
	nombre varchar(50) NULL,
	id_grupo uuid NULL,
	CONSTRAINT pk_categoria PRIMARY KEY (id),
	CONSTRAINT fk_categoria_grupo FOREIGN KEY (id_grupo) REFERENCES retail.grupo(id)
);


-- retail.sub_categoria definition

-- Drop table

-- DROP TABLE retail.sub_categoria;

CREATE TABLE retail.sub_categoria (
	id uuid NOT NULL,
	nombre varchar(50) NULL,
	id_categoria uuid NULL,
	CONSTRAINT pk_subcategoria PRIMARY KEY (id),
	CONSTRAINT fk_subcategoria_categoria FOREIGN KEY (id_categoria) REFERENCES retail.categoria(id)
);


-- retail.producto definition

-- Drop table

-- DROP TABLE retail.producto;

CREATE TABLE retail.producto (
	id uuid NOT NULL,
	codigo text NULL,
	descripcion varchar(128) NULL,
	id_subcategoria uuid NULL,
	id_proveedor uuid NULL,
	id_necesidad uuid NULL,
	CONSTRAINT pk_producto PRIMARY KEY (id),
	CONSTRAINT fk_producto_necesidad FOREIGN KEY (id_necesidad) REFERENCES retail.necesidad(id),
	CONSTRAINT fk_producto_proveedor FOREIGN KEY (id_proveedor) REFERENCES retail.proveedor(id),
	CONSTRAINT fk_producto_subcategoria FOREIGN KEY (id_subcategoria) REFERENCES retail.sub_categoria(id)
);


-- retail.venta definition

-- Drop table

-- DROP TABLE retail.venta;

CREATE TABLE retail.venta (
	id uuid NOT NULL,
	valor_venta float4 NULL,
	valor_compra float4 NULL,
	margen float4 NULL,
	unidades float4 NULL,
	total_venta float4 NULL,
	total_compra float4 NULL,
	total_margen float4 NULL,
	id_producto uuid NULL,
	id_tienda uuid NULL,
	id_impuesto uuid NULL,
	CONSTRAINT pk_venta PRIMARY KEY (id),
	CONSTRAINT fk_venta_impuesto FOREIGN KEY (id_impuesto) REFERENCES retail.impuesto(id),
	CONSTRAINT fk_venta_producto FOREIGN KEY (id_producto) REFERENCES retail.producto(id),
	CONSTRAINT fk_venta_tienda FOREIGN KEY (id_tienda) REFERENCES retail.tienda(id)
);
