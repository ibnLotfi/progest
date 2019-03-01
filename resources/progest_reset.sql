-- procedure stocké progest_reset

--call progest_reset('2019-03-01');

CREATE OR REPLACE PROCEDURE progest_reset(v_datetime date)
LANGUAGE plpgsql
AS $$
BEGIN
    --IF v_datetime IS NULL THEN
	--	SET v_datetime = NOW();
	--END IF;
	-- Disable temporarily foreign key constraints
	--SET FOREIGN_KEY_CHECKS=0;
	TRUNCATE TABLE personne restart identity cascade;
	TRUNCATE TABLE promotion restart identity cascade;
	TRUNCATE TABLE projet restart identity cascade;
	TRUNCATE TABLE equipe restart identity cascade;
	TRUNCATE TABLE membre_equipe restart identity cascade;	
	TRUNCATE TABLE membre_promotion restart identity cascade;

	
	-- Enable again foreign key constraints
	--SET FOREIGN_KEY_CHECKS=1;
	--START TRANSACTION;
	INSERT INTO public.personne (id_personne, nom, prenom, adresse, ville, cp, tel, portable, email, mdp, etreprof) 
	VALUES 
	(1, 'Dupont', 'Julien', ' 2 rue Paul Vaillant Couturier', 'Cachan', '94230', '01874512', '06874512', 'jdupont@gmail.com', 'false', NULL),
	(2, 'Fortin', 'Marc', ' 5 rue des Pommiers', 'Vitry', '94400', '01563212', '06454512', 'mfortin@gmail.com', 'false', NULL),
	(3, 'Lerin', 'Julie', ' 21 rue des Fleurs', 'Vitry', '94400', '012178210', '06457513', 'jlerin@yahoo.fr', 'false', NULL),
	(4, 'Gerat', 'Pierre', ' 45 avenue  Pasteur ', 'Alfortvile', '94140', '012478218', '06357517', 'pgerat@yahoo.fr', 'false', NULL),
	(5, 'Detap', 'Gerard', ' 30 avenue Cesar ', 'Alfortville', '94140', '014478218', '06357519', 'gdetap@yahoo.fr', 'false', NULL),
	(6, 'Moulin', 'Kevin', ' 25 rue des fées ', 'Orly', '94310', '013478278', '06352319', 'kmoulin@yahoo.fr', 'false', NULL),
	(7, 'Suza', 'Marion', ' 10 rue Albert Einstein ', 'Paris', '75003', '013278778', '064352819', 'msuza@yahoo.fr', 'false', NULL),
	(8, 'Vrit', 'Didier', ' 56 rue du pain perdu ', 'Paris', '75003', '013778778', '0643572819', 'dvrit@gmail.com', 'false', NULL),
	(9, 'Famat', 'Vivian', ' 26 rue des perdraux ', 'draveil', '91210', '013478768', '0643572518', 'vfamat@gmail.com', 'false', NULL),
	(10, 'Dortp', 'Jules', ' 30 avenue Henri Barbusse ', 'Draveil', '91210', '013478758', '0643772518', 'jdorpt@gmail.com', 'false', NULL),
	(11, 'Darc', 'Bobi', ' 10 rue du president Wilson', 'Draveil', '91210', '013468758', '0643773518', 'bdarc@gmail.com', 'false', NULL),
	(12, 'Durand', 'Bernard', ' 10 rue des canards', 'Paris', '7500 ', '013468768', '0643772518', 'bdurand@gmail.com', 'true', NULL),
	(13, 'Satin', 'Paul', ' 10 rue des piverts', 'Paris', '7500 ', '013368768', '0643782518', 'psatin@gmail.com', 'true', NULL),
	(14, 'Vurap', 'Jean', ' 24 rue des moineaux', 'Paris', '75006', '013468764', '0613762518', 'jvurap@yahoo.fr', 'true', NULL),
	(15, 'bmk', 'issam', ' 30 rue des chevaux', 'Paris', '75008', '0125478956', '0713762518', 'bissam@yahoo.fr', 'false', NULL);

	
	INSERT INTO public.promotion (id_promotion,annee) 
	VALUES 
	(1,v_datetime),
	(2,v_datetime);	
	
	
	
	
	INSERT INTO public.projet (id_projet, titre, date_Creation_Projet, dateLimite, sujet, id_promotion) 
	VALUES 
	(1, 'PROJET 1', v_datetime, v_datetime+interval '5 months','php',1),
	(2, 'PROJET 2', v_datetime-interval '3 months', v_datetime+interval '3 months','java',1),
	(3, 'PROJET 3', v_datetime+interval '2 months', v_datetime+interval '5 months','C#',1),
	(4, 'PROJET 4', v_datetime-interval '10 months', v_datetime-interval '2 months', 'python',2);

	
	
	-----------------------------------------------------------------------------------------------------------------
	--					remplissage de la table  equipe													   --							
	-----------------------------------------------------------------------------------------------------------------
	
	
	
	--equipe 1 (id_equipe=1) du projet 1
	INSERT INTO public.equipe (id_equipe,id_projet,date_Creation_Equipe,commentaire,id_proprietaire) VALUES (1,1,v_datetime,'équipes alpha Projet 1',1);	
	--equipe 2 (id_equipe=2) du projet 1
	INSERT INTO public.equipe (id_equipe,id_projet,date_Creation_Equipe,commentaire,id_proprietaire) VALUES (2,1,v_datetime,'équipes beta Projet 1',4);
	
	
	--equipe 1 (id_equipe=3) du projet 2
	INSERT INTO public.equipe (id_equipe,id_projet,date_Creation_Equipe,commentaire,id_proprietaire) VALUES (3,2,v_datetime-interval '2 months','equipe partiellement attribué',7);
	
	
	--equipe 1 (id_equipe=3) du projet 4
	INSERT INTO public.equipe (id_equipe,id_projet,date_Creation_Equipe,commentaire,id_proprietaire) VALUES (4,4,v_datetime-interval '2 months','equipes completement attribué et fini',1);
	--equipe 2 (id_equipe=3) du projet 4
	INSERT INTO public.equipe (id_equipe,id_projet,date_Creation_Equipe,commentaire,id_proprietaire) VALUES (5,4,v_datetime-interval '10 months','equipes completement attribué et fini',4);
	
	
	
	
	-----------------------------------------------------------------------------------------------------------------
	--					remplissage de la table  membre_equipe													   --							
	-----------------------------------------------------------------------------------------------------------------
	
	
	--membres de l'equipe 1 (id_equipe=1) du projet 1
	INSERT INTO public.membre_equipe (id_personne,id_projet,id_equipe) 
	VALUES 
	(1,1,1),
	(2,1,1),
	(3,1,1);
	
	
	--membres de l'equipe 2 (id_equipe=2) du projet 1
	INSERT INTO public.membre_equipe (id_personne,id_projet,id_equipe) 
	VALUES
	(4,1,2),
	(5,1,2),
	(6,1,2);
	
	
	--membres de l'equipe 1 (id_equipe=3) du projet 2
	INSERT INTO public.membre_equipe (id_personne,id_projet,id_equipe) 
	VALUES 
	(7,2,3),
	(8,2,3),
	(9,2,3);
	
	
	--membres de l'equipe 1 (id_equipe=4) du projet 4
	INSERT INTO public.membre_equipe (id_personne,id_projet,id_equipe)
	VALUES 
	(1,4,4),
	(2,4,4),
	(3,4,4);
	
	
	--membres de l'equipe 2 (id_equipe=5) du projet 4
	INSERT INTO public.membre_equipe (id_personne,id_projet,id_equipe) 
	VALUES 
	(4,4,5),
	(5,4,5),
	(6,4,5);


	
	
	-----------------------------------------------------------------------------------------------------------------
	--					remplissage de la table  membre_promotion													   --							
	-----------------------------------------------------------------------------------------------------------------
	
	
	
	INSERT INTO public.membre_promotion (id_promotion,id_personne) 
	VALUES 
	(1,1),
	(1,2),
	(1,3),
	(1,4),
	(1,5),
	(1,6),
	(1,7),
	(1,8),
	(1,9),
	(2,10),
	(2,11);
	
END;
$$;
