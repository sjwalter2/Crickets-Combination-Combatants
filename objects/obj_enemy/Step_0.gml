//Keeps track of what grid cell the character is in	
with obj_GridController {

	var oldGridX = other.gridX
	var oldGridY = other.gridY
	
	var newGridXY = convertXYtoGridXY(other.x,other.y)
	other.gridX = newGridXY[0]
	other.gridY = newGridXY[1]
	
	//If the gridX/Y have changed, update battleGrid
	if (other.gridX != oldGridX || other.gridY != oldGridY){
		ds_grid_set(battleGrid,other.gridX,other.gridY,other.id)
		
		//If battleGrid was updated, clear the old grid cell, but only if it is not currently occupied (generally, this should never happen, as only one character can be in a grid cell at any given time)
		if(ds_grid_get(battleGrid,oldGridX,oldGridY) == other.id) {
			ds_grid_set(battleGrid,oldGridX,oldGridY,-1)
		}
	}
}
