
<?php
session_start();

require_once("../model/equipe_model.php");


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//$titre=$_POST["titre"];
$commentaire=$_POST["CommentaireOptionnel"];
$idprojet=$_POST["projetChoisie"];
$idproprietaire =$_SESSION["user"]["id_personne"];


Equipe::setEquipe($idprojet, $idproprietaire, $commentaire);

echo $idproprietaire."<br>";
echo $commentaire."<br>";
echo $idprojet."<br>";



