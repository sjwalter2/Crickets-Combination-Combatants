// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getIconInfo(sprite, image, tier){
	switch(sprite)
	{
		case "spr_classIcons":
			var classArr = ds_list_find_value(classList,tier)
			return classArr[image]
		break
		case "spr_raceIcons":
			var raceArr = ds_list_find_value(raceList,tier)
			return raceArr[image]
		break
		case "spr_abilityIcons":
			var abilityArr = ds_list_find_value(abilityList,tier)
			return abilityArr[image]
		break
		
	}

}