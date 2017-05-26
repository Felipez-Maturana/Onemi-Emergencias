/*==============================================================*/
/* Table: MUROS                                                 */
/*==============================================================*/
create table MUROS (
    ID          	     INT4                 not null,
    primary key (ID)
);
	
/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS (
   ID                   INT4                 not null,
   USERNAME             VARCHAR(25)          not null,
   PASSWORD             VARCHAR(15)          not null,
   TIPO_USUARIO         INT4                 NOT null,
   RUN                  INT4                 not null,
   EMAIL                VARCHAR(40)          not null,
   TELEFONO             INT4                 null,
   ACTIVO 			       	BOOLEAN	       			 not null,
   VISIBLE              BOOLEAN              not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: HISTORIALES                                           */
/*==============================================================*/
create table HISTORIALES (
   ID          	        INT4                 not null,
   ID_USUARIO		     		INT4                 not null,
   FECHA 				       	DATE 	         			 not null,
   HORA 					      TIME 	 			         not null,
   primary key (ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID)
);

/*==============================================================*/
/* Table: CATASTROFES                                           */
/*==============================================================*/
create table CATASTROFES (
   ID                   INT4                 not null,
   ID_USUARIO           INT4                 not null,
   DESCRIPCION	        VARCHAR(50)          not null,
   REGION               VARCHAR(20)          not null,
   COMUNA               VARCHAR(20)          not null,
   primary key (ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID)
);

/*==============================================================*/
/* Table: EVENTOS                                               */
/*==============================================================*/
create table EVENTOS (
   ID                   INT4                 not null,
   ID_CATASTROFE        INT4                 not null,
   ID_USUARIO           INT4                 not null,
   ID_USUARIO_VALIDA    INT4                 null,
   ID_MURO             	INT4                 not null,
   NOMBRE_MEDIDA        VARCHAR(25)          not null,
   FECHA_INICIO         DATE                 not null,
   FECHA_TERMINO        DATE                 not null,
   AVANCE               DECIMAL              not null,
   DIRECCION            VARCHAR(50)          not null,
   -- FECHA                DATE                 not null,
   HORA                 TIME                 not null,
   META                 INT4                 not null,
   RECAUDACION_ACTUAL   INT4                 not null,
   VALIDA               BOOLEAN              not null,
   PRIMARY KEY (ID),
   FOREIGN KEY (ID_CATASTROFE) REFERENCES CATASTROFES(ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID),
   FOREIGN KEY (ID_USUARIO_VALIDA) REFERENCES USUARIOS(ID),
   FOREIGN KEY (ID_MURO) REFERENCES MUROS(ID)
);

/*==============================================================*/
/* Table: ACTIVIDADES                                             */
/*==============================================================*/
create table ACTIVIDADES (
   ID                   INT4                 not null,
   ID_EVENTO	       		INT4		        		 not null,
   ID_USUARIO           INT4                 not null,
   DESCRIPCION          VARCHAR(100)         not null,
   RECAUDACION          INT4                 not null,
   PRIMARY KEY (ID),
   FOREIGN KEY (ID_EVENTO) REFERENCES EVENTOS(ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID)
);

/*==============================================================*/
/* Table: VOLUNTARIADOS                                          */
/*==============================================================*/
create table VOLUNTARIADOS (
   ID                   INT4                 not null,
   ID_CATASTROFE        INT4                 not null,
   ID_USUARIO           INT4                 not null,
   ID_USUARIO_VALIDA    INT4                 null,
   ID_MURO             	INT4                 not null,
   NOMBRE_MEDIDA        VARCHAR(15)          not null,
   FECHA_INICIO         DATE                 not null,
   FECHA_TERMINO        DATE                 not null,
   AVANCE               DECIMAL              not null,
   PERFIL_VOLUNTARIO    VARCHAR(20)          not null,
   PERSONAS             INT4                 not null,
   TIPO_TRABAJO         VARCHAR(20)          not null,
   DIRECCION            VARCHAR(50)          null,
   VALIDA               BOOLEAN              not null,
   primary key (ID),
   FOREIGN KEY (ID_CATASTROFE) REFERENCES CATASTROFES(ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID),
   FOREIGN KEY (ID_USUARIO_VALIDA) REFERENCES USUARIOS(ID),
   FOREIGN KEY (ID_MURO) REFERENCES MUROS(ID)
);

/*==============================================================*/
/* Table: CUENTAS_BANCO                                          */
/*==============================================================*/
create table CUENTAS_BANCO (
   ID                   INT4                 not null,
   NUMERO_CUENTA        INT4                 not null,
   BANCO                VARCHAR(20)          not null,
   TIPO_CUENTA          INT4                 not null,
   RUN                  INT4                 not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: RECOLECCIONES                                           */
/*==============================================================*/
create table RECOLECCIONES (
   ID                   INT4                 not null,
   ID_CATASTROFE        INT4                 not null,
   ID_USUARIO           INT4                 not null,
   ID_USUARIO_VALIDA    INT4                 null,
   ID_MURO             	INT4                 not null,
   NOMBRE_MEDIDA        VARCHAR(15)          not null,
   FECHA_INICIO         DATE                 not null,
   FECHA_TERMINO        DATE                 not null,
   AVANCE               DECIMAL              not null,
   DIRECCION            VARCHAR(50)          not null,
   ELEMENTOSNECESARIOS  INT4                 not null,
   VALIDA               BOOLEAN              not null,
   primary key (ID),
   FOREIGN KEY (ID_CATASTROFE) REFERENCES CATASTROFES(ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID),
   FOREIGN KEY (ID_USUARIO_VALIDA) REFERENCES USUARIOS(ID),
   FOREIGN KEY (ID_MURO) REFERENCES MUROS(ID)
);

/*==============================================================*/
/* Table: APOYOS_ECONOMICOS                                       */
/*==============================================================*/
create table APOYOS_ECONOMICOS (
   ID                   INT4                 not null,
   ID_CUENTA            INT4                 not null,
   ID_CATASTROFE        INT4                 not null,
   ID_USUARIO           INT4                 not null,
   ID_USUARIO_VALIDA    INT4                 null,
   ID_MURO            	INT4                 not null,
   NOMBRE_MEDIDA        VARCHAR(15)          not null,
   FECHA_INICIO         DATE                 not null,
   FECHA_TERMINO        DATE                 not null,
   AVANCE               DECIMAL              not null,
   META                 INT4                 not null,
   RECAUDACION_ACTUAL   INT4                 not null,
   VALIDA               BOOLEAN              not null,
   primary key (ID),
   FOREIGN KEY (ID_CUENTA) REFERENCES CUENTAS_BANCO(ID),
   FOREIGN KEY (ID_CATASTROFE) REFERENCES CATASTROFES(ID),
   FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID),
   FOREIGN KEY (ID_USUARIO_VALIDA) REFERENCES USUARIOS(ID),  
   FOREIGN KEY (ID_MURO) REFERENCES MUROS(ID)
);



/*==============================================================*/
/* Table: PERSONAS                                              */
/*==============================================================*/
create table PERSONAS(
	  ID			            INT4				         not null,	
    ID_RECOLECCION      INT4                 null,
    ID_APOYO            INT4                 null,
    ID_EVENTO           INT4                 null,
    ID_VOLUNTARIADO     INT4                 null,
    RUN 				        INT4 				         not null,
    NOMBRE              VARCHAR(20)          not null,
    APELLIDO_PATERNO    VARCHAR(20)          not null,
    APELLIDO_MATERNO    VARCHAR(20)          not null, 
    primary key (ID),
    FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCIONES(ID),
    FOREIGN KEY (ID_APOYO) REFERENCES APOYOS_ECONOMICOS(ID),
    FOREIGN KEY (ID_EVENTO) REFERENCES EVENTOS(ID),
    FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADOS(ID)
);

/*==============================================================*/
/* Table: DONACIONES                                              */
/*==============================================================*/
create table DONACIONES(
	ID			              INT4	  	     		   not null,
	ID_PERSONA		     	  INT4	   	   		     not null,	
	ID_CUENTA		  	      INT4  				       not null,	
	HORA				          TIME 				         not null,
	FECHA				          DATE 				         not null,
	MONTO 				        INT4				         not null,
	primary key (ID),
	FOREIGN KEY (ID_PERSONA) REFERENCES PERSONAS(ID),
	FOREIGN KEY (ID_CUENTA) REFERENCES CUENTAS_BANCO(ID)
);

/*==============================================================*/
/* Table: ELEMENTOS                                             */
/*==============================================================*/
create table ELEMENTOS (
   ID                   INT4                 not null,
   ID_RECOLECCION       INT4                 not null,
   NOMBRE               VARCHAR(15)          not null,
   CANTIDAD             INT4                 not null,
   primary key (ID),
   FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCIONES(ID)
);

/*==============================================================*/
/* Table: MATERIALES                                            */
/*==============================================================*/
create table MATERIALES (
   ID                   INT4                 not null,
   ID_RECOLECCION       INT4                 null,
   ID_APOYO             INT4                 null,
   ID_EVENTO            INT4                 null,
   ID_VOLUNTARIADO      INT4                 null,
   NOMBRE               VARCHAR(15)          not null,
   CANTIDAD             INT4                 not null,
   primary key (ID),
   FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCIONES(ID),
   FOREIGN KEY (ID_APOYO) REFERENCES APOYOS_ECONOMICOS(ID),
   FOREIGN KEY (ID_EVENTO) REFERENCES EVENTOS(ID),
   FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADOS(ID)
);

/*==============================================================*/
/* Table: OBJETIVOS_DE_AYUDA                                     */
/*==============================================================*/
create table OBJETIVOS_DE_AYUDA (
   ID                   INT4                 not null,
   ID_RECOLECCION       INT4                 null,
   ID_APOYO             INT4                 null,
   ID_EVENTO            INT4                 null,
   ID_VOLUNTARIADO      INT4                 null,
   DESCRIPCION          VARCHAR(100)         not null,
   primary key (ID),
   FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCIONES(ID),
   FOREIGN KEY (ID_APOYO) REFERENCES APOYOS_ECONOMICOS(ID),
   FOREIGN KEY (ID_EVENTO) REFERENCES EVENTOS(ID),
   FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADOS(ID)
);

/*==============================================================*/
/* Table: COMENTARIOS                                            */
/*==============================================================*/
create table COMENTARIOS (
  	ID		               INT4			         	 not null,
    ID_MURO          	   INT4                not null,
    ID_USUARIO           INT4 	   			     not null,
    DESCRIPCION			     VARCHAR(140)		     not null,
    primary key (ID),
    FOREIGN KEY (ID_MURO) REFERENCES MUROS(ID),
    FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID) 
);


