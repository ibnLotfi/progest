<?php

require_once("DB.php");

/** Access to the person table.
 * Put here the methods like getBySomeCriteriaSEarch */
class Promotion {

    /** Get promotion data for id $id_personne
     * @param int $id_personne of the member to be retrieved
     * @return associative_array table row
     */
    public static function getPromotion($idpersonne) {
        $db = DB::getConnection();
        $sql = "SELECT *
              FROM membre_promotion
              WHERE id_personne = :idpersonne ";
        $stmt = $db->prepare($sql);
        $stmt->bindValue(":idpersonne", $idpersonne);
        $ok = $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

}

?>