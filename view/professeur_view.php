<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="static/auction.css"/>
        <title>Espace Formateur </title>
    </head>
    <body>
        <?php
        // Header shared by all pages
        require_once("header.php");
        ?>
        <!-- affichage d'un message perosnnalisé  -->
        <h1 align="center">Espace Formateur  </h1>
        
        
        <!-- affichage d'es informations sur l'étudiant  -->
        <h2 align="center">Bienvenue <?php echo "".$_SESSION['user']['prenom'] . " " . $_SESSION['user']['nom']; ?></h2>
        <div class ="info">
<!--            <p> Nom : <?php echo $_SESSION['user']['nom']; ?> Prenom: <?php echo $_SESSION['user']['prenom']; ?> </p><br> -->
            <p> <?php echo $_SESSION['user']['adresse'] . ' ' . $_SESSION['user']['ville'] . ' ' . $_SESSION['user']['cp']; ?> </p><br>
            <p> Téléphone : <?php echo $_SESSION['user']['tel']." "."ou"." ".$_SESSION['user']['portable']; ?></p>
            
            <br>
        </div>
        
        <!-- affichage des projets s'il y en a  -->
        <div class="projet">
            
            
            <?php
            if (!isset($lesProjets) || empty($lesProjets)) {
                echo "<p>Vous n'avez créé aucun projet</p>";
            } else {

            ?>
            <a href="../pages/projet_controller.php"><span style="border:1px solid black;"><b>Créer un projet</b></span></a>
             <br>
             <br>
            <table>
             <thead>
		<tr>
			<th align="center">Titre du projet</th>
			<th align="center">Date de création</th>
			<th align="center">Date limite</th>
                        <th align="center">Sujet</th>
                        <th align="center" colspan="3">Equipes du projet</th>
		</tr>
                <tr>
                    <td>     </td>
                    <td>     </td>
                    <td>     </td>
                    <td>     </td>
                    <td>Equipe numero</td>
                    <td>Date de création</td>
                    <td>Commentaire</td>
                </tr>
            </thead>
            <?php 
                foreach ($lesProjets as $unProjet){
                   
                    ?>
                 
                <tr>
                    <?php $id = $unProjet['id_projet']; ?>
                    <td align="center"><a href=""><?php  echo "".$unProjet['titre']; ?></a></td>
                <td align="center"><?php echo "".$unProjet['date_creation_projet']; ?></td>
                <td align="center"><?php echo "".$unProjet['date_limite']; ?></td>
                <td align="center"><?php echo ''.$unProjet['sujet']; ?></td>
                <td>     </td>
                <td>     </td>
                <td>     </td>
                <td><input type="submit" name="modifier" value="Modifier le projet" />
                </td> 
                
                <tr>
                <?php if(isset($unProjet['id_equipe']) ) {
                       foreach ($lesProjets as $unProjet) {
                        if($unProjet['id_projet']==$id) {
                           ?>
                    <tr>
                        <td>     </td>
                        <td>     </td>
                        <td>     </td>
                        <td>     </td>
                        <td align="center"><?php echo "" . $unProjet['id_equipe']; ?></td>
                        <td align="center"><?php echo "" . $unProjet['date_creation_equipe']; ?></td>
                        <td><?php echo "" . $unProjet['commentaire'];  ?></td>
                        <td>     </td>
                    </tr>
                     
                    <?php
                    //var_dump($id);
                       }
                       }
                       }
                    ?>
                                


                <?php
            }}
            ?>
                
            </table>
        </div>
        
        <h3>Voici la liste des équipes</h3>
        
        
        
        <!-- affichage des équipes s'il y en a  -->

    <div class="equipe">
            
            
            <?php
            if (!isset($lesEquipes) || empty($lesEquipes)) {
                echo "<p>Il n'y a pas d'équipes</p>";
            } else {

            ?>
            <input type="submit" name="voir" value="Voir elèves sans projet" />
             <br>
             <br>
            <table>
             <thead>
		<tr>
			<th>N°de l'équipe</th>
			<th>Date de création</th>
                        <th>Commentaire</th>
                        
		</tr>
            </thead>
            <?php 
                foreach ($lesEquipes as $uneEquipe){
                    
                    ?>
                <tr>
                <td><?php echo "".$uneEquipe['id_equipe']; ?></td>
                <td><?php echo "".$uneEquipe['date_creation_equipe']; ?></td>
                <td><?php echo "".$unProjet['commentaire']; ?></td>
               
                
                <td><input type="submit" name="modifier" value="Modifier le projet" />
                </td>
                
                </tr>


                <?php
            }}
            ?>
            </table>
        </div>
        <h3>Voici la liste des membres sans équipe</h3>
        
        <!-- affichage des membres sans équipe  -->

    <div class="membre">
            
            
            <?php
            if (!isset($lesMembres) || empty($lesMembres)) {
                echo "<p>Il n'y a pas de membres</p>";
            } else {

            ?>
            <input type="submit" name="voir" value="Voir elèves sans projet" />
             <br>
             <br>
            <table>
             <thead>
		<tr>
			<th>Prénom</th>
			<th>Nom</th>
			<th>Promotion</th>
                        <th>Ses projets</th>
		</tr>
            </thead>
            <?php 
                foreach ($lesProjets as $unProjet)
                    
                    ?>
                <tr>
                <td><?php echo "".$unProjet['titre']; ?></td>
                <td><?php echo "".$unProjet['date_creation_projet']; ?></td>
                <td><?php echo "".$unProjet['date_limite']; ?></td>
                <td><?php echo ''.$unProjet['sujet']; ?></td>
                
                <td><input type="submit" name="modifier" value="Modifier le projet" />
                </td>
                
                </tr>


                <?php
            }
            ?>
            </table>
        </div>