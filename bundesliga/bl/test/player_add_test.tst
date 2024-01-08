PL/SQL Developer Test script 3.0
10
begin
  -- Call the procedure
  pkg_player.add_player(p_name => :p_name,
                        player_bdate => :player_bdate,
                        player_goals => :player_goals,
                        player_assists => :player_assists,
                        player_nationality => :player_nationality,
                        player_position => :player_position,
                        t_id => :t_id);
end;
7
p_name
1
Joshua Kimmich
5
player_bdate
1
2001. 03. 06.
12
player_goals
1
3
4
player_assists
1
2
4
player_nationality
1
Germany
5
player_position
1
Midfielder
5
t_id
1
8
4
0
