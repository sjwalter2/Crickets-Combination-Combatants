// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// addCharacter creates a character at grid position X,Y and adds it to the battleGrid
// note: X and Y are grid positions, NOT literal gameMaker x and y
// if character is successfully placed, return the character id; otherwise, return 0. Any code using this function should check to ensure adding character was successful.
function addMonster(X,Y){
		//Verify the X,Y is within the grid
		if X >= grid_width or Y >= grid_height or X < 0 or Y < 0 {
			show_debug_message("X or Y is outside of grid")
			return 0;
		}
		//Verify no character exists at newX,newY
		if(ds_grid_get(battleGrid,X,Y) != -1) {
			show_debug_message("A character already exists at "+ string(X) + "," + string(Y))
			return 0;
		}

		var x_offset = checkOffset(Y)
		var char_x = (X+char_x_offset)*grid_cell_size+x_offset+start_x
		var char_y = (Y+char_y_offset)*grid_cell_size*0.75+start_y
		show_debug_message("Placing new monster at: " + string(char_x) + "," + string(char_y))
		var Monster = instance_create_depth(char_x,char_y,depth - 1,obj_enemy)
		ds_grid_set(battleGrid,X,Y,Monster)
	
	with(obj_enemy){
		gridX = X
		homeGridX = gridX
		gridY = Y
		homeGridY = gridY
		returnXY = array_create(2)
		returnXY[0] = x
		returnXY[1] = y
	}
	return Monster;
}


function spawnMonsters(monsterGrid){
	
	if(monsterGrid == undefined) {
		show_debug_message("spawnMonsters requires a ds_grid of monsters!")
		return;
	}
	
	//loop through the monsterGrid and place them on the map
	//0,0 of the monsterGrid will actually start at grid_width-grid_extension
	var originX = grid_width-grid_extension+2
	var originY = 0
	
	for(var i = 0; i < ds_grid_width(monsterGrid) ; i+=1)
	{
		for(var j = 0; j<ds_grid_height(monsterGrid); j+=1)
		{
			if(ds_grid_get(monsterGrid,i,j) != 0) {
				addMonster(i+originX,j+originY)
			}
		}
	}
	
}
