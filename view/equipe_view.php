<?php $PromotionConcernee = ' CDI8' ?>
<form action="CreateEquipeTraitement.php" method="post">
    <table>

        <p>Titre :<input type="text" name="titre" />  </p>
        <p>Commentaire optionnel : <input type="text" name="CommentaireOptionnel" /> </p>
        <p>Session de formation concernée :<?php echo $PromotionConcernee ?> </p>
        <p>Projet choisie : 
       
       <SELECT name="projetChoisie" size="1">
                    <?php
                foreach ($lesProjetsPromotion as $unProjet) {
                    ?>
           
           <OPTION <?php echo 'value ="'.$unProjet['id_projet'].'"'?>> <?php echo "" . $unProjet['titre']; ?> <?php echo "" . $unProjet['sujet']; ?></option>
           
                     <?php
    }
?>
        </SELECT>
            </p>
            

        <p><input type="submit" value="OK"></p>
        

    </table>
</form>
