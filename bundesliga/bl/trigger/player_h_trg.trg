create or replace trigger player_h_trg
       before insert or update or delete on player
       for each row
begin
       if deleting
       then
         insert into player_h
             (id,
             player_name,
             player_birth_date,
             player_goals,
             player_assists,
             player_nationality,
             player_position,
             cr_time,
             cr_user,
             last_mod_time,
             last_mod_user,
             dml_flag,
             version)
         values
             (:old.id,
             :old.player_name,
             :old.player_birth_date,
             :old.player_goals,
             :old.player_assists,
             :old.player_nationality,
             :old.player_position,
             :old.cr_time,
             :old.cr_user,
             sysdate,
             sys_context('USERENV', 'OS_USER'),
             'D',
             :old.version+1);
       else     
       :new.last_mod_user := sys_context('USERENV', 'OS_USER');
       :new.last_mod_time := sysdate;
       if inserting
          then
            if :new.id is null
            then
              :new.id := seq_player.nextval;
            end if;
            insert into player_h
             (id,
             player_name,
             player_birth_date,
             player_goals,
             player_assists,
             player_nationality,
             player_position,
             cr_time,
             cr_user,
             last_mod_time,
             last_mod_user,
             dml_flag,
             version)
         values
             (:new.id,
             :new.player_name,
             :new.player_birth_date,
             :new.player_goals,
             :new.player_assists,
             :new.player_nationality,
             :new.player_position,
             sysdate,
             sys_context('USERENV', 'OS_USER'),
             sysdate,
             sys_context('USERENV', 'OS_USER'),
             'I',
             1);
     else
             if :new.dml_flag <> 'D'
             then
               :new.dml_flag := 'U';
             end if;
         :new.version := :old.version + 1;
         insert into player_h
             (id,
             player_name,
             player_birth_date,
             player_goals,
             player_assists,
             player_nationality,
             player_position,
             cr_time,
             cr_user,
             last_mod_time,
             last_mod_user,
             dml_flag,
             version)
         values
             (:new.id,
             :old.player_name,
             :old.player_birth_date,
             :old.player_goals,
             :old.player_assists,
             :old.player_nationality,
             :old.player_position,
             :old.cr_time,
             :old.cr_user,
             sysdate,
             sys_context('USERENV', 'OS_USER'),
             :new.dml_flag,
             :new.version);
          
         end if;
         end if;
end;                     
            
       
       
/
