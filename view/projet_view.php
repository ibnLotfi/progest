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
        <form method="POST" action="projet_controller.php?action=submit">
            <label for="titre">titre</label>
            <input type="text" name="titre" id = "titre" required=""><br><br>
            <label for="sujet">Sujet</label>
            <textarea name="sujet" id="sujet" rows="5" cols="33" ></textarea><br><br>
            
            <label for="dateLimite">Date Limite</label>
            <input type="date" name='dateLimite' id="dateLimite"><br><br>
            <label for="promotion">Promotion</label>
            <select name="promotion" required="">
                <option>Selectionner une annee </option>
                <?php foreach ($lesPromotions as $p){ ?>
                <option value="<?php echo $p['id_promotion']; ?>"><?php echo $p['annee']; ?></option>
                        
                <?php }?>
            </select>
            <input type ="submit" value="envoyer">
        </form>
    </body>
</html>
