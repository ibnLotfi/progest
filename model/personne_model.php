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

    public static function getProjetProf($idpersonne) {
        $db = DB::getConnection();

        $sql = "SELECT *
            FROM projet where id_proprietaire = :idpersonne ";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idpersonne", $idpersonne);
      $ok = $stmt->execute();
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
   }
   public static function getMembrePromo($idpersonne) {
      $db = DB::getConnection();
      
      $sql = "SELECT *
            FROM personne where id_personne in (select id_personne from membre_promotion where id_promotion = (select id_promotion from membre_promotion where id_personne = :idpersonne)) ";
      $stmt = $db->prepare($sql);
      $stmt->bindValue(":idpersonne", $idpersonne);
      $ok = $stmt->execute();
      return $stmt->fetchAll(PDO::FETCH_ASSOC);
   }
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
     */
    public static function getMemberSansEquipe() {
        $db = DB::getConnection();
        $sql1 = "SELECT * FROM personne WHERE ID_personne NOT IN (select id_personne FROM membre_equipe) ";
        $stmt = $db->prepare($sql1);
        $stmt->bindValue(":idpersonne", $idpersonne);
        $ok = $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

}

?>
