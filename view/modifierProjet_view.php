<html>
<head>
<title>Formulaire modifie produit</title>
</head>
<body>

<?php echo validation_errors(); ?>

<?php echo form_open('Moncontroleur/modifier'); ?>
    
   <form>
<h5>Description</h5>
<input type="text" name="description" value="" size="50" />

<h5>Date de création</h5>
<input type="text" name="date_create" value="" size="50" />

<h5>Date de mise à jour</h5>
<input type="text" name="date_update" value="" size="50" />




<div><input type="submit" value="Valider" /></div>

</form>

</body>
</html>