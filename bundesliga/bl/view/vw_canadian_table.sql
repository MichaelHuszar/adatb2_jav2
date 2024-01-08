create or replace view vw_canadian_table as
       select     p.player_name,
                  t.team_name,
                  (p.player_goals + p.player_assists) as canadian_points
       from       player p
       inner join team t
       on         p.team_id = t.id
       where      (p.player_goals + p.player_assists) > 0 and p.dml_flag <> 'D'
       order by   canadian_points desc;

