if(instance_exists(target))
{
    if (target.state == player_state_dead) 
	{
        view_width = lerp(camera_get_view_width(cam), zoom_width, 0.1);
        view_height = lerp(camera_get_view_height(cam), zoom_height, 0.1);
    }
	else 
	{
        view_width = lerp(camera_get_view_width(cam), normal_width, 0.1);
        view_height = lerp(camera_get_view_height(cam), normal_height, 0.1);
    }
	
	camera_set_view_size(cam, view_width, view_height);
	
	x_to = target.x - (view_width / 2);
    y_to = target.y - (view_height / 2);
	
	x_to = clamp(x_to, 0, room_width - view_width);
    y_to = clamp(y_to, 0, room_height - view_height);
    
    if(shake_lenght != 0)
    {
        x_to+=random_range(-shake_lenght,shake_lenght);
        y_to+=random_range(-shake_lenght,shake_lenght);
    }
    
    
    var _cx = camera_get_view_x(view_camera[0]);
    var _cy = camera_get_view_y(view_camera[0]);
    
    var _nx = lerp(_cx,x_to,0.15);
    var _ny = lerp(_cy,y_to,0.15);
    
    camera_set_view_pos(view_camera[0],_nx,_ny);
}