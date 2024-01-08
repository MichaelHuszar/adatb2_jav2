create or replace view vw_teams_biggest_stadiums as
       select     t.team_name,
                  s.stadium_name,
                  s.stadium_capacity,
                  s.stadium_city
       from       team t
       inner join stadium s
       on         t.stadium_id = s.id
       where      t.dml_flag <> 'D'
       order by   s.stadium_capacity desc;
              
