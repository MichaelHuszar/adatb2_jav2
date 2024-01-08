create or replace package pkg_stadium is

  exc_stadium_not_found_code constant number := -20003;
  exc_stadium_not_found exception;
  pragma exception_init(exc_stadium_not_found, -20003);
  exc_stadium_exists_code constant number := -20004;
  exc_stadium_exists exception;
  pragma exception_init(exc_stadium_exists, -20004);
  
  procedure add_stadium(s_name      in   varchar2,
                        stadium_capacity  in    varchar2,
                        stadium_city     in   varchar2);
    
  procedure update_stadium(st_id  in number,
                           s_name      in   varchar2,
                           s_capacity   in varchar2,
                           s_city      in  varchar2);
                           
   procedure delete_stadium (st_id  in  number);

end pkg_stadium;
/
create or replace package body pkg_stadium is

procedure add_stadium(s_name       in   varchar2,
                        stadium_capacity  in    varchar2,
                        stadium_city      in    varchar2) is
   val_id number;
    begin
    begin
      select s.id
      into val_id
      from stadium s
      where s.stadium_name = s_name;
      
      if sql%found
        then
          raise exc_stadium_exists;
      end if;
      
      exception
      when no_data_found then
        insert into stadium
        ( id ,
        stadium_name ,
        stadium_capacity,
        stadium_city,
        cr_time,
        cr_user,
        last_mod_time,
        last_mod_user,
        dml_flag ,
        version )
         values
         (null,
         s_name,
         stadium_capacity,
         stadium_city ,
         null,
         null,
         null,
         null,
         null,
         1);
      end;
      end add_stadium;
      
 procedure update_stadium(st_id  in number,
                           s_name        in  varchar2,
                           s_capacity   in   varchar2,
                           s_city      in    varchar2) is
                           
                           val_p_id number;
    begin
    begin
       select s.id
      into val_p_id
      from stadium s
      where s.id = st_id;
      
      if sql%found
        then
                     update stadium s set
                   s.stadium_capacity = s_capacity,
                   s.stadium_name = s_name,
                   s.stadium_city = s_city
                   where s.id = st_id;

      end if;
      
      exception
        when no_data_found
          then
          raise exc_stadium_not_found;
          
        end;     
   end update_stadium;
   
      procedure delete_stadium (st_id  in  number) is
     val_stadium_id number;
     begin
     update stadium s set s.dml_flag = 'D'
         where s.id = st_id and s.dml_flag <> 'D';
       
      if sql%rowcount = 0
        then
          raise exc_stadium_not_found;
        end if;
          
  end delete_stadium;
   
      
end pkg_stadium;
/
