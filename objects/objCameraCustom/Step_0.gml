 /// @description Management

// Updates camera on what to follow
if(instance_exists(following))
{
	xDest = following.x;
	yDest = following.y;
}

// Updates camera's position when object moves
x += (xDest - x) / 20;
y += (yDest - y) / 20;

x = clamp(x,viewWidth,room_width-viewWidth);
y = clamp(y, viewHeight, room_height-viewHeight);

// Updates camera's view
camera_set_view_pos(camera,x-viewWidth,y-viewHeight);