//Keeps track of what grid cell the character is in	
with obj_GridController {

	var newGridXY = convertXYtoGridXY(other.x,other.y)
	other.gridX = newGridXY[0]
	other.gridY = newGridXY[1]
	
}
