/// @description Menu Background

// Draws the Window & Elements itself
var mOptionLongest = 0;
for(var i = 0; i < mLength; i++)
{
	var mOptionWidth = string_width(mOption[mDepth, i]);
	mOptionLongest = max(mOptionLongest, mOptionWidth);
}
mWidth =  mOptionLongest + mBorder*2;
mHeight = mBorder*2 + sprite_get_height(foMenu) + (mLength-1)*mSpace;
draw_sprite_ext(sprite_index, image_index, x, y, mWidth/sprite_width, mHeight/sprite_height, 0, c_white, 1);
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - mWidth/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - mHeight/2;

// Draws the options for the Window
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for(var i = 0; i < mLength; i++)
{
	var textColor = c_white;
	if (mPos == i)
	{
		if (remap)
			textColor = c_blue;
		else
			textColor = c_maroon;
	}
	draw_text_color(x+mBorder, y+mBorder+mSpace*i, mOption[mDepth, i], textColor, textColor, textColor, textColor, 1);
}
