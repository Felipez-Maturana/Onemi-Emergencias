/*==============================================================*/
/* Table: MURO                                                  */
/*==============================================================*/
create table MURO (
    ID          	INT4                 not null,
    primary key (ID)
);
	
/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID           INT4                 not null,
   USUARIO              VARCHAR(25)          not null,
   PASSWORD             VARCHAR(15)          not null,
   TIPO_USUARIO         INT4                 null,
   RUN                  INT4                 null,
   EMAIL                VARCHAR(40)          null,
   TELEFONO             INT4                 null,
   ACTIVO 			       	BOOLEAN	       			 not null,
   VISIBLE              BOOLEAN              not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: HISTORIAL                                             */
/*==============================================================*/
create table HISTORIAL (
   ID          	INT4                 not null,
   ID_USUARIO				INT4                 not null,
   FECHA 					DATE 				 not null,
   HORA 					TIME 				 not null,
   primary key (ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID)
);

/*==============================================================*/
/* Table: CATASTROFE                                            */
/*==============================================================*/
create table CATASTROFE (
   ID        INT4                 not null,
   ID_USUARIO           INT4                 null,
   DESCRIPCION	        VARCHAR(20)          null,
   REGION               VARCHAR(15)          null,
   COMUNA               VARCHAR(15)          null,
   primary key (ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID)
);

/*==============================================================*/
/* Table: EVENTO                                                */
/*==============================================================*/
create table EVENTO (
   ID            INT4                 not null,
   ID_CATASTROFE        INT4                 not null,
   ID_USUARIO           INT4                 not null,
   ID_MURO             	INT4                 null,
   NOMBRE_MEDIDA        VARCHAR(15)          null,
   FECHA_INICIO         DATE                 null,
   FECHA_TERMINO        DATE                 null,
   AVANCE               DECIMAL              null,
   DIRECCION            VARCHAR(50)          null,
   FECHA                DATE                 null,
   HORA                 TIME                 null,
   MONTO_RECAUDADO      INT4                 null,
   primary key (ID),
   FOREIGN KEY (ID_CATASTROFE) REFERENCES CATASTROFE(ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID),
   FOREIGN KEY (ID_MURO) REFERENCES MURO(ID)
);

/*==============================================================*/
/* Table: ACTIVIDAD                                             */
/*==============================================================*/
create table ACTIVIDAD (
   ID         INT4                 not null,
   ID_EVENTO	       		INT4		        		 not null,
   ID_USUARIO           INT4                 not null,
   DESCRIPCION          VARCHAR(100)         null,
   PRIMARY KEY (ID),
   FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID)
);

/*==============================================================*/
/* Table: VOLUNTARIADO                                          */
/*==============================================================*/
create table VOLUNTARIADO (
   ID      INT4                 not null,
   ID_CATASTROFE        INT4                 not null,
   ID_USUARIO           INT4                 not null,
   ID_MURO             	INT4                 not null,
   NOMBRE_MEDIDA        VARCHAR(15)          null,
   FECHA_INICIO         DATE                 null,
   FECHA_TERMINO        DATE                 null,
   AVANCE               DECIMAL              null,
   PERFIL_VOLUNTARIO    VARCHAR(20)          null,
   PERSONAS             INT4                 null,
   TIPO_TRABAJO         VARCHAR(20)          null,
   DIRECCION            VARCHAR(50)          null,
   primary key (ID),
   FOREIGN KEY (ID_CATASTROFE) REFERENCES CATASTROFE(ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID),
   FOREIGN KEY (ID_MURO) REFERENCES MURO(ID)
);

/*==============================================================*/
/* Table: CUENTA_BANCO                                          */
/*==============================================================*/
create table CUENTA_BANCO (
   ID                   INT4                 not null,
   NUMERO_CUENTA        INT4                 null,
   BANCO                VARCHAR(20)          null,
   TIPO_CUENTA          INT4                 null,
   RUN                  INT4                 null,
   primary key (ID)
);

