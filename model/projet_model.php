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
   
   public static function getProprietaireProjet($idpersonne) {
      $db = DB::getConnection();
       $sql = "SELECT *
            FROM projet where id_proprietaire = :idpersonne ";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idpersonne", $idpersonne);
      $ok = $stmt->execute();
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
   }
   
   public static function getUnProjet($idprojet) {
      $db = DB::getConnection();
      
      $sql = "SELECT *
            FROM projet where id_projet = :idprojet )";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idprojet", $idprojet);
      $ok = $stmt->execute();
      return $stmt->fetch(PDO::FETCH_ASSOC);
   }
   public static function setProjet($idprojet) {
      $db = DB::getConnection();
      
      $sql = "SELECT *
            FROM projet where id_projet = :idprojet )";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idprojet", $idprojet);
      $ok = $stmt->execute();
      return $ok;
   }
   public static function upProjet($idprojet) {
      $db = DB::getConnection();
      
      $sql = "SELECT *
            FROM projet where id_projet = :idprojet )";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idprojet", $idprojet);
      $ok = $stmt->execute();
      return $ok;
   }
}

?>