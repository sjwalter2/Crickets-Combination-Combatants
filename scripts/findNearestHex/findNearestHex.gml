// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function findNearestHex(xx,yy){
	var w, h, rGrid, xyArrGrid, dist = -1, checkDist, targetXY = -1
	with(obj_BattleGridController)
	{
		w = grid_width
		h = grid_height	
		rGrid = rangeGrid
	}
	
	for(var i = 0; i < w; i++)
		for(var j = 0; j < h; j++)
		{
			if(ds_grid_get(rGrid, i, j) == 1)
			{
				with(obj_BattleGridController)
					xyArrGrid = convertGridXYtoXY(i,j)
					
				checkDist = point_distance(xx,yy,xyArrGrid[0],xyArrGrid[1])
				if(dist == -1)	
				{
					dist = checkDist
					targetXY = [i,j]
				}
				else if(checkDist < dist)
				{
					dist = checkDist
					targetXY = [i,j]
				}
			}
		}
	return targetXY
}