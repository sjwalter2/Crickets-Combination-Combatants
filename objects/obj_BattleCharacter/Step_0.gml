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
with obj_BattleGridController
	cellDistance = grid_cell_size



//Keeps track of what grid cell the character is in	
with obj_GridController {

	var newGridXY = convertXYtoGridXY(other.x,other.y)
	other.gridX = newGridXY[0]
	other.gridY = newGridXY[1]

}
	

if(inBattle && targetedEnemy == noone)
{
	targetedEnemy = instance_nearest(x,y,obj_enemy)
}
else if(inBattle && targetedEnemy != noone && point_distance(x,y,targetedEnemy.x,targetedEnemy.y) > range*cellDistance+cellDistance*.5)
{

}
