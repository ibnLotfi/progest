<?php
session_start();
require_once("../view/index_view.php");
?>
<form action="etudiant_controller.php" method="post">
    <table>
        
        <tr><td> <p>Titre :<td> <input type="text" name="titre" /></td></p> </td></tr>
        <tr><td> <p>Propriétaire :<td> <input type="text" name="propriétaire" /></td></p></td></tr>
        <tr><td> <p>Date de création :<td> <input type="text" name="dateDeCreation" /></td></p> </td> </tr>
        <tr><td> <p>Date limite de rendu : <td><input type="text" name="dateLimiteDeRendu" /></td></p></td></tr>
        <tr><td> <p>Sujet : <td><input type="text" name="sujet" /></p></td></tr>
        <tr><td> <p>Session de formation concernée :<td> <input type="text" name="sessionDeFormation" /></td></p></td></tr>
        <tr><td> <p><input type="submit" value="OK"></p></td></tr>

    </table>
</form>