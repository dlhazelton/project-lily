// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GameSave(){
	var _save = array_create(0);
	
	// Character save data
	global.stats.save_xPos = objPlayer.x;
	global.stats.save_yPos = objPlayer.y;
	global.stats.save_room = room_get_name(room);
	global.stats.save_maxHP = objPlayer.maxHP;
	global.stats.save_dFlag = objPlayer.dFlag;
	
	array_push(_save, global.stats);
	
	// Push the data into a file to access later
	var _filename = "SaveData.sav";
	var _json = json_stringify(_save);
	var _buf = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buf, buffer_string, _json);
	buffer_save(_buf, _filename);
	buffer_delete(_buf);
}