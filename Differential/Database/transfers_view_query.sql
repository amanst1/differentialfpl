select t.*, p.name
from dbMoi.transfer t, player p, player_season ps
where t.player_fpl_id = ps.fpl_id
and ps.season=12
and p._id = ps.player_id
order by t.squad_id asc, t.gameweek asc, ps.position asc, t_in asc