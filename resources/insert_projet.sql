/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Stéphane
 * Created: 8 mars 2019
 */

-- fonction permettant de retourner le dernier id incrémenté de la table projet
create or replace function insert_projet() returns trigger as
$$
    begin
        new.id_projet = next_index_projet();
        return new;
    end;
$$
language plpgsql;
    

