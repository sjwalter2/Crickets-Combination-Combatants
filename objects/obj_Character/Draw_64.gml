/// @description Insert description here
// You can write your code in this editor
//Draw the stats while hovered
if(isHovered)
{
	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_maroon)
	draw_set_alpha(.8)
	var pad = 8

	var classStr = class + " " + string(classLvl)
	var raceStr = race + " " + string(raceLvl)
	var abilityStr = ability + " " + string(abilityLvl)

	var maxStr = max(string_width(classStr), string_width(raceStr), string_width(abilityStr))
	draw_roundrect(bbox_right + pad,bbox_top,x+sprite_width/2+pad + maxStr + pad, bbox_top+pad*4+string_height(classStr)*3,0)

	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_text(bbox_right + pad*2,bbox_top+pad,classStr)
	draw_text(bbox_right + pad*2,bbox_top+pad*2+string_height(classStr),raceStr)
	draw_text(bbox_right + pad*2,bbox_top+pad*3+string_height(classStr)*2,abilityStr)

	if(statMap != "")
	{
		var statWidth = 0
		var statHeight = 0
		var stats = getStats()
		var combinedStat = []
		
		
		for(var i = 0; i < array_length(stats); i++)
		{
			
			if(stats[i] == "ArmorPenetration" || stats[i] == "MagicPenetration")
				combinedStat[i] = stats[i] + ": "+ string(round(100*ds_map_find_value(statMap, stats[i])))+"%"
			else if(stats[i] == "CooldownReduction")
				combinedStat[i] = stats[i] + ": "+ string(round(100*(1-ds_map_find_value(statMap, stats[i]))))+"%"
			else if(stats[i] == "AttackSpeed")
				combinedStat[i] = stats[i] + ": "+ string(ds_map_find_value(statMap, stats[i]))
			else
				combinedStat[i] = stats[i] + ": "+ string(round(ds_map_find_value(statMap, stats[i])))
				
			if (string_width(combinedStat[i]) > statWidth) 
				statWidth = string_width(combinedStat[i])
			statHeight += string_height(combinedStat[i]) + pad
		}
		
		draw_set_color(c_maroon)
		draw_set_alpha(.8)
		var startX = bbox_left - pad*3 - statWidth
		var startY = bbox_top
		
		draw_roundrect(startX, startY, startX + statWidth + 2*pad, startY + statHeight + pad,0)
		
		
		draw_set_alpha(1)
		draw_set_color(c_white)
		for(var i = 0; i < array_length(stats); i++)
		{
			draw_set_halign(fa_left)
			draw_text(startX + pad,startY + pad + pad*i+string_height(combinedStat[0])*i,stats[i])
			draw_set_halign(fa_right)
			if(stats[i] = "ArmorPenetration" || stats[i] = "MagicPenetration")
				draw_text(startX + pad + statWidth,startY + pad + pad*i+string_height(combinedStat[0])*i, string(round(100*ds_map_find_value(statMap, stats[i])))+"%")
			else if(stats[i] = "CooldownReduction")
				draw_text(startX + pad + statWidth,startY + pad + pad*i+string_height(combinedStat[0])*i,string(round(100*(1-ds_map_find_value(statMap, stats[i]))))+"%")
			else if(stats[i] = "AttackSpeed")
				draw_text(startX + pad + statWidth,startY + pad + pad*i+string_height(combinedStat[0])*i,string(ds_map_find_value(statMap, stats[i])))
			else
				draw_text(startX + pad + statWidth,startY + pad + pad*i+string_height(combinedStat[0])*i,string(round(ds_map_find_value(statMap, stats[i]))))
		}
		
	}
}
