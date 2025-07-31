function player_state_free()
{
	var key_jump = keyboard_check_pressed(vk_up);
	var key_jump_down = keyboard_check(vk_up);
	var key_left = keyboard_check(vk_left);
	var key_right = keyboard_check(vk_right);
	
	#region movement hsp
	
	var move = key_right - key_left != 0;
	
	if(move)
	{
		if(abs(hsp) > move_spd_max - 0.5 && ground)
		{
			var _choose = irandom(100);
		
			if(_choose > 85)
			{
				for(var i = 0; i < irandom_range(6,10); i++)
				{
					var xx = random_range(x - sprite_width / 1.5, x + sprite_width / 1.5);
				
					instance_create_depth(xx, y, depth - 1, obj_part_run);
				}
			}
		}
		
		
		sprite_index = spr_player_run;
		
		move_dir = point_direction(0,0,key_right-key_left,0);
		move_spd = approach(move_spd,move_spd_max,acc);
	}
	else
	{
		sprite_index = spr_player;
		
		move_spd = approach(move_spd,0,dcc);	
	}
	
	hsp = lengthdir_x(move_spd,move_dir);
	
	
	
	if(sprite_index == spr_player && image_index >= 4)
	{
		for(var i = 0; i < irandom_range(1,1); i++)
		{
			var xx = random_range(x - sprite_width / 1.5, x + sprite_width / 1.5);
				
			instance_create_depth(xx, y - 4, depth - 1, obj_part_splash);
		}
	}
	
	#endregion
	
	#region grav and jump
	
	if(!ground)
	{
		if(place_meeting(x, y + 1, colls))
		{
			xscale = 1.8;	
			yscale = 0.4;	
			
			for(var i = 0; i < irandom_range(abs(round(vsp)) + 4,abs(round(vsp)) + 9); i++)
			{
				instance_create_depth(x, y, depth - 1, obj_part_splash_die);
			}
		}
	}

	
	
	ground = place_meeting(x, y + 1, colls);
	
	if(ground)
	{
		can_jump = true;
		cur_time = 0;
		
		has_jump = false;
	}
	else
	{
		
		vsp += grav;
		cur_time++;
		if(cur_time >= coyote_time)
		{
			can_jump = false;
			cur_time = 0;
		}
	}
	
	if(!key_jump_down && vsp < 0)
	{
		vsp = max(vsp, -jump_spd / 2.5);
	}
	
	if(can_jump && !has_jump && key_jump)
	{
		vsp = -jump_spd;
		
		has_jump = true;
		cur_time = 0
		
		xscale = 0.4;	
		yscale = 1.8;	
		
		audio_play_sound(snd_jump,1,false);
	}
	
	if(vsp > 0)
	{
		sprite_index = spr_player_air;
		image_index = 1;
	}
	else if(vsp < 0)
	{
		sprite_index = spr_player_air;
		image_index = 0;
	}
	
	#endregion
	
	if(keyboard_check_pressed(vk_space))
	{
		state = player_state_dead;
		image_index = 0;
	}	
}

function player_state_dead()
{
	static _sprite_index = spr_player_dead;
	sprite_index = _sprite_index;
	
	hsp = 0;
	vsp = 0;
	
	image_speed = 1;
	
	screen_shake(10,60);
	
	if(image_index > image_number - 1 && sprite_index == _sprite_index)
	{
		var _choose = irandom(100);
		
		if(_choose > 80)
		{
			for(var i = 0; i < irandom_range(18,25); i++)
			{
				
				var yy = random_range(y - sprite_height / 2, y + sprite_height / 2);
				
				instance_create_depth(x, yy, depth - 1, obj_part_splash_die);
				
				state = player_state_hidden;
			}
		}
	}
}


function player_state_hidden()
{
	image_alpha = 0;
	
	x = xstart;
	y = ystart - 60;
	
	var _func = function()
	{
		
		for(var i = 0; i < 1; i++)
		{
			if(i <= 0) 
			{
				state = player_state_free; 
				image_alpha = 1;
			}
				
			var yy = y - sprite_height / 2;
				
			instance_create_depth(x, yy, depth - 1, obj_part_splash_die);
		}
	}
	
	var _time_source = time_source_create(time_source_game, 80, time_source_units_frames, _func);
	
	time_source_start(_time_source);
	
}