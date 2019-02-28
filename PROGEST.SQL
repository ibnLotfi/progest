-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                           PostgreSQL
--                        (28/2/2019 13:52:24)
-- -----------------------------------------------------------------------------
--      Nom de la base : progest
--      Projet : Accueil Win'Design V17_00
--      Auteur : Jean-philippe Stephane
--      Date de dernière modification : 28/2/2019 13:51:08
-- -----------------------------------------------------------------------------

drop database progest;
-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE progest;

-- -----------------------------------------------------------------------------
--       TABLE : PERSONNE
-- -----------------------------------------------------------------------------

CREATE TABLE PERSONNE
   (
    IDPERSONNE serial NOT NULL  ,
    NOM text NOT NULL  ,
    PRENOM text NOT NULL  ,
    ADRESSE text NOT NULL  ,
    VILLE text NOT NULL  ,
    CP char(5) NOT NULL  ,
    TEL text NOT NULL  ,
    PORTABLE text NULL  ,
    EMAIL text NULL unique  ,
    MDP text NULL  ,
    ETREPROF bool NULL  
,   CONSTRAINT PK_PERSONNE PRIMARY KEY (IDPERSONNE)
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : EQUIPE
-- -----------------------------------------------------------------------------

CREATE TABLE EQUIPE
   (
    IDPROJET int4 NOT NULL  ,
    IDEQUIPE serial NOT NULL  ,
    IDPERSONNE int4 NULL  ,
    DATECREATIONEQUIPE date NOT NULL  ,
    COMMENTAIRE text NULL  
,   CONSTRAINT PK_EQUIPE PRIMARY KEY (IDPROJET, IDEQUIPE)
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EQUIPE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EQUIPE_PROJET
     ON EQUIPE (IDPROJET)
    ;

CREATE  INDEX I_FK_EQUIPE_PERSONNE
     ON EQUIPE (IDPERSONNE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : PROMOTION
-- -----------------------------------------------------------------------------

CREATE TABLE PROMOTION
   (
    IDPROMOTION serial NOT NULL  ,
    ANNEE text NULL  
,   CONSTRAINT PK_PROMOTION PRIMARY KEY (IDPROMOTION)
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : PROJET
-- -----------------------------------------------------------------------------

CREATE TABLE PROJET
   (
    IDPROJET serial NOT NULL  ,
    IDPERSONNE int4 NULL  ,
    IDPROMOTION int4 NOT NULL  ,
    TITRE text NULL  ,
    DATECREATIONPROJ date NOT NULL  ,
    DATELIMITE date NULL  ,
    SUJET text NULL  
,   CONSTRAINT PK_PROJET PRIMARY KEY (IDPROJET)
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PROJET
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_PROJET_PERSONNE
     ON PROJET (IDPERSONNE)
    ;

CREATE  INDEX I_FK_PROJET_PROMOTION
     ON PROJET (IDPROMOTION)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : INSCRIRE
-- -----------------------------------------------------------------------------

CREATE TABLE INSCRIRE
   (
    IDPROMOTION int4 NOT NULL  ,
    IDPERSONNE int4 NOT NULL  
,   CONSTRAINT PK_INSCRIRE PRIMARY KEY (IDPROMOTION, IDPERSONNE)
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE INSCRIRE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_INSCRIRE_PROMOTION
     ON INSCRIRE (IDPROMOTION)
    ;

CREATE  INDEX I_FK_INSCRIRE_PERSONNE
     ON INSCRIRE (IDPERSONNE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : MEMBRE
-- -----------------------------------------------------------------------------

CREATE TABLE MEMBRE
   (
    IDPERSONNE int4 NOT NULL  ,
    IDPROJET int4 NOT NULL  ,
    IDEQUIPE int4 NOT NULL  
,   CONSTRAINT PK_MEMBRE PRIMARY KEY (IDPERSONNE, IDPROJET, IDEQUIPE)
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE MEMBRE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_MEMBRE_PERSONNE
     ON MEMBRE (IDPERSONNE)
    ;

CREATE  INDEX I_FK_MEMBRE_EQUIPE
     ON MEMBRE (IDPROJET, IDEQUIPE)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE EQUIPE ADD 
     CONSTRAINT FK_EQUIPE_PROJET
          FOREIGN KEY (IDPROJET)
               REFERENCES PROJET (IDPROJET);

ALTER TABLE EQUIPE ADD 
     CONSTRAINT FK_EQUIPE_PERSONNE
          FOREIGN KEY (IDPERSONNE)
               REFERENCES PERSONNE (IDPERSONNE);

ALTER TABLE PROJET ADD 
     CONSTRAINT FK_PROJET_PERSONNE
          FOREIGN KEY (IDPERSONNE)
               REFERENCES PERSONNE (IDPERSONNE);

ALTER TABLE PROJET ADD 
     CONSTRAINT FK_PROJET_PROMOTION
          FOREIGN KEY (IDPROMOTION)
               REFERENCES PROMOTION (IDPROMOTION);

ALTER TABLE INSCRIRE ADD 
     CONSTRAINT FK_INSCRIRE_PROMOTION
          FOREIGN KEY (IDPROMOTION)
               REFERENCES PROMOTION (IDPROMOTION);

ALTER TABLE INSCRIRE ADD 
     CONSTRAINT FK_INSCRIRE_PERSONNE
          FOREIGN KEY (IDPERSONNE)
               REFERENCES PERSONNE (IDPERSONNE);

ALTER TABLE MEMBRE ADD 
     CONSTRAINT FK_MEMBRE_PERSONNE
          FOREIGN KEY (IDPERSONNE)
               REFERENCES PERSONNE (IDPERSONNE);

ALTER TABLE MEMBRE ADD 
     CONSTRAINT FK_MEMBRE_EQUIPE
          FOREIGN KEY (IDPROJET, IDEQUIPE)
               REFERENCES EQUIPE (IDPROJET, IDEQUIPE);


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------