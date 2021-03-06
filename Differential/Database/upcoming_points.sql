select p.name, p._id, sum(pm.pred_total_pts)/100.0 pred_pts, sum(pm.pred_total_pts)/100.0/count(*) pred_ppg, (ps.price/10.0) price, t.name team
, (select sum(pm2.pred_total_pts)/100.0 from player_match pm2 where pm2.player_player_id=p._id and pm2.season=12 and pm2.gameweek >= 29 and pm2.is_home=1) pts_home
, ps.position, (ps.c_ppg_x_mins/100.0) ppg_x, ps.minutes, (ps.c_ppg_x_mins_rec/100.0) ppg_x_recent, ps.c_avg_mins_recent, ps.c_games_recent
, round(sum(pm.pred_total_pts)/100.0/count(*) - (ps.c_ppg_x_mins/100.0),1) ppg_over, (ps.c_ppg_x_mins_home - ps.c_ppg_x_mins_away)/100.0 home_bias
from player p, player_match pm, player_season ps, team t
where p._id = pm.player_player_id
and pm.season = 13 and pm.gameweek>=1 and pm.gameweek<=1
and ps.player_id = p._id and ps.season=13
and ps.position = 1
--and ps.price <= 58
--and ps.minutes > 500
and t._id = p.team_id
group by p._id
order by pred_pts desc
--order by value_left desc