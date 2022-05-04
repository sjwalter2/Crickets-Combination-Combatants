// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function findRange(xx,yy,range){
//Math for finding the range on a hex grid
	with(obj_BattleGridController)
	{
		ds_grid_clear(rangeGrid,0)
		var charQ = xx - (yy + yy%2)/2
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
								var newR = yy + r
							
								var col = newQ + (newR + newR%2)/2
								var row = newR
							
								if(ds_grid_get(targetedGrid,col,row) == 0)
									ds_grid_set(rangeGrid,col,row,1)
							}	
			}
		}					
	}
}