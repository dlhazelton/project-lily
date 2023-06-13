 // Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Legend:
// p = player
// m = menu
// k = Keyboard & Mouse
// c = Controller (GamePad)
function KeyBinds(){ 
	global.pmUp = ord("W");
	global.pmDown = ord("S");
	global.pmAccept = vk_space;
	global.pmBack = vk_backspace;
/*  Commented out for now til I can get this working
    To try to get this working:
	1. Call this function
	2. Swap out all instances that use a key with the corresponding ds_list entry added below
	Tried to get this working but GML just kept crashing on me like seriously

	// KB/M Default Setup:
	global.k_map = ds_list_create();
	ds_list_add(global.k_map, "pMoveLeft", ord("A"));
	ds_list_add(global.k_map, "pMoveRight", ord("D"));
	ds_list_add(global.k_map, "pJump", vk_space);
	ds_list_add(global.k_map, "pMAttack", mb_left);
	ds_list_add(global.k_map, "mMoveUp", ord("W"));
	ds_list_add(global.k_map, "mMoveDown", ord("S"));
	ds_list_add(global.k_map, "mAccept", vk_space);
	
	// Controller
	global.c_map = ds_list_create();
	ds_list_add(global.c_map, "pMove");
	ds_list_add(global.c_map, "pJump", gp_face1);
	ds_list_add(global.c_map, "pMAttack", gp_face3);
	ds_list_add(global.c_map, "mMoveUp", gp_padu);
	ds_list_add(global.c_map, "mMoveDown", gp_padd);
	ds_list_add(global.c_map, "mAccept", gp_face1);
	ds_list_add(global.c_map, "mBack", gp_face2);
*/
} 