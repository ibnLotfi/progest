<?php
echo '<br> <br> ceci est le controller etudiant';

// A cree 
$promotion = Promotion::get($_SESSION["user"]["id"]);
// A cree
$lesProjets=Projet::get();
include "../view/etudiant_view.php";
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

