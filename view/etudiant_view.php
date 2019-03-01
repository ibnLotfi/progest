<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="static/auction.css"/>
        <title>Projet collaboratif</title>
    </head>
    <body>
        <?php
        // Header shared by all pages
        require_once("header.php");
        ?>
        <!-- affichage d'un message perosnnalisé  -->
        <h1>Espace membre etudiant de la promotion <?php echo $promotion;?> </h1>
        
        
        <!-- affichage d'es informations sur l'étudiant  -->
        <p>Bienvenue <?php echo "".$_SESSION['user']['nom'] . " " . $_SESSION['user']['prenom']; ?></p>
        <div class ="info">
            <p> Nom : <?php echo $_SESSION['user']['nom']; ?> Prenom: <?php echo $_SESSION['user']['prenom']; ?> </p><br> 
            <p> Adresse: <?php echo $_SESSION['user']['adresse'] . ' ' . $_SESSION['user']['ville'] . ' ' . $_SESSION['user']['cp']; ?> </p><br>
            <p> tel : <?php echo $_SESSION['user']['tel'] . '' . $_SESSION['user']['portable']; ?></p>

        </div>
        
        <!-- affichage des projets s'il y en a  -->
        <div class="projet">
            <?php
            if (!isset($lesProjets) || empty($lesProjets)) {
                echo "<p>Vous n'avez aucun projet</p>";
            } else {

            ?>
            <table>
            <?php 
                foreach ($lesProjets as $unProjet)
                    
                    ?>
                <tr>
                <td><?php echo "".$unProjet['titre']; ?></td>
                <td><?php echo "".$unProjet['dateCreationProjet']; ?></td>
                <td><?php echo "".$unProjet['dateLimite']; ?></td>
                <td><?php echo ''.$unProjet['sujet']; ?></td>
                
                
                </tr>


                <?php
            }
            ?>
            </table>
        </div>