/*==============================================================*/
/* Trigger: noborrar()                                          */
/*==============================================================*/

CREATE OR REPLACE FUNCTION noborrar()
  RETURNS trigger AS
$BODY$
BEGIN
  UPDATE USUARIOS SET visible=false WHERE id=OLD.id;
  RETURN NULL;
END; $BODY$
  LANGUAGE plpgsql;

CREATE TRIGGER delete_trg
  BEFORE DELETE
  ON USUARIOS
  FOR EACH ROW
  EXECUTE PROCEDURE public.noborrar();


/*==============================================================*/
/* Stored Procedure: avanceApoyoEconomico()                     */
/*==============================================================*/
CREATE OR REPLACE FUNCTION avanceApoyoEconomico(id INT) 
    RETURNS void AS $$
    BEGIN
      UPDATE APOYOS_ECONOMICOS SET RECAUDACION_ACTUAL = (SELECT SUM(monto) FROM DONACIONES WHERE DONACIONES.ID_CUENTA = (SELECT ID_CUENTA FROM APOYOS_ECONOMICOS WHERE APOYOS_ECONOMICOS.ID=$1 )) WHERE APOYOS_ECONOMICOS.ID=$1;
      UPDATE APOYOS_ECONOMICOS SET avance = 100*Cast ( (SELECT RECAUDACION_ACTUAL FROM APOYOS_ECONOMICOS WHERE APOYOS_ECONOMICOS.ID = $1) as decimal(50,17) ) /(SELECT META FROM APOYOS_ECONOMICOS WHERE APOYOS_ECONOMICOS.ID = $1) WHERE APOYOS_ECONOMICOS.ID=$1;
    END;
    $$ LANGUAGE plpgsql;    


