<?php
require_once("DB.php");

/** Access to the equipe table.
 * Put here the methods like getBySomeCriteriaSEarch */
class Equipe {

   /** Get equipe data for id $idpersonne
    * @param int $idpersonne 
    * @return associative_array table row
    */
   public static function getEquipe($idpersonne) {
      $db = DB::getConnection();
      $sql = "SELECT *
              FROM equipe
              WHERE id_equipe in (select id_equipe from membre_equipe where id_personne = :idpersonne )";
      $stmt = $db->prepare($sql);
      
      $stmt->bindValue(":idpersonne", $idpersonne);
      $ok = $stmt->execute();
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
   }
    public static function getEquipeProjet($idprojet) {
      $db = DB::getConnection();
      $sql = "SELECT *
              FROM equipe
              WHERE id_projet = :idprojet";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idprojet", $idprojet);
      $ok = $stmt->execute();
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
   }
    public static function setEquipe($idprojet,$idproprietaire,$commentaire) { //,$date_Creation_Equipe
      $db = DB::getConnection();
      $sql = "insert into equipe (id_projet,id_proprietaire,date_Creation_Equipe,commentaire) 
          values (:idprojet,:idproprietaire,'2019-03-07',:commenataire";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idprojet", $idprojet);
      $stmt->bindValue(":idproprietaire", $idproprietaire);
      $stmt->bindValue(":commentaire", $commentaire);
      $ok = $stmt->execute();
      return $ok;
   }
   
}

?>