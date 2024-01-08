alter table team add constraint fk_team_stadium foreign key(stadium_id) references stadium(id);
alter table team add constraint uk_stadium unique(stadium_id);

comment on table team is 'Teams';
comment on column team.team_name is 'Team Name';
comment on column team.stadium_id is 'Stadium ID';
comment on column team.wins is 'Team Wins';
comment on column team.draws is 'Team Draws';
comment on column team.losses is 'Team Losses';
comment on column team.cr_time is 'Team Entry Creation Time';
comment on column team.cr_user is 'Team Entry Creator';
comment on column team.last_mod_time is 'Time of Last Modification';
comment on column team.last_mod_user is 'Last Modified by';
comment on column team.version is 'Number of Changes Made to The Entry';