/*==============================================================*/
/* Stored Procedure: avanceRecoleccion()                        */
/*==============================================================*/
CREATE OR REPLACE FUNCTION avanceRecoleccion(id INT) 
    RETURNS void AS $$
    BEGIN
      UPDATE RECOLECCIONES SET avance = 100*Cast((SELECT sum(elementos.cantidad) FROM elementos WHERE elementos.id_recoleccion=$1) AS decimal(5,3) ) / (SELECT ELEMENTOSNECESARIOS FROM RECOLECCIONES WHERE RECOLECCIONES.ID = $1) WHERE RECOLECCIONES.ID=$1;
    END;
    $$ LANGUAGE plpgsql;

    
-- tabla con la cantidad total de elementos por cada EVENTOS de RECOLECCIONES
-- SELECT RECOLECCIONES.id,sum(elementos.cantidad) FROM RECOLECCIONES, elementos WHERE RECOLECCIONES.id=elementos.id_recoleccion GROUP BY RECOLECCIONES.id


/*==============================================================*/
/* Stored Procedure: avanceVoluntariado()                       */
/*==============================================================*/
CREATE OR REPLACE FUNCTION avanceVoluntariado(id INT)
RETURNS void AS $$
    BEGIN
  UPDATE VOLUNTARIADOS SET avance = 100 * Cast(( SELECT COUNT(*) FROM PERSONAS WHERE PERSONAS.id_voluntariado=$1) AS decimal(5,3) ) / (SELECT PERSONAS FROM VOLUNTARIADOS WHERE VOLUNTARIADOS.ID = $1) WHERE VOLUNTARIADOS.ID=$1;
    END;
    $$ LANGUAGE plpgsql;
