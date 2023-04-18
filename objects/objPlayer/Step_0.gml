/// @description Movement & movement input

// Keyboard input
kLeft = keyboard_check(ord("A"));
kRight = keyboard_check(ord("D"));
kJump = keyboard_check_pressed(vk_space); // Only for frame pressed
kMelee = mouse_check_button_pressed(mb_left);
onWall = place_meeting(x-1, y, objWall) -  place_meeting(x+1, y, objWall);

state();

 if (maxHP == 0) instance_destroy();
