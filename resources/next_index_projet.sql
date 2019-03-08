/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Stéphane
 * Created: 8 mars 2019
 */

-- fonction permettant de retourner un trigger pour mettre en place l'incrementation 

create or replace function next_index_projet()  returns integer as
$$
    declare
        nb integer;
    begin
        select into nb max(id_projet) from projet;
        return nb+1;
    end;
$$
language plpgsql;

