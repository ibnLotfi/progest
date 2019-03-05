<?php
echo "vous etes sur la page controller professeur";
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once("../model/personne_model.php");

$lesProjets= Member::getProjetProf($_SESSION["user"]["id_personne"]);
//var_dump($lesProjets);
include "../view/professeur_view.php";
