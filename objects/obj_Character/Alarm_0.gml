/// @description Get Stats
// You can write your code in this editor

var racefile = file_text_open_read("raceInfo.json")
var theData = "";
while (!file_text_eof(racefile))
{
    theData += file_text_read_string(racefile);
    file_text_readln(racefile);
}
file_text_close(racefile);

var theJsonMap = json_decode(theData);
var theList = ds_map_find_value(theJsonMap, "Human");
show_debug_message(ds_map_find_value(theList, "Armor"))