-- select avanceVoluntariado(1)



/*==============================================================*/
/* Stored Procedure: avanceEvento()                       */
/*==============================================================*/
CREATE OR REPLACE FUNCTION avanceEvento(id INT)
RETURNS void AS $$
    BEGIN
  UPDATE EVENTOS SET avance = 100 * Cast(( SELECT SUM(ACTIVIDADES.RECAUDACION) FROM ACTIVIDADES WHERE ACTIVIDADES.ID_EVENTO=$1) AS decimal(5,3) ) / (SELECT META FROM EVENTOS WHERE EVENTOS.ID = $1) WHERE VOLUNTARIADOS.ID=$1;
    END;
    $$ LANGUAGE plpgsql;

-- EVENTOS






































/*==============================================================*/
/* Table: COMENTARIOSMURO - INTERMEDIA                          */
/*==============================================================*/
-- create table COMENTARIOSMURO (
--  ID_COMENTARIO   INT4         not null,
--     ID_MURO            INT4                 not null,
--     FOREIGN KEY (ID_MURO) REFERENCES MURO(ID_MURO),
--     FOREIGN KEY (ID_COMENTARIO) REFERENCES COMENTARIOS(ID_COMENTARIO) 
-- );

-- /*==============================================================*/
-- /* Table: USUARIOARIOMEDIDA - INTERMEDIA                            */
-- /*==============================================================*/
-- create table USUARIOMEDIDA (
--  ID_USUARIO      INT4          not null,
--  ID_RECOLECCION       INT4                 null,
--     ID_APOYO             INT4                 null,
--     ID_EVENTO            INT4                 null,
--     ID_VOLUNTARIADO      INT4                 null,
--     VALIDA          BOOLEAN              not null,     
--     FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID_MEDIDA),
--     FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCIONES(ID_RECOLECCION),
--     FOREIGN KEY (ID_APOYO) REFERENCES APOYOS_ECONOMICOS(ID_APOYO),
--     FOREIGN KEY (ID_EVENTO) REFERENCES EVENTOS(ID_EVENTO),
--     FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADOS(ID_VOLUNTARIADO)    
-- );

-- /*==============================================================*/
-- /* Table: USUARIOMEDIDAGENERA - INTERMEDIA                      */
-- /*==============================================================*/
-- create table USUARIOMEDIDAGENERA (
--  ID_USUARIO      INT4          not null,
--  ID_RECOLECCION       INT4                 null,
--     ID_APOYO             INT4                 null,
--     ID_EVENTO            INT4                 null,
--     ID_VOLUNTARIADO      INT4                 null,      
--     FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID_MEDIDA),
--     FOREIGN KEY (ID_RECOLECCION) REFERENCES RECOLECCIONES(ID_RECOLECCION),
--     FOREIGN KEY (ID_APOYO) REFERENCES APOYOS_ECONOMICOS(ID_APOYO),
--     FOREIGN KEY (ID_EVENTO) REFERENCES EVENTOS(ID_EVENTO),
--     FOREIGN KEY (ID_VOLUNTARIADO) REFERENCES VOLUNTARIADOS(ID_VOLUNTARIADO)    
-- );

-- CREATE OR REPLACE FUNCTION avanceApoyoEconomico(id INT) 
--     RETURNS void AS $$
--     BEGIN
--       UPDATE APOYOS_ECONOMICOS SET APOYOS_ECONOMICOS = (SELECT SUM(monto) FROM DONACIONES WHERE DONACIONES.ID = $1) WHERE APOYOS_ECONOMICOS.ID=$1;
--       UPDATE APOYOS_ECONOMICOS SET avance = 100*Cast ( (SELECT RECAUDACION_ACTUAL FROM APOYOS_ECONOMICOS WHERE APOYOS_ECONOMICOS.ID = $1) as decimal(5,3) ) /(SELECT META FROM APOYOS_ECONOMICOS WHERE APOYOS_ECONOMICOS.ID = $1) WHERE APOYOS_ECONOMICOS.ID=$1;
--     END;
--     $$ LANGUAGE plpgsql;
