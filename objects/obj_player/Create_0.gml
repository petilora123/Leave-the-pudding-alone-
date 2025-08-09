
#region movement
hsp = 0;
vsp = 0;

colls = [layer_tilemap_get_id("tile_wall")];

move_spd_max = 6;
move_spd = 0;
move_dir = 0;

acc = 0.3;
dcc = 0.35;

inclination = 10;
#endregion

#region jump and grav
ground = false;
can_jump = 0;
has_jump = 0;
jump_spd = 12;
grav = 0.6;

coyote_time = 6;
cur_time = 0;
#endregion

#region draw
xscale = 1; 
yscale = 1; 

see = 1;

angle = 0;

inclination = 10;
#endregion

state = player_state_free;

