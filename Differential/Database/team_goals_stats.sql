select t.name, ts.c_gcpg, ts.c_h_gcpg, ts.c_a_gcpg, ts.c_h_rating, ts.c_a_rating, ts.pred_points
from team t, team_season ts
where ts.season=12 and t._id=ts.team_id