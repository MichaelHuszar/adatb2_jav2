CREATE TABLE player_h(
       id                    number,
       player_name           varchar2(250 char),
       player_birth_date     date,
       player_goals          number,
       player_assists        number,
       player_nationality    varchar2(250 char),
       player_position       varchar2(250 char),
       cr_time               date,
       cr_user               varchar2(250 char),
       last_mod_time         date,
       last_mod_user         varchar2(250 char),
       dml_flag              char (1),
       version               number 
)tablespace users;
