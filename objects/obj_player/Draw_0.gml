if(hsp != 0)
{
	see = sign(hsp);
}

draw_sprite_ext(sprite_index,image_index,x,y,xscale*see,yscale,angle,image_blend,image_alpha);