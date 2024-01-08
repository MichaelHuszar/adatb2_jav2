CREATE TABLE stadium(
       id                    number primary key,
       stadium_name          varchar2(250 char),
       stadium_capacity      varchar2(250 char),
       stadium_city          varchar2(250 char),
       cr_time               date,
       cr_user               varchar2(250 char),
       last_mod_time         date,
       last_mod_user         varchar2(250 char),
       dml_flag              char (1),
       version               number 
)tablespace users;
