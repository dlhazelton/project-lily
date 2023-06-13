 /// @description Params & States
/* Code for Valerie - Main Character
 * For GML Documentation, see here:
 * https://manual.yoyogames.com/GameMaker_Language/GameMaker_Language_Index.htm
 *
 * Legend (for reference, will be used for other objects):
 * w = Walk
 * h = Horizontal
 * v = Vertical
 * k = Key
 * j = Jump
 * a = attack
 * i = invulnerability
 * d = dash
 *
 * Note, most params are declared under "Variable Definitions" for sake of brevity
 */
 
 // Additional Movement Params 
grav = 0.25; // For gravity control (ex underwater)
barHPxPos = (160/2) - (barHPWidth/2);
barHPyPos = window_get_height() - (window_get_height()-10);

// States
stateOpen = function() // Default state
{
	// Movement
	hSpeed = (kRight - kLeft) * wSpeed;
	vSpeed = vSpeed + grav;
	if((jGrnd-- > 0) && (kJump)) // Jumping, only able to if you're on ground
	{
		vSpeed = jSpeed;
		jGrnd = 0;
	}
	
	if(dFlag) // Available when Dash is collected
	{
		dTime = max(dTime-1, 0);
		if(dTime > 0)
			vSpeed = 0;
		if(kDash)
		{
			dTime = 8;
			hSpeed = -image_xscale * dDist;
		}
	}
		
	
	// Collision & Movement (if available)
	if(place_meeting(x+hSpeed, y, objWall)) // Horizontal
	{
		while(abs(hSpeed) > 0.1)
		{
			hSpeed *= 0.5;
			if(!place_meeting(x+hSpeed, y, objWall))
				x += hSpeed;
		}
		hSpeed = 0;
	}
	x += hSpeed;
	
	if(place_meeting(x, y+vSpeed, objWall)) // Vertical
	{
		if(vSpeed > 0)
		{
			jGrnd = 5; // Time buffer after you go off platform 
		}
		while(abs(vSpeed) > 0.1)
		{
			vSpeed *= 0.5;
			if(!place_meeting(x, y+vSpeed, objWall))
				y += vSpeed;
		}
		vSpeed = 0;
	}
	y += vSpeed;
	
	// Animations
	if(!place_meeting(x,y+1,objWall)) // Vertical
	{
		if(sign(vSpeed) > 0 && onWall == 0)
			sprite_index = sprPlayerFall;
		else if(sign(vSpeed) > 0)
			sprite_index = sprPlayerWall;
		else
			sprite_index = sprPlayerJump;
	}

	else // Horizontal
	{
		if(hSpeed != 0)
			sprite_index = sprPlayerRun;
		else
			sprite_index = sprPlayerIdle;
	}
	
	if (hSpeed != 0) // Flips when moving in other direction (default is left)
		image_xscale = -sign(hSpeed);
	
	if(kMelee)
		state = stateMelee;
}


stateMelee = function() // For Melee Attacking
{
	hSpeed = 0;
	vSpeed = 0;
	
	// Start of  
	if(sprite_index != sprPlayerAttackMelee)
	{
		// Spawn a hitbox where the player is at
		xHitbox = objPlayer.x;
		if(image_xscale == -1)
		{
			xHitbox += 32;
		}
		instance_create_depth(xHitbox, objPlayer.y, objPlayer.depth,objPlayerMeleeHitbox);
		
		sprite_index = sprPlayerAttackMelee;
		image_index = 1;
	}
	
	if(image_index > 2)
	{
		state = stateOpen;
	}
}

state = stateOpen;