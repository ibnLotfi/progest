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
   /**
    * Liste des projet d'un propriétaire.
    * @param type $idpersonne
    * @return type liste
    */
   public static function getProprietaireProjet($idpersonne) {
      $db = DB::getConnection();
       $sql = "SELECT *
            FROM projet where id_proprietaire = :idpersonne ";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idpersonne", $idpersonne);
      $ok = $stmt->execute();
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
   }
   /**
    * Récuperer un projet
    * @param type $idprojet
    * @return type une ligne
    */
   public static function getUnProjet($idprojet) {
      $db = DB::getConnection();
      
      $sql = "SELECT *
            FROM projet where id_projet = :idprojet ";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idprojet", $idprojet);
      $ok = $stmt->execute();
      return $stmt->fetch(PDO::FETCH_ASSOC);
   }
   /**
    * Création d'un projet
    * @param type $titre
    * @param type $date_limite
    * @param type $sujet
    * @param type $idproprietaire
    * @param type $idpromotion
    * @return type
    */
   public static function setProjet($titre,$date_limite,$sujet,$idproprietaire, $idpromotion) {
      $db = DB::getConnection();
      
      $sql = "insert into projet (id_proprietaire,titre,date_creation_projet,date_limite,sujet,id_promotion)
              values(:idproprietaire,:titre,:date_creation_projet,:date_limite,:sujet,:idpromotion)";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idproprietaire", $idproprietaire);
      $stmt->bindValue(":titre", $titre);
      $stmt->bindValue(":date_creation_projet", date("Y-m-d"));
      $stmt->bindValue(":date_limite", $date_limite);
      $stmt->bindValue(":sujet", $sujet);
      $stmt->bindValue(":idpromotion", $idpromotion);
      $ok = $stmt->execute();
      return $ok;
   }
   /**
    * Mise a jour d'information d'un projet.
    * @param type $idprojet
    * @param type $titre
    * @param type $date_limite
    * @param type $sujet
    * @return type
    */
  public static function updateProjet($idprojet,$titre,$date_limite,$sujet) {
      $db = DB::getConnection();
      
      $sql = "UPDATE projet SET titre = :titre, date_limite = :date_limite, sujet = :sujet 
          where id_projet = :ipdprojet ";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idprojet", $idprojet);
      $stmt->bindValue(":titre", $titre);
      $stmt->bindValue(":date_limite", $date_limite);
      $stmt->bindValue(":sujet", $sujet);
      $ok = $stmt->execute();
      return $ok;
   }
}

?>