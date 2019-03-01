-- procedure stocké progest_reset

CREATE OR REPLACE PROCEDURE progest_reset(v_datetime datetime)
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
	START TRANSACTION;
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
	
	
	
	
	INSERT INTO public.projet (id_projet, titre, date_Creation_Projet, dateLimite, sujet) 
	VALUES 
	(1, "PROJET 1", v_datetime, v_datetime+interval '5 months',"php"),
	(2, "PROJET 2", v_datetime-interval '3 months', v_datetime+interval '3 months',"java");
	(3, "PROJET 3", v_datetime+interval '2 months', v_datetime+interval '5 months',"C#");
	(4, "PROJET 4", v_datetime-interval '10 months', v_datetime-interval '2 months', "python");

	
	
	-----------------------------------------------------------------------------------------------------------------
	--					remplissage de la table  equipe													   --							
	-----------------------------------------------------------------------------------------------------------------
	
	
	
	--equipe 1 (id_equipe=1) du projet 1
	INSERT INTO public.equipe (id_equipe,date_Creation_Equipe,commentaire) VALUES (1,v_datetime,"équipes alpha Projet 1");	
	--equipe 2 (id_equipe=2) du projet 1
	INSERT INTO public.equipe (id_equipe,date_Creation_Equipe,commentaire) VALUES (2,v_datetime,"équipes beta Projet 1");
	
	
	--equipe 1 (id_equipe=3) du projet 2
	INSERT INTO public.equipe (id_equipe,date_Creation_Equipe,commentaire) VALUES (3,v_datetime-interval '2 months',"equipe partiellement attribué");
	
	
	--equipe 1 (id_equipe=3) du projet 4
	INSERT INTO public.equipe (id_equipe,date_Creation_Equipe,commentaire) VALUES (4,v_datetime-interval '2 months',"equipes completement attribué et fini ");
	--equipe 2 (id_equipe=3) du projet 4
	INSERT INTO public.equipe (id_equipe,date_Creation_Equipe,commentaire) VALUES (5,v_datetime-interval '10 months',"equipes completement attribué et fini ");
	
	
	
	
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






--v_datetime DATETIME



--exemple de procedure mySQL --
/*CREATE PROCEDURE auction_reset(v_datetime DATETIME)
BEGIN
	IF v_datetime IS NULL THEN
		SET v_datetime = NOW();
	END IF;
	-- Disable temporarily foreign key constraints
	SET FOREIGN_KEY_CHECKS=0;
	TRUNCATE TABLE bid;
	TRUNCATE TABLE product;
	TRUNCATE TABLE member;
	TRUNCATE TABLE category;
	-- Enable again foreign key constraints
	SET FOREIGN_KEY_CHECKS=1;

	START TRANSACTION;
	INSERT INTO category (category_id, label) VALUES
	(1, 'Comics'),
	(2, 'CD');

	INSERT INTO member (member_id, email, password, name, first_name, address, zip, city) VALUES
	(1, 'haddock@moulinsart.be', 'capitaine', 'Haddock', 'Archibald', 'Chateau de Moulinsart', '01234', 'Moulinsart'),
	(2, 'bianca.castafiore@scala.it', 'ah je ris', 'Castafiore', 'Bianca', 'Théâtre de la Scala', '09876', 'Milan'),
	(3, 'tournesol@moulinsart.be', 'un peu plus à l''ouest', 'Tournesol', 'Tryphon', 'Château de Moulinsart', '01234', 'Moulinsart'),
	(4, 'lampion@mondass.fr', 'Signez là', 'Lampion', 'Séraphin', '34 rue des jobards', '01234', 'Moulinsart'),
	(5, 'nestor@moulinsart.be', 'Loch Lomond', '?', 'Nestor', 'Château de Moulinsart', '01234', 'Moulinsart');


	INSERT INTO product (product_id, description, floor_price, deadline, auction_price, entry_date, 
	seller_id, category_id) VALUES
	(1, 'Le temple du soleil', 10.0, v_datetime + INTERVAL 1 DAY, 8.0, v_datetime - INTERVAL 10 DAY, 1, 1),
	(2, 'Les bijoux de la Castafiore', 12.0, v_datetime + INTERVAL 1 DAY, 10.0, v_datetime - INTERVAL 6 DAY, 2, 1),
	(3, 'Coke en stock', 11.0, v_datetime, 10.0, v_datetime - INTERVAL 5 DAY, 3, 1),
	(4, 'Les picaros', 11.5, v_datetime - INTERVAL 1 DAY, 10.0, v_datetime - INTERVAL 5 DAY, 3, 1),
	(5, 'Le tournoi des 3 licornes', 18.0, v_datetime - INTERVAL 1 DAY, 15.0, v_datetime - INTERVAL 8 DAY, 1, 1),
	(6, 'Mafalda', 12.0, v_datetime, 11.0, v_datetime - INTERVAL 5 DAY, 3, 1),
	(7, 'Köln concert', 12.0, v_datetime, 11.0, v_datetime - INTERVAL 4 DAY, 1, 2);

	INSERT INTO bid (bid_id, amount, effect_time, bidder_id, product_id) VALUES
	(1, 11.0, v_datetime - INTERVAL 8 DAY, 2, 1),
	(2, 12.0, v_datetime - INTERVAL 7 DAY, 3, 1),
	(3, 13.0, v_datetime - INTERVAL 7 DAY + INTERVAL 1 HOUR, 2, 1),
	(4, 14.0, v_datetime - INTERVAL 6 DAY, 4, 1),
	(5, 15.0, v_datetime - INTERVAL 4 DAY, 2, 1),
	(6, 16.0, v_datetime - INTERVAL 2 DAY, 3, 1),

	(7, 21.0, v_datetime - INTERVAL 5 DAY, 3, 2),
	(8, 22.0, v_datetime - INTERVAL 4 DAY, 1, 2),
	(9, 22.5, v_datetime - INTERVAL 3 DAY, 3, 2),
	(10, 25.0, v_datetime - INTERVAL 2 DAY, 1, 2),

	(11, 12.0, v_datetime - INTERVAL 4 DAY, 1, 3),
	(12, 12.1, v_datetime - INTERVAL 3 DAY, 2, 3),
	(13, 12.6, v_datetime - INTERVAL 2 DAY, 1, 3),
	(14, 13.0, v_datetime - INTERVAL 2 DAY + INTERVAL 2 HOUR, 2, 3),

	(15, 10.5, v_datetime - INTERVAL 4 DAY, 1, 4),
	(16, 11.0, v_datetime - INTERVAL 3 DAY, 2, 4),
	(17, 11.5, v_datetime - INTERVAL 2 DAY, 4, 4),
	(18, 12.5, v_datetime - INTERVAL 2 DAY + INTERVAL 1 HOUR, 1, 4),
	(19, 13.0, v_datetime - INTERVAL 1 DAY, 2, 4),

	(20, 15.5, v_datetime - INTERVAL 7 DAY, 3, 5),
	(21, 16.5, v_datetime - INTERVAL 6 DAY, 2, 5),
	(22, 17.0, v_datetime - INTERVAL 5 DAY, 4, 5);

	COMMIT;
END$$

*/