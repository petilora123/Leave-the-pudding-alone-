
if place_meeting(x + hsp, y, colls)
{
	while !place_meeting(x + sign(hsp), y, colls)
	{
		x+=sign(hsp);
	}
	hsp = 0;
}

x+=hsp;
x=round(x);

if place_meeting(x, y + vsp, colls)
{
	while !place_meeting(x, y + sign(vsp), colls)
	{
		y+=sign(vsp);
	}
	vsp = 0;
}

y+=vsp;
y=round(y);


xscale = lerp(xscale,1,0.15);
yscale = lerp(yscale,1,0.15);