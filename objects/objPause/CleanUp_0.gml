 /// @description If game is closed while paused
 if(surface_exists(pauseFreeze))
	surface_free(pauseFreeze)
if(buffer_exists(pauseFreezeBuf))
	buffer_delete(pauseFreezeBuf)