/// @description Initialize a battle

//Init variables
grid_width = 4
grid_height = 5
grid_cell_size = 64

//Create the battle grid
battleGrid = ds_grid_create(grid_width,grid_height)
//The grid will be filled with the id's of character instances
//Empty grid spaces will have id -1
ds_grid_set_region(battleGrid,0,0,grid_width-1,grid_height-1,-1);


function checkOffset(rowY) {
	//Even numbered rows are offset by half a hax
	var x_offset = 0;
	if rowY mod 2 == 0 {
		x_offset = grid_cell_size/2
	}
	return x_offset;
}

// addCharacter creates a character at grid position X,Y and adds it to the battleGrid
// note: X and Y are grid positions, NOT literal gameMaker x and y
function addCharacter(X,Y){
	if X >= grid_width or Y >= grid_height or X < 0 or Y < 0 {
		show_debug_message(" X or Y is outside of grid")
		exit;
	}
	
	var x_offset = checkOffset(Y)

	var Character = instance_create_layer(X*grid_cell_size+x_offset,Y*grid_cell_size*0.75,"Instances",obj_Character)
	show_debug_message("Placing new character at: " + string(X*grid_cell_size+x_offset) + "," + string(Y*grid_cell_size*0.75))
	ds_grid_set(battleGrid,X,Y,Character)
}

// moveCharacter moves an existing character from one part of the grid to another
// the inputs {old,new}{X,Y} are grid positions, NOT literal gameMaker x and y
function moveCharacter(oldX,oldY,newX,newY) {
	
	//verify New X/Ys
	if newX >= grid_width or newY >= grid_height or newX < 0 or newY < 0 {
		show_debug_message("New X or Y is outside of grid")
		exit;
	}


	//Verify character exists at oldX,oldY
	if(ds_grid_get(battleGrid,oldX,oldY) == -1) {
		show_debug_message("No character at "+ string(oldX) + "," + string(oldY))
		exit;
	}
	
	//Verify no character exists at newX,newY
	if(ds_grid_get(battleGrid,newX,newY) != -1) {
		show_debug_message("A character already exists at "+ string(newX) + "," + string(newY))
		exit;
	}


	//Set the character to be moved from oldX, oldY
	var movedCharacter = ds_grid_get(battleGrid,newX,newY)

	var x_offset = checkOffset(newY);	

	ds_grid_set(battleGrid,newX,newY,movedCharacter)
	show_debug_message("Placing existing character at: " + string(newX*grid_cell_size+x_offset) + "," + string(newY*grid_cell_size*0.75))
	with movedCharacter {
		x = newX*grid_cell_size+x_offset
		y = newY*grid_cell_size*0.75
	}

	ds_grid_set(battleGrid,oldX,oldY,-1)

}

addCharacter(1,2)
alarm_set(0,60)
moveCharacter(1,2,3,3)
