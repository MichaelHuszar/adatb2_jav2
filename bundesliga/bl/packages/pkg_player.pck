create or replace package pkg_player is

  exc_player_not_found_code constant number := -20001;
  exc_player_not_found exception;
  pragma exception_init(exc_player_not_found, -20001);
  
  exc_player_exists_code constant number := -20002;
  exc_player_exists exception;
  pragma exception_init(exc_player_exists, -20002);  
  
  function get_players_from_team (v_team_id number) return ty_player_l;
  
  function get_player (v_player_id number) return ty_player;
  
  procedure add_player(p_name in varchar2,
                       player_bdate in date,
                       player_goals in number,
                       player_assists in number,
                       player_nationality in varchar2,
                       player_position in varchar2,
                       t_id in number);
    
  procedure update_player(p_id in number,
                       p_goals in number,
                       p_assists in number,
                       t_id in number);
 
 procedure delete_player (p_id  in  number);
  
end pkg_player;
/
create or replace package body pkg_player is

 
   function get_players_from_team (v_team_id number) return ty_player_l
       is lt_players ty_player_l;
       begin
         
       select ty_player(player_id   => p.id,
                        player_name => p.player_name,
                        team_id     => p.team_id,
                        team_name   => t.team_name)
       bulk collect
       into lt_players
       from player p
       join team t
       on p.team_id = t.id
       where p.team_id = v_team_id AND p.dml_flag <> 'D';
       
       return lt_players;
       
   end get_players_from_team;
   
   function get_player (v_player_id number) return ty_player
     is v_player ty_player;
     begin
       
        select ty_player(player_id   => p.id,
                        player_name => p.player_name,
                        team_id     => p.team_id,
                        team_name   => t.team_name)
         into v_player
         from player p
         join team t
         on p.team_id = t.id
         where p.id = v_player_id and p.dml_flag <> 'D';
         
           exception    
     when no_data_found then
       raise exc_player_not_found; 
       
      return v_player;
      
      end get_player;
      
      
    procedure add_player(p_name in varchar2,
                       player_bdate in date,
                       player_goals in number,
                       player_assists in number ,
                       player_nationality in varchar2,
                       player_position in varchar2,
                       t_id in number) is
    
    
    val_id number;
    begin
    begin
      select p.id
      into val_id
      from player p
      where p.player_name = p_name;
      
      if sql%found
        then
          raise exc_player_exists;
      end if;
      
      exception
      when no_data_found then
        insert into player
        (id,
         player_name,
         player_birth_date,
         player_goals,
         player_assists,
         player_nationality,
         player_position,
         team_id,
         cr_time,
         cr_user,
         last_mod_time,
         last_mod_user,
         dml_flag,
         version)
         values
         (null,
         p_name,
         player_bdate,
         player_goals,
         player_assists,
         player_nationality,
         player_position,
         t_id,
         null,
         null,
         null,
         null,
         null,
         1);
      end;
      
   end add_player;   
      
      procedure update_player(p_id in number,
                       p_goals in number,
                       p_assists in number,
                       t_id in number) is
    val_p_id number;
    begin
    begin
      select p.id
      into val_p_id
      from player p
      where p.id = p_id;
      
      if sql%found
        then
                     update player p set
                   p.player_goals = p_goals,
                   p.player_assists = p_assists,
                   p.team_id = t_id
                   where p.id = p_id;

      end if;
      
      exception
        when no_data_found
          then
          raise exc_player_not_found;
          
        end;
     end update_player;
     
           procedure delete_player (p_id  in  number) is
     val_player_id number;
     begin

          update player p set p.dml_flag = 'D'
          where p.id = p_id and p.dml_flag <> 'D';
       
      if sql%rowcount = 0
        then
          raise exc_player_not_found;
        end if;
          
  end delete_player;
  
  
     
end pkg_player;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
      
      
      
     
  
       
       
/
