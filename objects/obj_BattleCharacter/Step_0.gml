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

with obj_GridController {
	var newGridXY = convertGridXYtoXY(other.x,other.y)
	other.gridX = newGridXY[0]
	other.gridY = newGridXY[1]
}
