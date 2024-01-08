CREATE TABLE team_h(
       id             number,
       team_name      varchar(250 char),
       stadium_id     number not null,
       wins           number,
       draws          number,
       losses         number,
       cr_time        date,
       cr_user        varchar2(250 char),
       last_mod_time  date,
       last_mod_user  varchar2(250 char),
       dml_flag       char (1),
       version        number 
)tablespace users;
