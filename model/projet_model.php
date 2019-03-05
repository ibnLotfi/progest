<?php
require_once("DB.php");

/** Access to the equipe table.
 * Put here the methods like getBySomeCriteriaSEarch */
class Projet {

   /** Get equipe data for id $idpersonne
    * @param int $idpersonne 
    * @return associative_array table row
    */
   public static function getProjetAll() {
      $db = DB::getConnection();
      $sql = "SELECT *
              FROM projet ";
      $stmt = $db->prepare($sql);
      $ok = $stmt->execute();
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
   }
   
   
}

?>