/*==============================================================*/
/* Table: RECOLECCION                                           */
/*==============================================================*/
create table RECOLECCION (
   ID                   INT4                 not null,
   ID_CATASTROFE        INT4                 null,
   ID_USUARIO           INT4                 null,
   ID_MURO             	INT4                 not null,
   NOMBRE_MEDIDA        VARCHAR(15)          null,
   FECHA_INICIO         DATE                 null,
   FECHA_TERMINO        DATE                 null,
   AVANCE               DECIMAL              null,
   DIRECCION            VARCHAR(50)          null,
   ELEMENTOSNECESARIOS  INT4                 not null,
   primary key (ID),
   FOREIGN KEY (ID_CATASTROFE) REFERENCES CATASTROFE(ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID),
   FOREIGN KEY (ID_MURO) REFERENCES MURO(ID)
);

/*==============================================================*/
/* Table: APOYO_ECONOMICO                                       */
/*==============================================================*/
create table APOYO_ECONOMICO (
   ID             INT4                 not null,
   ID_CUENTA            INT4                 null,
   ID_CATASTROFE        INT4                 null,
   ID_USUARIO           INT4                 null,
   ID_MURO            	INT4                 not null,
   NOMBRE_MEDIDA        VARCHAR(15)          null,
   FECHA_INICIO         DATE                 null,
   FECHA_TERMINO        DATE                 null,
   AVANCE               DECIMAL              null,
   META                 INT4                 null,
   RECAUDACION_ACTUAL   INT4                 null,

   primary key (ID),
   FOREIGN KEY (ID_CUENTA) REFERENCES CUENTA_BANCO(ID),
   FOREIGN KEY (ID_CATASTROFE) REFERENCES CATASTROFE(ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID),
   FOREIGN KEY (ID_MURO) REFERENCES MURO(ID)
);



/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA(
	  ID			INT4				 not null,	
    ID_RECOLECCION      INT4                 null,
    ID_APOYO            INT4                 null,
    ID_EVENTO           INT4                 null,
    ID_VOLUNTARIADO     INT4                 null,
    RUN 				INT4 				 not null,
    NOMBRE              VARCHAR(20)          not null,
    APELLIDO_PATERNO    VARCHAR(20)          not null,
    APELLIDO_MATERNO    VARCHAR(20)          not null, 
    primary key (ID),
    FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCION(ID),
    FOREIGN KEY (ID_APOYO) REFERENCES APOYO_ECONOMICO(ID),
    FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID),
    FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADO(ID)
);

/*==============================================================*/
/* Table: DONACION                                              */
/*==============================================================*/
create table DONACION(
	ID			INT4				 not null,
	ID_PERSONA			INT4				 not null,	
	ID_CUENTA			INT4				 not null,	
	HORA				TIME 				 not null,
	FECHA				DATE 				 not null,
	MONTO 				MONEY				 not null,
	primary key (ID),
	FOREIGN KEY (ID_PERSONA) REFERENCES PERSONA(ID),
	FOREIGN KEY (ID_CUENTA) REFERENCES CUENTA_BANCO(ID)
);

/*==============================================================*/
/* Table: ELEMENTOS                                             */
/*==============================================================*/
create table ELEMENTOS (
   ID          INT4                 not null,
   ID_RECOLECCION       INT4                 not null,
   NOMBRE               VARCHAR(15)          null,
   CANTIDAD             INT4                 null,
   primary key (ID),
   FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCION(ID)
);

/*==============================================================*/
/* Table: MATERIALES                                            */
/*==============================================================*/
create table MATERIALES (
   ID          INT4                 not null,
   ID_RECOLECCION       INT4                 null,
   ID_APOYO             INT4                 null,
   ID_EVENTO            INT4                 null,
   ID_VOLUNTARIADO      INT4                 null,
   NOMBRE               VARCHAR(15)          null,
   CANTIDAD             INT4                 null,
   primary key (ID),
   FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCION(ID),
   FOREIGN KEY (ID_APOYO) REFERENCES APOYO_ECONOMICO(ID),
   FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID),
   FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADO(ID)
);

