// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function findStats(race,class,stats){
	var stat = ds_map_create()
	for(var i = 0; i < array_length(stats); i++)
	{
		ds_map_add(stat,stats[i],real(ds_map_find_value(race,stats[i]))*real(ds_map_find_value(class,stats[i])))
	}	
	return stat;
}

