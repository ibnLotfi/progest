<?php
//echo '<br> <br> ceci est le controller etudiant';

require_once("../model/personne_model.php");
// A cree

$lesProjets= Member::getProjet($_SESSION["user"]["id_personne"]);
var_dump($lesProjets);
include "../view/etudiant_view.php";
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

