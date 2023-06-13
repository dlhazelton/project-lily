 /// @description Menu Control Inputs

// Only for 1 frame to avoid difficulty navigating menu

// Keyboard Input || Controller Input
mUp = keyboard_check_pressed(global.pmUp) || gamepad_button_check_pressed(0, gp_padu);
mDown = keyboard_check_pressed(global.pmDown) || gamepad_button_check_pressed(0, gp_padd);
mAccept = keyboard_check_released(global.pmAccept) || gamepad_button_check_pressed(0, gp_face1);
mBack = keyboard_check_released(global.pmBack) || gamepad_button_check_pressed(0, gp_face2);

mLength = array_length(mOption[mDepth]);
mPos += mDown - mUp;

// Make sure pos doesn't go out of bounds
if (mPos >= mLength)
	mPos = 0;

if (mPos < 0)
	mPos = mLength-1; 

var mMainDepth = mDepth; 

// Uses a nested Switch statement to encapsulate the 2D array menu options
if (mAccept) 
{
	switch(mDepth)
	{
		case 0:
			switch(mPos)
			{
				case 0:	// todo, edit when you do the save/load features
					GameLoad();
				break;
		
				case 1: // Start the game at first room
					room_goto(rmDEV1);
				break;
		
				case 2:	// todo
					mDepth = 1;
				break;
			
				case 3: // Close game
					game_end();
				break;
			}
		break;
		
		case 1: // Settings Sub-Menu
			switch(mPos)
			{
				case 0:	// Window Size
					mDepth = 2;
				break;
		
				case 1: // Control Remap
					mDepth = 3;
				break;
		
				case 2:	// Back to main screen
					mDepth = 0;
				break;
			}
		break;
		
		case 2: // Window Size Sub-Menu
			switch(mPos)
			{
				case 0:	// 640x360
					window_set_size(640, 360);
					window_center();
				break;
		
				case 1: // 960x540
					window_set_size(960, 540);
					window_center();
				break;
				
				case 2: // 1280x720
					window_set_size(1280, 720);
					window_center();
				break;
				
				case 3: // 1366x768 (this is the default)
					window_set_size(1366, 768);
					window_center();
				break;
				
				case 4: // 1600x900
					window_set_size(1600, 900);
					window_center();
				break;
				
				case 5: // 1920x1080
					window_set_size(1920, 1080);
					window_center();
				break;
				
				case 6: // Fullscreen Toggle
				if(window_get_fullscreen())
				{
					window_set_fullscreen(false);
					window_center();
				}
				else
					window_set_fullscreen(true);
				break;
				
				case 7:	// Back to settings
					mDepth = 1;
				break;
			}
			
			case 3:
				switch(mPos)
				{
					case 0: // To Keyboard Map
						mDepth = 4;
					break;
					
					case 1: // To Controller Map - todo
						//mDepth = 5;
					break;
					
					case 2: // Back to defaults
						keyboard_unset_map();
					break;

					case 3: // Back to settings
						mDepth = 1;
					break;
				}
			break;
			
			case 4:
				switch(mPos)
				{
					case 0:
						remap = true;
						mDepth = 6;
					break;
					
					case 1:
						remap = true;
						mDepth = 7;
					break;
					
					case 2:
						remap = true;
						mDepth = 8;
					break;
					
					case 3:
						mDepth = 1;
					break;
				}
			break;
			
			case 5:
				switch(mPos)
				{
					case 0:
					break;
					
					case 1:
					break;
					
					case 2:
					break;
					
					case 3:
					break;
					
					case 4:
						mDepth = 1;
					break;
				}
			break;
			
			case 6:
				switch(mPos)
				{
					case 0:
						keyboard_set_map(ord("A"), ord("A"));
					break;
					
					case 1:
						keyboard_set_map(vk_left, ord("A"));
						keyboard_set_map(ord("A"), vk_nokey);
					break;
					
					case 2:
						keyboard_set_numlock(true);
						keyboard_set_map(vk_numpad4, ord("A"));
						keyboard_set_map(ord("A"), vk_nokey);
					break;
					
					case 3:
						remap = false;
						mDepth = 4;
					break;
				}
			break;
			
			case 7:
				switch(mPos)
				{
					case 0:
						keyboard_set_map(ord("D"), ord("D"));
					break;
					
					case 1:
						keyboard_set_map(vk_right, ord("D"));
						keyboard_set_map(ord("D"), vk_nokey);
					break;
					
					case 2:
						keyboard_set_numlock(true);
						keyboard_set_map(vk_numpad6, ord("D"));
						keyboard_set_map(ord("D"), vk_nokey);
					break;
					
					case 3:
						remap = false;
						mDepth = 4;
					break;
				}
			break;
			
			case 8:
				switch(mPos)
				{
					case 0:
						keyboard_set_map(ord("Z"), ord("Z"));
					break;
					
					case 1:
						keyboard_set_map(vk_shift, ord("Z"));
						keyboard_set_map(ord("Z"), vk_nokey);
					break;
					
					case 2:
						keyboard_set_map(vk_enter, ord("Z"));
						keyboard_set_map(ord("Z"), vk_nokey);
					break;
					
					case 3:
						remap = false;
						mDepth = 4;
					break;
				}
			break;
			
		break;
	}
	
	// Reset accordingly when switching from sub-menu
	if(mMainDepth != mDepth)
		mPos = 0;
	mLength = array_length(mOption[mDepth]);
}

if (mBack && mDepth != 0)
{
	mDepth-= 1;
	// Reset accordingly when switching from sub-menu
	if(mMainDepth != mDepth)
		mPos = 0;
	mLength = array_length(mOption[mDepth]);
}