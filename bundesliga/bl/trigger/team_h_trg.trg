create or replace trigger team_h_trg
       before insert or update or delete on team
       for each row
begin
       if deleting
       then
         insert into team_h
             (id,
             team_name,
             stadium_id,
             wins,
             draws,
             losses,
             cr_time,
             cr_user,
             last_mod_time,
             last_mod_user,
             dml_flag,
             version)
         values
             (:old.id,
             :old.team_name,
             :old.stadium_id,
             :old.wins,
             :old.draws,
             :old.losses,
             sysdate,
             sys_context('USERENV', 'OS_USER'),
             sysdate,
             sys_context('USERENV', 'OS_USER'),
             'D',
             :old.version + 1);
       else     
       :new.last_mod_user := sys_context('USERENV', 'OS_USER');
       :new.last_mod_time := sysdate;
       if inserting
          then
            if :new.id is null
            then
              :new.id := seq_team.nextval;
            end if;
         insert into team_h
             (id,
             team_name,
             stadium_id,
             wins,
             draws,
             losses,
             cr_time,
             cr_user,
             last_mod_time,
             last_mod_user,
             dml_flag,
             version)
         values
             (:new.id,
             :new.team_name,
             :new.stadium_id,
             :new.wins,
             :new.draws,
             :new.losses,
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
         insert into team_h
             (id,
             team_name,
             stadium_id,
             wins,
             draws,
             losses,
             cr_time,
             cr_user,
             last_mod_time,
             last_mod_user,
             dml_flag,
             version)
         values
             (:new.id,
             :new.team_name,
             :new.stadium_id,
             :new.wins,
             :new.draws,
             :new.losses,
             sysdate,
             sys_context('USERENV', 'OS_USER'),
             sysdate,
             sys_context('USERENV', 'OS_USER'),
             :new.dml_flag,
             :new.version);
          
         end if;
         end if;
end;                     
            
       
       
/
