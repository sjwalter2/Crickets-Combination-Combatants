// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getJsonMap(file, map){
	var openFile = file_text_open_read(file)
	var data = "";
	while (!file_text_eof(openFile))
	{
	    data += file_text_read_string(openFile);
	    file_text_readln(openFile);
	}
	file_text_close(openFile);

	var jsonMap = json_decode(data);
	return ds_map_find_value(jsonMap, map);
}