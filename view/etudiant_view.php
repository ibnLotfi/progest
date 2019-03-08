<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="static/auction.css"/>
        <title>Projet collaboratif</title>
    </head>

    <?php
    // Header shared by all pages
    require_once("header.php");
    ?>
    <!-- affichage d'un message perosnnalisé  -->
    <h1>Espace membre etudiant  </h1>

    <div class="bouton">
        <p>
            <a href="CreateEquipe">Bouton</a>
        </p>
    </div>
    <!-- affichage d'es informations sur l'étudiant  -->
    <p>Bienvenue <?php echo "" . $_SESSION['user']['nom'] . " " . $_SESSION['user']['prenom']; ?></p>
    <div class ="info">
<!--            <p> Nom : <?php echo $_SESSION['user']['nom']; ?> Prenom: <?php echo $_SESSION['user']['prenom']; ?> </p><br> -->
        <p> Adresse: <?php echo $_SESSION['user']['adresse'] . ' ' . $_SESSION['user']['ville'] . ' ' . $_SESSION['user']['cp']; ?> </p><br>
        <p> téléphone fixe : <?php echo $_SESSION['user']['tel']; ?></p>
        <p> téléphone portable : <?php echo $_SESSION['user']['portable']; ?></p>
        <br>
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
                
                
                foreach ($lesProjets as $unProjet) {
                    
                    //$idProj = $unProjet['id_projet'];
                    // $unProjet['id_projet'];
                    ?>
                    <tr>
                    <?php $id = $unProjet['id_projet']; ?> 
                        <td><?php echo "Titre : " . $unProjet['titre']; ?></td>
                        <td><?php echo "Date de création : " . $unProjet['date_creation_projet']; ?></td>
                        <td><?php echo "Date de fin : " . $unProjet['date_limite'];  ?></td>
                        <td><?php echo "Sujet : ". $unProjet['sujet']; ?></td>
                    </tr>
                    <!--  Ici nous avons une boucle afin d'ajouter les equipes uniquement si elles existent    -->
                   <?php if(isset($unProjet['id_equipe'])) {
                       foreach ($lesProjets as $unProjet) { 
                           if($unProjet['id_projet']==$id) {
                           
                       ?>
                    <tr>
                        <td>     </td>
                        <td><?php echo "Equipe numero : " . $unProjet['id_equipe']; ?></td>
                        <td><?php echo "" . $unProjet['date_creation_equipe']; ?></td>
                        <td><?php echo "" . $unProjet['commentaire'];  ?></td>
                    </tr>
                    <?php 
                           }
                       }
                       }
                    ?>
                    <?php
                    }
}
?>
        </table>
    </div>