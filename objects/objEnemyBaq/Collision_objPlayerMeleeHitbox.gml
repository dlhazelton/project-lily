 /// @description When hit by player

hp -= 1;
hitFlash++;
if(!place_meeting(x+15, y, objWall))
{
	if (hSpeed > 0)
	{
		x -= 15;
	}
	else
	{
		x += 15;
	}
}

if(hp == 0)
{
	instance_destroy();
}