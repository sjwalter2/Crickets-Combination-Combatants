/// @description Insert description here
// You can write your code in this editor

show_range = !show_range
var range = ds_map_find_value(statMap, "Range")

//Math for finding the range on a hex grid
with(obj_BattleGridController)
{
	ds_grid_clear(rangeGrid,0)
	var charQ = other.gridX - (other.gridY + other.gridY%2)/2
	
	for(var i = 0; i < grid_width; i++)
	{
		for(var j = 0; j < grid_height; j++)
		{
			var q = i - (j + j%2)/2
			var r = j
			var s = -q - r
			
			for(var q = -range; q <= range; q++)
				for(var r = -range; r <= range; r++)
					for(var s = -range; s <= range; s++)
						if(q + r + s == 0)
						{	
							var newQ = charQ + q
							var newR = other.gridY + r
							
							var col = newQ + (newR + newR%2)/2
							var row = newR
							
							ds_grid_set(rangeGrid,col,row,1)
						}
				
					
		}
	}
		
				
}

