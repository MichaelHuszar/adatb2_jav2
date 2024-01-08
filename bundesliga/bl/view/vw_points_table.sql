create or replace view vw_points_table as
       select     team_name,
                  (wins + losses + draws) as matches_played,
                  (wins*3 + draws) as points,
                  wins,
                  draws,
                  losses
       from       team
       where      dml_flag <> 'D'
       order by   points desc;
       
