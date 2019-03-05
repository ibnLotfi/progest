-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                           PostgreSQL
--                        (28/2/2019 14:17:43)
-- -----------------------------------------------------------------------------
--      Nom de la base : progest
--      Projet : Accueil Win'Design V17_00
--      Auteur : Jean-philippe Stephane
--      Date de dernière modification : 28/2/2019 14:17:11
-- -----------------------------------------------------------------------------

drop database progest;
-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE progest;
USE progest;
-- -----------------------------------------------------------------------------
--       TABLE : PERSONNE
-- -----------------------------------------------------------------------------

CREATE TABLE PERSONNE
   (
    ID_PERSONNE serial NOT NULL  ,
    NOM text NOT NULL  ,
    PRENOM text NOT NULL  ,
    ADRESSE text NOT NULL  ,
    VILLE text NOT NULL  ,
    CP char(5) NOT NULL  ,
    TEL text NOT NULL  ,
    PORTABLE text NULL  ,
    EMAIL text NULL unique ,
    MDP text NULL  ,
    ETRE_PROF bool NULL  
,   CONSTRAINT PK_PERSONNE PRIMARY KEY (ID_PERSONNE)
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : EQUIPE
-- -----------------------------------------------------------------------------

CREATE TABLE EQUIPE
   (
    ID_PROJET int4 NOT NULL  ,
    ID_EQUIPE serial NOT NULL  ,
    ID_PROPRIETAIRE int4 NULL  ,
    DATE_CREATION_EQUIPE date NOT NULL  ,
    COMMENTAIRE text NULL  
,   CONSTRAINT PK_EQUIPE PRIMARY KEY (ID_PROJET, ID_EQUIPE)
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EQUIPE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EQUIPE_PROJET
     ON EQUIPE (ID_PROJET)
    ;

CREATE  INDEX I_FK_EQUIPE_PERSONNE
     ON EQUIPE (ID_PROPRIETAIRE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : PROMOTION
-- -----------------------------------------------------------------------------

CREATE TABLE PROMOTION
   (
    ID_PROMOTION serial NOT NULL  ,
    ANNEE text NULL  
,   CONSTRAINT PK_PROMOTION PRIMARY KEY (ID_PROMOTION)
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : PROJET
-- -----------------------------------------------------------------------------

CREATE TABLE PROJET
   (
    ID_PROJET serial NOT NULL  ,
    ID_PROMOTION int4 NOT NULL  ,
    TITRE text NULL  ,
    DATE_CREATION_PROJET date NOT NULL  ,
    DATE_LIMITE date NULL  ,
    SUJET text NULL  ,
    ID_PROPRIETAIRE int4 NULL
,   CONSTRAINT PK_PROJET PRIMARY KEY (ID_PROJET)
   ) ;



-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PROJET
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_PROJET_PERSONNE
     ON PROJET (ID_PROPRIETAIRE)
    ;

CREATE  INDEX I_FK_PROJET_PROMOTION
     ON PROJET (ID_PROMOTION)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : MEMBRE_PROMOTION
-- -----------------------------------------------------------------------------

CREATE TABLE MEMBRE_PROMOTION
   (
    ID_PROMOTION int4 NOT NULL  ,
    ID_PERSONNE int4 NOT NULL  
,   CONSTRAINT PK_MEMBRE_PROMOTION PRIMARY KEY (ID_PROMOTION, ID_PERSONNE)
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE MEMBRE_PROMOTION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_MEMBRE_PROMOTION_PROMOTIO
     ON MEMBRE_PROMOTION (ID_PROMOTION)
    ;

CREATE  INDEX I_FK_MEMBRE_PROMOTION_PERSONNE
     ON MEMBRE_PROMOTION (ID_PERSONNE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : MEMBRE_EQUIPE
-- -----------------------------------------------------------------------------

CREATE TABLE MEMBRE_EQUIPE
   (
    ID_PERSONNE int4 NOT NULL  ,
    ID_PROJET int4 NOT NULL  ,
    ID_EQUIPE int4 NOT NULL  
,   CONSTRAINT PK_MEMBRE_EQUIPE PRIMARY KEY (ID_PERSONNE, ID_PROJET, ID_EQUIPE)
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE MEMBRE_EQUIPE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_MEMBRE_EQUIPE_PERSONNE
     ON MEMBRE_EQUIPE (ID_PERSONNE)
    ;

CREATE  INDEX I_FK_MEMBRE_EQUIPE_EQUIPE
     ON MEMBRE_EQUIPE (ID_PROJET, ID_EQUIPE)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE EQUIPE ADD 
     CONSTRAINT FK_EQUIPE_PROJET
          FOREIGN KEY (ID_PROJET)
               REFERENCES PROJET (ID_PROJET);

ALTER TABLE EQUIPE ADD 
     CONSTRAINT FK_EQUIPE_PERSONNE
          FOREIGN KEY (ID_PROPRIETAIRE)
               REFERENCES PERSONNE (ID_PERSONNE);

ALTER TABLE PROJET ADD 
     CONSTRAINT FK_PROJET_PERSONNE
          FOREIGN KEY (ID_PROPRIETAIRE)
               REFERENCES PERSONNE (ID_PERSONNE);

ALTER TABLE PROJET ADD 
     CONSTRAINT FK_PROJET_PROMOTION
          FOREIGN KEY (ID_PROMOTION)
               REFERENCES PROMOTION (ID_PROMOTION);

ALTER TABLE MEMBRE_PROMOTION ADD 
     CONSTRAINT FK_MEMBRE_PROMOTION_PROMOTION
          FOREIGN KEY (ID_PROMOTION)
               REFERENCES PROMOTION (ID_PROMOTION);

ALTER TABLE MEMBRE_PROMOTION ADD 
     CONSTRAINT FK_MEMBRE_PROMOTION_PERSONNE
          FOREIGN KEY (ID_PERSONNE)
               REFERENCES PERSONNE (ID_PERSONNE);

ALTER TABLE MEMBRE_EQUIPE ADD 
     CONSTRAINT FK_MEMBRE_EQUIPE_PERSONNE
          FOREIGN KEY (ID_PERSONNE)
               REFERENCES PERSONNE (ID_PERSONNE);

ALTER TABLE MEMBRE_EQUIPE ADD 
     CONSTRAINT FK_MEMBRE_EQUIPE_EQUIPE
          FOREIGN KEY (ID_PROJET, ID_EQUIPE)
               REFERENCES EQUIPE (ID_PROJET, ID_EQUIPE);


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------
