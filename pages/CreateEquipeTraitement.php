
<?php

require_once("../model/equipe_model.php");


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$titre=$_POST["titre"];
$CommentaireOptionnel=$_POST["CommentaireOptionnel"];
$idprojet=$_POST["projetChoisie"];
$Var="test";
//$idprojet=$_POST["idprojet"];
//Equipe::setEquipe($idprojet, $idproprietaire, $commentaire)

//$ll = $_SESSION["user"]["idprojet"];

//echo $idprojet;
echo $titre;
echo $CommentaireOptionnel;
echo $idprojet;

//foreach($projets as $projet) {
//echo $projet.'<br/>';
//}


