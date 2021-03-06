/// @description Initialize a battle

CharacterType = "obj_Character"

event_inherited()


//Create the battle grid
battleGrid = ds_grid_create(grid_width,grid_height)
//The grid will be filled with the id's of character instances
//Empty grid spaces will have id -1
ds_grid_set_region(battleGrid,0,0,grid_width-1,grid_height-1,-1);

selectedCharacter = noone
leftClickCounter = 0     //When lmb is down and selectedCharacter != noone (i.e. when a character is selected), leftClickCounter will go up.
						//When lmb is released, if leftClickCounter > leftClickThreshold, it will run the place character code
leftClickThreshold = 15


// moveCharacter moves an existing character from one part of the grid to another
// the inputs {old,new}{X,Y} are grid positions, NOT literal gameMaker x and y
// returns 1 if successful; 0 if unsuccessful
function moveCharacter(oldX,oldY,newX,newY) {
	//If source location is from the mouse, spawn will == 1
	var spawn = (oldX = -1 && oldY = -1)

	//verify New X/Ys
	if newX >= grid_width or newY >= grid_height or newX < 0 or newY < 0 {
		show_debug_message("New X ("+string(newX)+") or Y (" + string(newY) +") is outside of grid")
		return 0;
	}


	//Verify character exists at oldX,oldY
	if(!spawn && ds_grid_get(battleGrid,oldX,oldY) == -1) {
		show_debug_message("No character at "+ string(oldX) + "," + string(oldY))
		return 0;
	}
	
	//Verify no character exists at newX,newY
	//If a character exists at newX,newY, we will return it; otherwise, we will return "none"
	var replacementCharacter = "none"
	if(ds_grid_get(battleGrid,newX,newY) != -1 && (spawn || (ds_grid_get(battleGrid,newX,newY) != ds_grid_get(battleGrid,oldX,oldY)))) {
		show_debug_message("A character already exists at "+ string(newX) + "," + string(newY))
		replacementCharacter = ds_grid_get(battleGrid,newX,newY)
	}


	//Set the character to be moved from oldX, oldY
	if(!spawn)
	{
		var movedCharacter = ds_grid_get(battleGrid,oldX,oldY)
		ds_grid_set(battleGrid,oldX,oldY,-1)
	}
	else
		var movedCharacter = selectedCharacter
	var x_offset = checkOffset(newY);	

	ds_grid_set(battleGrid,newX,newY,movedCharacter)
	show_debug_message("Placing existing character at: " + string(newX*grid_cell_size+x_offset) + "," + string(newY*grid_cell_size*0.75))
	with movedCharacter {
		x = (newX + other.char_x_offset)*other.grid_cell_size+x_offset + other.start_x
		y = (newY+ other.char_y_offset)*other.grid_cell_size*0.75 + other.start_y
		gridX = newX
		gridY = newY
	}


	
	return replacementCharacter;
}


function placeCharacter() {
	var newXY = convertXYtoGridXY(mouse_x,mouse_y + selectedCharacter.sprite_height/2)
	var replacedCharacter = moveCharacter(selectedCharacter.gridX,selectedCharacter.gridY,newXY[0],newXY[1])
	show_debug_message("replaced character = " + string(replacedCharacter))
	//if replacedCharacter == 0, then the character wasnt placed
	if replacedCharacter != 0 {
		//deselect the character
		selectedCharacter.followMouse = 0
		selectedCharacter = noone;
		//if the placed character replaced another character, the replaced character goes into the mouse
		if replacedCharacter != "none" {
			selectedCharacter = replacedCharacter
			selectedCharacter.followMouse = 1
			selectedCharacter.returnX = selectedCharacter.x
			selectedCharacter.returnY = selectedCharacter.y
			leftClickCounter = 0
			
			//character is no longer in the grid, so set it to -1
			selectedCharacter.gridX = -1
			selectedCharacter.gridY = -1
		}
	}	
}

