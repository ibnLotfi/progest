<?php

session_start();
require_once("../view/index_view.php");
require_once("../model/promotion_model.php");
require_once("../model/personne_model.php");


//
//var_dump($_SESSION["user"]["id_personne"]);

$lesProjetsPromotion =Promotion::getProjetPromotion($_SESSION["user"]["id_personne"]);
//var_dump($lesProjetsPromotion);

//$PromotionConcernee =Promotion::getPromotion($_SESSION["user"]["id_personne"]);
//var_dump($PromotionConcernee);
//$PromotionConcernee = ' CDI78';


include "../view/equipe_view.php";
?>
