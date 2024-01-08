alter table player add team_id number;
alter table player add constraint fk_player_team foreign key(team_id) references team(id);
alter table player modify(player_name not null);
alter table player modify(player_goals default 0);
alter table player modify(player_assists default 0);
alter table player add constraint ch_pos check (player_position in ('Forward','Midfielder','Defender','Goalkeeper'));

comment on table stadium is 'Stadium';
comment on column stadium.stadium_name is 'Stadium Name';
comment on column stadium.id is 'Stadium ID';
comment on column stadium.stadium_capacity is 'Stadium Capacity';
comment on column stadium.stadium_city is 'Stadium City';
comment on column stadium.cr_time is 'Stadium Entry Creation Time';
comment on column stadium.cr_user is 'Stadium Entry Creator';
comment on column stadium.last_mod_time is 'Time of Last Modification';
comment on column stadium.last_mod_user is 'Last Modified by';
comment on column stadium.version is 'Number of Changes Made to The Entry';
