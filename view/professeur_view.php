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
        <h1>Espace Professeur  </h1>
        
        
        <!-- affichage d'es informations sur l'étudiant  -->
        <p>Bienvenue <?php echo "".$_SESSION['user']['nom'] . " " . $_SESSION['user']['prenom']; ?></p>
        <div class ="info">
<!--            <p> Nom : <?php echo $_SESSION['user']['nom']; ?> Prenom: <?php echo $_SESSION['user']['prenom']; ?> </p><br> -->
            <p> Adresse: <?php echo $_SESSION['user']['adresse'] . ' ' . $_SESSION['user']['ville'] . ' ' . $_SESSION['user']['cp']; ?> </p><br>
            <p> téléphone fixe : <?php echo $_SESSION['user']['tel']; ?></p>
            <p> téléphone portable : <?php echo $_SESSION['user']['portable']; ?></p>
            <br>
        </div>
        
        <!-- affichage des projets s'il y en a  -->
        <div class="projet">
            <?php echo 'creer bouton créer projet'; ?>
            
            <?php
            if (!isset($lesProjets) || empty($lesProjets)) {
                echo "<p>Vous n'avez créé aucun projet</p>";
            } else {

            ?>
            <table>
            <?php 
                foreach ($lesProjets as $unProjet)
                    
                    ?>
                <tr>
                <td><?php echo "".$unProjet['titre']; ?></td>
                <td><?php echo "".$unProjet['date_creation_projet']; ?></td>
                <td><?php echo "".$unProjet['dateLimite']; ?></td>
                <td><?php echo ''.$unProjet['sujet']; ?></td>
                <td><?php echo 'creer bouton modifier'; ?></td>
                 <td><?php echo 'creer bouton supprimer'; ?></td>
                </tr>


                <?php
            }
            ?>
            </table>
        </div>
