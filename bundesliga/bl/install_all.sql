PROMPT Installing DB...

-- Esetleg instlall logolás

-- Install sequences
@./sequence/seq_player.sql
@./sequence/seq_stadium.sql
@./sequence/seq_team.sql
-- Install tables
@./table/player.sql
@./table/stadium.sql
@./table/team.sql

@./audit/player_h.sql
@./audit/stadium_h.sql
@./audit/team_h.sql
-- Install types
@./type/ty_player.tps
@./type/ty_player_l.tps
-- Packes
@./packages/pkg_player.pck
@./packages/pkg_stadium.pck
@./packages/pkg_team.pck
-- Views
@./view/vw_canadian_table.sql
@./view/vw_points_table.sql
@./view/vw_teams_biggest_stadiums.sql
-- Triggers
@./triggers/player_h_trg.trg
@./triggers/stadium_h_trg.trg
@./triggers/team_h_trg.trg
-- Recompile schema
BEGIN
  dbms_utility.compile_schema(schema => 'bundesliga_manager');
END;
/

-- FK
@./alter/alter_player.sql
@./alter/alter_stadium.sql
@./alter/alter_team.sql
-- Tabla data
insert into stadium ( id,
       stadium_name,
       stadium_capacity,
       stadium_city,
       cr_time,
       cr_user,
       last_mod_time,
       last_mod_user,
       dml_flag,
       version
       )values(
       null,
       'BayArena',
       32500,
       'Leverkusen',
       null,
       null,
       null,
       null,
       null,
       null);

insert into stadium ( id,
       stadium_name,
       stadium_capacity,
       stadium_city,
       cr_time,
       cr_user,
       last_mod_time,
       last_mod_user,
       dml_flag,
       version
       )values(
       null,
       'Signal Iduna Park',
       81365,
       'Dortmund',
       null,
       null,
       null,
       null,
       null,
       null);

insert into stadium ( id,
       stadium_name,
       stadium_capacity,
       stadium_city,
       cr_time,
       cr_user,
       last_mod_time,
       last_mod_user,
       dml_flag,
       version
       )values(
       null,
       'Allianz Arena',
       72365,
       'München',
       null,
       null,
       null,
       null,
       null,
       null);

insert into team (
       id,
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
       values(
       null,
       'Leverkusen',
       1,
       5,
       1,
       0,
       null,
       null,
       null,
       null,
       null,
       null);

insert into team (
       id,
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
       values(
       null,
       'Dortmund',
       2,
       4,
       2,
       0,
       null,
       null,
       null,
       null,
       null,
       null);  
       
insert into team (
       id,
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
       values(
       null,
       'Bayern',
       3,
       3,
       1,
       2,
       null,
       null,
       null,
       null,
       null,
       null);
       
       
insert into player (
       id,
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
       version
) values (
       null,
       'Patrik Schick',
       to_date('1996-01-24','yyyy-mm-dd'),
       3,
       4,
       'Czech Republic',
       'Forward',
       1,
       null,
       null,
       null,
       null,
       null,
       null);
       
insert into player (
       id,
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
       version
) values (
       null,
       'Jeremie Frimpong',
       to_date('2000-01-24','yyyy-mm-dd'),
       5,
       9,
       'Holland',
       'Defender',
       1,
       null,
       null,
       null,
       null,
       null,
       null);
       
       
insert into player (
       id,
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
       version
) values (
       null,
       'Joshua Kimmich',
       to_date('2003-03-14','yyyy-mm-dd'),
       4,
       5,
       'Germany',
       'Defender',
       3,
       null,
       null,
       null,
       null,
       null,
       null);     


insert into player (
       id,
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
       version
) values (
       null,
       'Julian Brandt',
       to_date('1998-08-29','yyyy-mm-dd'),
       5,
       9,
       'Germany',
       'Midfielder',
       2,
       null,
       null,
       null,
       null,
       null,
       null);     
     
commit
PROMPT Done.
