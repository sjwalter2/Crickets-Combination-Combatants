/// @description Initialize a battle

//Init variables
grid_width = 5
grid_height = 5
grid_cell_size = 128
start_x = room_width/2 - (grid_width+.5)*grid_cell_size/2
start_y = room_height/2 - grid_cell_size/2
char_x_offset = .5
char_y_offset = .3

//Create the battle grid
battleGrid = ds_grid_create(grid_width,grid_height)
//The grid will be filled with the id's of character instances
//Empty grid spaces will have id -1
ds_grid_set_region(battleGrid,0,0,grid_width-1,grid_height-1,-1);

selectedCharacter = noone
leftClickCounter = 0     //When lmb is down and selectedCharacter != noone (i.e. when a character is selected), leftClickCounter will go up.
						//When lmb is released, if leftClickCounter > leftClickThreshold, it will run the place character code
leftClickThreshold = 15


function checkOffset(rowY) {
	//Even numbered rows are offset by half a hax
	var x_offset = 0;
	if rowY mod 2 == 0 {
		x_offset = grid_cell_size/2
	}
	return x_offset;
}

//check THIS shit out: https://stackoverflow.com/questions/7705228/hexagonal-grids-how-do-you-find-which-hexagon-a-point-is-in
function convertXYtoGridXY(inputX,inputY) {
	inputX -= start_x
	inputY -= start_y
	var returnXY = array_create(2)
	
	var squareGridHeight = 0.75*grid_cell_size
    // Find the row and column of the rectangle box that the point falls in.
	var row = floor((inputY / squareGridHeight));
    var column;
	if row mod 2 == 0 {
		// Yes: Offset x to match the indent of the row
		rowIsOdd = 0
        column = floor(((inputX - grid_cell_size/2) / grid_cell_size));
	}
    else {// No: Calculate normally
		rowIsOdd = 1
        column = floor(inputX / grid_cell_size);
	}

    // Work out the position of the point relative to the box it is in
    var relY = inputY - (row * squareGridHeight);
    var relX;

    if (!rowIsOdd)
        relX = (inputX - (column * grid_cell_size)) - grid_cell_size/2;
    else
        relX = inputX - (column * grid_cell_size);



	//m = c / halfWidth where c is the "height" of the small triangles
    // Work out if the point is above either of the hexagon's top edges
	var m = 0.5
	var c = grid_cell_size/4
    if (relY < (-m * relX)+c) // LEFT edge
        {
            row--;
			
            if (rowIsOdd)
                column--;
			
        }
    else if (relY < (m * relX)-c) // RIGHT edge
        {
			show_debug_message("case2")
            row--;
            if (!rowIsOdd)
                column++;
        }

	returnXY[0] = column
	returnXY[1] = row
    return returnXY
}



// addCharacter creates a character at grid position X,Y and adds it to the battleGrid
// note: X and Y are grid positions, NOT literal gameMaker x and y
// if character is successfully placed, return 1; otherwise, return 0. Any code using this function should check to ensure adding character was successful.
function addCharacter(X,Y,newClass = "Paladin", newRace = "Human", newAbility = "Cleave", spawn = 0){
	if(spawn)
	{
		X = -1
		Y = -1
		if (selectedCharacter != noone){
			selectedCharacter.x = selectedCharacter.returnX
			selectedCharacter.y = selectedCharacter.returnY
			selectedCharacter.followMouse = 0
			selectedCharacter = noone
		}
		char_x = 0
		char_y = 0
		var Character = instance_create_depth(char_x,char_y,depth - 1,obj_Character)
	}
	else
	{
		if X >= grid_width or Y >= grid_height or X < 0 or Y < 0 {
			show_debug_message(" X or Y is outside of grid")
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
		show_debug_message("Placing new character at: " + string(char_x) + "," + string(char_y))
		var Character = instance_create_depth(char_x,char_y,depth - 1,obj_Character)
		ds_grid_set(battleGrid,X,Y,Character)
	}
	
	
	
	with(Character){
		gridX = X
		gridY = Y
		class = newClass
		race = newRace
		ability = newAbility
		if(spawn)
		{
			followMouse = 1
			other.selectedCharacter = id
		}
	}
	return 1;
}

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

addCharacter(2,2)
addCharacter(1,1,"Warrior","Elf","Smash")
