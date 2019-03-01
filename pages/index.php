<?php
session_start();
require_once("../view/index_view.php");

if (isset($_SESSION["user"])) {
           // $nom = $_SESSION["user"] ;
            //echo "Bienvenue ".$_SESSION["user"]["prenom"];
           // if($_SESSION["user"])
            require_once("../pages/etudiant_controller.php");
           
            }
            else{
                 echo "vous etes deconnecter";
            }