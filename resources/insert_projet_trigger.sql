/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Stéphane
 * Created: 8 mars 2019
 * update: 20190308 by CCU
 */

--installe le trigger lié à la fonction insert_projet
create TRIGGER insert_projet_trigger 
before insert on projet for each row
execute procedure insert_projet();
