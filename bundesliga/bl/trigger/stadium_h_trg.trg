create or replace trigger stadium_h_trg
       before insert or update or delete on stadium
       for each row
begin
       if deleting
       then
         insert into stadium_h
             (id,
             stadium_name,
             stadium_capacity,
             stadium_city,
             cr_time,
             cr_user,
             last_mod_time,
             last_mod_user,
             dml_flag,
             version)
         values
             (:old.id,
             :old.stadium_name,
             :old.stadium_capacity,
             :old.stadium_city,
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
              :new.id := seq_stadium.nextval;
            end if;
         insert into stadium_h
             (id,
             stadium_name,
             stadium_capacity,
             stadium_city,
             cr_time,
             cr_user,
             last_mod_time,
             last_mod_user,
             dml_flag,
             version)
         values
             (:new.id,
             :new.stadium_name,
             :new.stadium_capacity,
             :new.stadium_city,
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
         insert into stadium_h
             (id,
             stadium_name,
             stadium_capacity,
             stadium_city,
             cr_time,
             cr_user,
             last_mod_time,
             last_mod_user,
             dml_flag,
             version)
         values
             (:new.id,
             :new.stadium_name,
             :new.stadium_capacity,
             :new.stadium_city,
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
