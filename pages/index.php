<?php

session_start();
require_once("../view/index_view.php");

if (isset($_SESSION["user"])) {
    // $nom = $_SESSION["user"] ;
    //echo "Bienvenue ".$_SESSION["user"]["prenom"];
    if ($_SESSION["user"]["etreprof"] == 0) {
        require_once("../pages/etudiant_controller.php");
    } 
    else {
        require_once("../pages/professeur_controller.php");
    }
}
else {
    echo "Vous etes deconnecter";
}