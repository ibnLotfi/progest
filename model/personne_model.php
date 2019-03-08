<?php

require_once("DB.php");

/** Access to the person table.
 * Put here the methods like getBySomeCriteriaSEarch */
class Member {

    /** Get member data for id $member_id
     * @param int $member_id id of the member to be retrieved
     * @return associative_array table row
     */
    public static function get($idpersonne) {
        $db = DB::getConnection();
        $sql = "SELECT *
              FROM personne
              WHERE Idpersonne = :idpersonne";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":idpersonne", $idpersonne);
        $ok = $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    /**
     * Validation du compte et mot de passe
     * @param type $login
     * @param type $password
     * @return type
     */
    public static function getByLoginPassword($login, $password) {
        $db = DB::getConnection();
        // We should use an encoded password, like PASSWORD(password)
        // in the WHERE clause
        $sql = "SELECT *
            FROM personne
            WHERE email = :email AND mdp = :password";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":email", $login);
        $stmt->bindValue(":password", $password);
        $ok = $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    /**
     * Liste des projet d'une promotion
     * @param type $idpersonne
     * @return type
     */
    public static function getProjet($idpersonne) {
        $db = DB::getConnection();
        $sql = "SELECT *
            FROM projet where id_promotion = (select id_promotion from membre_promotion
            WHERE id_personne = :idpersonne )";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":idpersonne", $idpersonne);
        $ok = $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    /**
     * Liste des projet d'un propriétaire.
     * @param type $idpersonne
     * @return type
     */
    public static function getProjetProf($idpersonne) {
        $db = DB::getConnection();

        //$sql = "SELECT * FROM projet where id_proprietaire = :idpersonne ";
        $sql = "SELECT distinct (e.id_equipe),e.*,p.* FROM projet p INNER JOIN membre_equipe m ON m.id_projet = p.id_projet INNER JOIN equipe e ON m.id_projet = e.id_projet WHERE p.id_proprietaire = :idpersonne ";
        
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idpersonne", $idpersonne);
      $ok = $stmt->execute();
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
   }
   /**
    * Liste des membre de la promotion d'un membre.
    * @param type $idpersonne
    * @return type liste
    */
   public static function getMembrePromo($idpersonne) {
      $db = DB::getConnection();
      
      $sql = "SELECT *
            FROM personne where id_personne in (select id_personne from membre_promotion where id_promotion = (select id_promotion from membre_promotion where id_personne = :idpersonne)) ";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idpersonne", $idpersonne);
      $ok = $stmt->execute();
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
   }
   /**
    * Liste des projet d'une personne
    * @param type $idpersonne
    * @return boolean liste
    */
   public static function estMembreProjet($idpersonne) {
      $db = DB::getConnection();
      
      $sql = "SELECT *
             FROM membre_promotion WHERE id_personne = :idpersonne ";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idpersonne", $idpersonne);
      $ok = $stmt->execute();
      if (empty($ok)) {
      return false;
   }
      return true;
      }
     /**
      * Liste des projet avec les equipes d'une personne
      * @param type $idpersonne
      * @return type Liste
      */  
    
    public static function getProjetjointure($idpersonne) {
        $db = DB::getConnection();
        $sql1 = "SELECT * FROM projet INNER JOIN membre_equipe ON membre_equipe.id_projet = projet.id_projet INNER JOIN equipe ON membre_equipe.id_projet = equipe.id_projet WHERE membre_equipe.id_personne = :idpersonne ";
        $stmt = $db->prepare($sql1);
        $stmt->bindValue(":idpersonne", $idpersonne);
        $ok = $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    /**
     * Membre sans equipe
     * @return type Liste
     */
    public static function getMemberSansEquipe() {
        $db = DB::getConnection();
        $sql1 = "SELECT nom,prenom,annee FROM personne  natural join membre_promotion natural join promotion WHERE id_personne NOT IN (select id_personne FROM membre_equipe) and etre_prof=false";
        $stmt = $db->prepare($sql1);
        
        $ok = $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

}

?>
