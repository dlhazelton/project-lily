 /// @description Movement & movement input

// Keyboard input || Controller Input
kLeft = keyboard_check(ord("A"));
kRight = keyboard_check(ord("D"));
kJump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1);
kMelee = mouse_check_button_pressed(mb_left)
	 ||  keyboard_check_pressed(ord("Z"))
	 ||  gamepad_button_check_pressed(0, gp_face3);
kDash = mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_shoulderrb);
onWall = place_meeting(x-1, y, objWall) -  place_meeting(x+1, y, objWall);
gamepad_set_axis_deadzone(0, 0.2);

// Needs its own unique condition for "Dead Zone" calculation
if(abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
{
	kLeft = abs(min(gamepad_axis_value(0, gp_axislh), 0));
	kRight = max(gamepad_axis_value(0, gp_axislh), 0);
}

state();

 if (maxHP == 0) instance_destroy();
