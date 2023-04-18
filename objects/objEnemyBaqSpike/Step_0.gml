// Movement
vSpeed = vSpeed + grav;

// Collision & Movement (if available)
if(place_meeting(x+hSpeed, y, objWall) || place_meeting(x+hSpeed, y, objLedge)) // Horizontal
{
	while(!place_meeting(x+sign(hSpeed),y,objWall) && !place_meeting(x+sign(hSpeed),y,objLedge))
	{
		x += sign(hSpeed);
	}
	hSpeed = -hSpeed;
}
x += hSpeed;

if(place_meeting(x, y+vSpeed, objWall)) // Vertical
{
	if(vSpeed > 0)
		jGrnd = 5; // Time buffer after you go off platform
	while(abs(vSpeed) > 0.1)
	{
		vSpeed *= 0.5;
		if(!place_meeting(x, y+vSpeed, objWall))
			y += vSpeed;
	}
	vSpeed = 0;
}
y += vSpeed;

if (hSpeed != 0) // Flips when moving in other direction (default is left)
	image_xscale = -sign(hSpeed);