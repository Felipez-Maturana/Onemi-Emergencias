/*==============================================================*/
/* Table: MURO                                                  */
/*==============================================================*/
create table MURO (
    ID_MURO          	INT4                 not null,
    primary key (ID_MURO)
);
	
/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           INT4                 not null,
   USUARIO              VARCHAR(25)          null,
   PASSWORD             VARCHAR(15)          null,
   TIPO_USUARIO         INT4                 null,
   RUN                  INT4                 null,
   EMAIL                VARCHAR(40)          null,
   TELEFONO             INT4                 null,
   ACTIVO 				BOOLEAN				 null,
   primary key (ID_USUARIO)
);

/*==============================================================*/
/* Table: HISTORIAL                                             */
/*==============================================================*/
create table HISTORIAL (
   ID_HISTORIAL          	INT4                 not null,
   ID_USUARIO				INT4                 not null,
   FECHA 					DATE 				 not null,
   HORA 					TIME 				 not null,
   primary key (ID_HISTORIAL),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO)
);

/*==============================================================*/
/* Table: CATASTROFE                                            */
/*==============================================================*/
create table CATASTROFE (
   ID_CATASTROFE        INT4                 not null,
   ID_USUARIO           INT4                 null,
   DESCRIPCION	        VARCHAR(20)          null,
   REGION               VARCHAR(15)          null,
   COMUNA               VARCHAR(15)          null,
   primary key (ID_CATASTROFE),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO)
);

/*==============================================================*/
/* Table: EVENTO                                                */
/*==============================================================*/
create table EVENTO (
   ID_EVENTO            INT4                 not null,
   ID_CATASTROFE        INT4                 not null,
   ID_USUARIO           INT4                 not null,
   ID_MURO          	INT4                 null,
   NOMBRE_MEDIDA        VARCHAR(15)          null,
   FECHA_INICIO         DATE                 null,
   FECHA_TERMINO        DATE                 null,
   AVANCE               DECIMAL              null,
   DIRECCION            VARCHAR(50)          null,
   FECHA                DATE                 null,
   HORA                 TIME                 null,
   MONTO_RECAUDADO      INT4                 null,
   primary key (ID_EVENTO),
   FOREIGN KEY (ID_CATASTROFE) REFERENCES CATASTROFE(ID_CATASTROFE),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
   FOREIGN KEY (ID_MURO) REFERENCES MURO(ID_MURO)
);

/*==============================================================*/
/* Table: ACTIVIDAD                                             */
/*==============================================================*/
create table ACTIVIDAD (
   ID_ACTIVIDAD         INT4                 not null,
   ID_EVENTO			INT4				 not null,
   ID_USUARIO           INT4                 not null,
   DESCRIPCION          VARCHAR(100)         null,
   PRIMARY KEY (ID_ACTIVIDAD),
   FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID_EVENTO),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO)
);

/*==============================================================*/
/* Table: VOLUNTARIADO                                          */
/*==============================================================*/
create table VOLUNTARIADO (
   ID_VOLUNTARIADO      INT4                 not null,
   ID_CATASTROFE        INT4                 not null,
   ID_USUARIO           INT4                 not null,
   ID_MURO          	INT4                 not null,
   NOMBRE_MEDIDA        VARCHAR(15)          null,
   FECHA_INICIO         DATE                 null,
   FECHA_TERMINO        DATE                 null,
   AVANCE               DECIMAL              null,
   PERFIL_VOLUNTARIO    VARCHAR(20)          null,
   PERSONAS             INT4                 null,
   TIPO_TRABAJO         VARCHAR(20)          null,
   DIRECCION            VARCHAR(50)          null,
   primary key (ID_VOLUNTARIADO),
   FOREIGN KEY (ID_CATASTROFE) REFERENCES CATASTROFE(ID_CATASTROFE),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
   FOREIGN KEY (ID_MURO) REFERENCES MURO(ID_MURO)
);

/*==============================================================*/
/* Table: CUENTA_BANCO                                          */
/*==============================================================*/
create table CUENTA_BANCO (
   ID_CUENTA            INT4                 not null,
   NUMERO_CUENTA        INT4                 null,
   BANCO                VARCHAR(20)          null,
   TIPO_CUENTA          INT4                 null,
   RUN                  INT4                 null,
   primary key (ID_CUENTA)
);

/*==============================================================*/
/* Table: RECOLECCION                                           */
/*==============================================================*/
create table RECOLECCION (
   ID_RECOLECCION       INT4                 not null,
   ID_CATASTROFE        INT4                 null,
   ID_USUARIO           INT4                 null,
   ID_MURO          	INT4                 not null,
   NOMBRE_MEDIDA        VARCHAR(15)          null,
   FECHA_INICIO         DATE                 null,
   FECHA_TERMINO        DATE                 null,
   AVANCE               DECIMAL              null,
   DIRECCION            VARCHAR(50)          null,
   primary key (ID_RECOLECCION),
   FOREIGN KEY (ID_CATASTROFE) REFERENCES CATASTROFE(ID_CATASTROFE),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
   FOREIGN KEY (ID_MURO) REFERENCES MURO(ID_MURO)
);

