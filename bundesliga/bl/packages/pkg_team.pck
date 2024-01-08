create or replace package pkg_team is

  exc_team_not_found_code constant number := -20005;
  exc_team_not_found exception;
  pragma exception_init(exc_team_not_found, -20005);
  exc_team_exists_code constant number := -20006;
  exc_team_exists exception;
  pragma exception_init(exc_team_exists, -20006);
  
  procedure add_team(t_name   in   varchar,
                     s_id  in   number,
                     t_wins         in  number,
                     t_draws        in  number,
                     t_losses       in  number);
    
  procedure update_team(t_id      in  number,
                     t_name   in   varchar,
                     s_id  in   number,
                     t_wins         in  number,
                     t_draws        in  number,
                     t_losses       in  number);
                     
  procedure delete_team (t_id  in  number);

end pkg_team;
/
create or replace package body pkg_team is

procedure add_team(t_name   in   varchar,
                     s_id  in   number,
                     t_wins         in  number,
                     t_draws        in  number,
                     t_losses       in  number) is
   val_id number;
    begin
    begin
      select t.id
      into val_id
      from team t
      where t.team_name = t_name;
      
      if sql%found
        then
          raise exc_team_exists;
      end if;
      
      exception
      when no_data_found then
        insert into team
        ( id ,
        team_name,
        stadium_id,
        wins,
        draws,
        losses ,
        cr_time,
        cr_user,
        last_mod_time,
        last_mod_user,
        dml_flag ,
        version )
         values
         (null,
         t_name,
         s_id,
         t_wins,
         t_draws,
         t_losses ,
         null,
         null,
         null,
         null,
         null,
         1);
      end;
      end add_team;
      
   procedure update_team(t_id      in  number,
                     t_name   in   varchar,
                     s_id  in   number,
                     t_wins         in  number,
                     t_draws        in  number,
                     t_losses       in  number) is
                           
                           val_p_id number;
    begin
    begin
       select t.id
      into val_p_id
      from team t
      where t.id = t_id;
      
      if sql%found
        then
                     update team t set
                   t.team_name = t_name,
                   t.wins = t_wins,
                   t.draws = t_draws,
                   t.losses = t_losses,
                   t.stadium_id = s_id
                   where t.id = t_id;

      end if;
      
      exception
        when no_data_found
          then
          raise exc_team_not_found;
          
        end;     
   end update_team;
   
   procedure delete_team (t_id  in  number) is
     val_team_id number;
     begin
      update team t set t.dml_flag = 'D'
          where t.id = t_id and t.dml_flag <> 'D';
       
      if sql%rowcount = 0
        then
          raise exc_team_not_found;
        end if;
  end delete_team;
      
end pkg_team;
/
