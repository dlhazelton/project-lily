// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GameLoad(){
	var _filename = "SaveData.sav";
	if !file_exists(_filename) exit;
	
	// Getting the data
	var _buf = buffer_load(_filename);
	var _json = buffer_read(_buf, buffer_string);
	buffer_delete(_buf);
	var _load = json_parse(_json);
	
	// Setting the data
	global.stats = array_get(_load, 0);
	var _loadRoom = asset_get_index(global.stats.save_room);
	room_goto(_loadRoom);
	
	if(instance_exists(objPlayer))
		instance_destroy(objPlayer);
	instance_create_layer(global.stats.save_xPos, global.stats.save_yPos, layer, objPlayer);
}