/*==============================================================*/
/* Table: APOYO_ECONOMICO                                       */
/*==============================================================*/
create table APOYO_ECONOMICO (
   ID_APOYO             INT4                 not null,
   ID_CUENTA            INT4                 null,
   ID_CATASTROFE        INT4                 null,
   ID_USUARIO           INT4                 null,
   ID_MURO          	INT4                 not null,
   NOMBRE_MEDIDA        VARCHAR(15)          null,
   FECHA_INICIO         DATE                 null,
   FECHA_TERMINO        DATE                 null,
   AVANCE               DECIMAL              null,
   META                 INT4                 null,
   RECAUDACION_ACTUAL   INT4                 null,

   primary key (ID_APOYO),
   FOREIGN KEY (ID_CUENTA) REFERENCES CUENTA_BANCO(ID_CUENTA),
   FOREIGN KEY (ID_CATASTROFE) REFERENCES CATASTROFE(ID_CATASTROFE),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
   FOREIGN KEY (ID_MURO) REFERENCES MURO(ID_MURO)
);



/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA(
	ID_PERSONA			INT4				 not null,	
    ID_RECOLECCION      INT4                 null,
    ID_APOYO            INT4                 null,
    ID_EVENTO           INT4                 null,
    ID_VOLUNTARIADO     INT4                 null,
    RUN 				INT4 				 not null,
    NOMBRE              VARCHAR(20)          not null,
    APELLIDO_PATERNO    VARCHAR(20)          not null,
    APELLIDO_MATERNO    VARCHAR(20)          not null, 
    primary key (ID_PERSONA),
    FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCION(ID_RECOLECCION),
    FOREIGN KEY (ID_APOYO) REFERENCES APOYO_ECONOMICO(ID_APOYO),
    FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID_EVENTO),
    FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADO(ID_VOLUNTARIADO)
);

/*==============================================================*/
/* Table: DONACION                                              */
/*==============================================================*/
create table DONACION(
	ID_DONACION			INT4				 not null,
	ID_PERSONA			INT4				 not null,	
	ID_CUENTA			INT4				 not null,	
	HORA				TIME 				 not null,
	FECHA				DATE 				 not null,
	MONTO 				MONEY				 not null,
	primary key (ID_DONACION),
	FOREIGN KEY (ID_PERSONA) REFERENCES PERSONA(ID_PERSONA),
	FOREIGN KEY (ID_CUENTA) REFERENCES CUENTA_BANCO(ID_CUENTA)
);

/*==============================================================*/
/* Table: ELEMENTOS                                             */
/*==============================================================*/
create table ELEMENTOS (
   ID_ELEMENTO          INT4                 not null,
   ID_RECOLECCION       INT4                 not null,
   NOMBRE               VARCHAR(15)          null,
   CANTIDAD             INT4                 null,
   primary key (ID_ELEMENTO),
   FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCION(ID_RECOLECCION)
);

/*==============================================================*/
/* Table: MATERIALES                                            */
/*==============================================================*/
create table MATERIALES (
   ID_MATERIAL          INT4                 not null,
   ID_RECOLECCION       INT4                 null,
   ID_APOYO             INT4                 null,
   ID_EVENTO            INT4                 null,
   ID_VOLUNTARIADO      INT4                 null,
   NOMBRE               VARCHAR(15)          null,
   CANTIDAD             INT4                 null,
   primary key (ID_MATERIAL),
   FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCION(ID_RECOLECCION),
   FOREIGN KEY (ID_APOYO) REFERENCES APOYO_ECONOMICO(ID_APOYO),
   FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID_EVENTO),
   FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADO(ID_VOLUNTARIADO)
);

/*==============================================================*/
/* Table: OBJETIVO_DE_AYUDA                                     */
/*==============================================================*/
create table OBJETIVO_DE_AYUDA (
   ID_OBJETIVO          INT4                 not null,
   ID_RECOLECCION       INT4                 null,
   ID_APOYO             INT4                 null,
   ID_EVENTO            INT4                 null,
   ID_VOLUNTARIADO      INT4                 null,
   DESCRIPCION          VARCHAR(100)         null,
   primary key (ID_OBJETIVO),
   FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCION(ID_RECOLECCION),
   FOREIGN KEY (ID_APOYO) REFERENCES APOYO_ECONOMICO(ID_APOYO),
   FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID_EVENTO),
   FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADO(ID_VOLUNTARIADO)
);

/*==============================================================*/
/* Table: COMENTARIO                                            */
/*==============================================================*/
create table COMENTARIO (
	ID_COMENTARIO		INT4				 not null,
    ID_MURO          	INT4                 not null,
    ID_USUARIO           INT4 				 not null,
    DESCRIPCION			VARCHAR(140)		 not null,
    primary key (ID_COMENTARIO),
    FOREIGN KEY (ID_MURO) REFERENCES MURO(ID_MURO),
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID_USUARIO) 
);


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

