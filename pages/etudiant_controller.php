<?php
//echo '<br> <br> ceci est le controller etudiant';

require_once("../model/personne_model.php");
// A cree



//Ancienne requete sans jointure
//$lesProjets= Member::getProjet($_SESSION["user"]["id_personne"]);


/*  getProjetjointure --> c'est une méthode qui permet d'utiliser la requete avec une jointure
*   qui recupere tout les champs des tables membre_equipe, projet, et equipe
 * */
$lesProjets= Member::getProjetjointure($_SESSION["user"]["id_personne"]);


//var_dump($lesProjets);
include "../view/etudiant_view.php";
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

