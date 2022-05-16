depth = -y - 5

if(returningToHome == 1) {
	
	if point_distance(x,y,returnXY[0],returnXY[1]) >= moveSpeed{
		move_towards_point(returnXY[0],returnXY[1],moveSpeed)
	} else {
		x = returnXY[0]
		y = returnXY[1]
		returningToHome = 0
		speed = 0
	}
}

var range = ds_map_find_value(statMap,"Range")
var cellDistance = 0
var rangeGridExists = 0
with obj_BattleGridController
{
	cellDistance = grid_cell_size
	rangeGridExists = rangeGrid != -1 
}


//Keeps track of what grid cell the character is in	
var targetXY
with obj_GridController {

	var newGridXY = convertXYtoGridXY(other.x,other.y)
	other.gridX = newGridXY[0]
	other.gridY = newGridXY[1]
	targetXY = convertGridXYtoXY(other.targetX,other.targetY)
}
	

if(rangeGridExists && inBattle && targetedEnemy == noone)
{
	targetedEnemy = instance_nearest(x,y,obj_enemy)
	var range = ds_map_find_value(statMap, "Range")
	with(targetedEnemy)
	{
		findRange(gridX,gridY,range)
	}
	var nearestXY = findNearestHex(x,y)
	if(nearestXY != -1)
	{
		targetX = nearestXY[0]	
		targetY = nearestXY[1]

	}
	with(obj_BattleGridController)
	{
		ds_grid_clear(rangeGrid,0)
		if(nearestXY != -1)	
		{
			ds_grid_set(targetedGrid, other.gridX, other.gridY, 0)	
			ds_grid_set(targetedGrid,nearestXY[0], nearestXY[1],1)	
		}
	}
	alarm[0] = irandom_range(40,140)
}
else if(rangeGridExists && inBattle && targetedEnemy != noone && targetXY != -1 && (point_distance(x,y,targetXY[0],targetXY[1])>moveSpeed))
{
	var targetXY
	with(obj_BattleGridController)
	{
		targetXY = convertGridXYtoXY(other.targetX,other.targetY)

	}
	mp_potential_step_object(targetXY[0],targetXY[1],moveSpeed,obj_enemy)
}
else if(rangeGridExists && inBattle && targetedEnemy != noone && (point_distance(x,y,targetXY[0],targetXY[1])<=moveSpeed))
{
	x = targetXY[0]
	y = targetXY[1]
}
