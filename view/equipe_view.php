<?php $PromotionConcernee=' CDI8'?>
<form action="etudiant_controller.php" method="post">
    
    <br>
    <table>
        
         <p>Titre :<input type="text" name="titre" />  </p>
         <p>Propriétaire :<input type="text" name="propriétaire" /> </p>
         <p>Commentaire optionnel : <input type="text" name="CommentaireOptionnel" /> </p>
         <p>Session de formation concernée :<?php echo $PromotionConcernee ?> </p>
         <p><input type="submit" value="OK"></p>

    </table>
</form>