 /// @description Main code part for the pause screen
gpu_set_blendenable(false); // Unnecessary for pause

// Visual indicator for pause screen
if(isPaused)
{
	surface_set_target(application_surface);
	// Draw the Freezeframe when it's created
	if(surface_exists(pauseFreeze))
		draw_surface(pauseFreeze, 0, 0);
		
	// Creates the freezeframe if it doesn't exist
	else
	{
		pauseFreeze = surface_create(wWidth, wHeight);
		buffer_set_surface(pauseFreezeBuf, pauseFreeze, 0);
	}
	surface_reset_target();
}

// Pause toggle
if(keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start))
{
	if(!isPaused) // Pause, check if it's already paused
	{
		isPaused = true;
		instance_deactivate_all(true);
		
		pauseFreeze = surface_create(wWidth, wHeight);
		surface_set_target(pauseFreeze);
			draw_surface(application_surface, 0, 0);
		surface_reset_target(); 
		
		if(buffer_exists(pauseFreezeBuf))
			buffer_delete(pauseFreezeBuf)
		pauseFreezeBuf = buffer_create(wWidth * wHeight * 4, buffer_fixed, 1);
		buffer_get_surface(pauseFreezeBuf, pauseFreeze, 0);
	}
	else // Already paused, this'll end it
	{
		isPaused = false;
		instance_activate_all();
		if(surface_exists(pauseFreeze))
			surface_free(pauseFreeze)
		if(buffer_exists(pauseFreezeBuf))
			buffer_delete(pauseFreezeBuf)
	}
}

gpu_set_blendenable(true);