/*==============================================================*/
/* Table: OBJETIVO_DE_AYUDA                                     */
/*==============================================================*/
create table OBJETIVO_DE_AYUDA (
   ID          INT4                 not null,
   ID_RECOLECCION       INT4                 null,
   ID_APOYO             INT4                 null,
   ID_EVENTO            INT4                 null,
   ID_VOLUNTARIADO      INT4                 null,
   DESCRIPCION          VARCHAR(100)         null,
   primary key (ID),
   FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCION(ID),
   FOREIGN KEY (ID_APOYO) REFERENCES APOYO_ECONOMICO(ID),
   FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID),
   FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADO(ID)
);

/*==============================================================*/
/* Table: COMENTARIO                                            */
/*==============================================================*/
create table COMENTARIO (
  	ID		INT4				 not null,
    ID_MURO          	INT4                 not null,
    ID_USUARIO           INT4 				 not null,
    DESCRIPCION			VARCHAR(140)		 not null,
    primary key (ID),
    FOREIGN KEY (ID_MURO) REFERENCES MURO(ID),
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID) 
);


/*==============================================================*/
/* Trigger: noborrar()                                          */
/*==============================================================*/

CREATE OR REPLACE FUNCTION noborrar()
  RETURNS trigger AS
$BODY$
BEGIN
  UPDATE usuario SET visible=false WHERE id=OLD.id;
  RETURN NULL;
END; $BODY$
  LANGUAGE plpgsql

CREATE TRIGGER delete_trg
  BEFORE DELETE
  ON usuario
  FOR EACH ROW
  EXECUTE PROCEDURE public.noborrar();










-- *********************************************************************FUNCTIONS
-- CREATE FUNCTION clienteDelete(integer) RETURNS TRIGGER AS $_$
-- BEGIN
--     UPDATE usuario SET activo=0 WHERE usuario_id = $1
-- END $_$ LANGUAGE 'plpgsql';












/*==============================================================*/
/* Table: COMENTARIOSMURO - INTERMEDIA                          */
/*==============================================================*/
-- create table COMENTARIOSMURO (
-- 	ID_COMENTARIO		INT4				 not null,
--     ID_MURO          	INT4                 not null,
--     FOREIGN KEY (ID_MURO) REFERENCES MURO(ID_MURO),
--     FOREIGN KEY (ID_COMENTARIO) REFERENCES COMENTARIO(ID_COMENTARIO) 
-- );

-- /*==============================================================*/
-- /* Table: USUARIOARIOMEDIDA - INTERMEDIA                            */
-- /*==============================================================*/
-- create table USUARIOMEDIDA (
-- 	ID_USUARIO  		INT4				  not null,
-- 	ID_RECOLECCION       INT4                 null,
--     ID_APOYO             INT4                 null,
--     ID_EVENTO            INT4                 null,
--     ID_VOLUNTARIADO      INT4                 null,
--     VALIDA 				 BOOLEAN              not null,			
--     FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_MEDIDA),
--     FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCION(ID_RECOLECCION),
--     FOREIGN KEY (ID_APOYO) REFERENCES APOYO_ECONOMICO(ID_APOYO),
--     FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID_EVENTO),
--     FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADO(ID_VOLUNTARIADO)    
-- );

-- /*==============================================================*/
-- /* Table: USUARIOMEDIDAGENERA - INTERMEDIA                      */
-- /*==============================================================*/
-- create table USUARIOMEDIDAGENERA (
-- 	ID_USUARIO  		INT4				  not null,
-- 	ID_RECOLECCION       INT4                 null,
--     ID_APOYO             INT4                 null,
--     ID_EVENTO            INT4                 null,
--     ID_VOLUNTARIADO      INT4                 null,			
--     FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_MEDIDA),
--     FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCION(ID_RECOLECCION),
--     FOREIGN KEY (ID_APOYO) REFERENCES APOYO_ECONOMICO(ID_APOYO),
--     FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID_EVENTO),
--     FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADO(ID_VOLUNTARIADO)    
-- );

