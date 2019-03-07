<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        session_start();
        if (isset($_GET["action"]) && $_GET["action"] = "submit") {
            require_once '../model/projet_model.php';
            Projet::setProjet($_POST["titre"], $_POST["dateLimite"], $_POST["sujet"], $_SESSION['user']['id_personne'],$_POST['promotion']);
            header("location: professeur_controller.php");
        } else {
            require_once '../model/promotion_model.php';
            $lesPromotions = Promotion::getPromotion($_SESSION['user']['id_personne']);
            include '../view/projet_view.php';
        }
        ?>
    </body>
</html>
