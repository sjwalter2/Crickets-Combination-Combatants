/// @description This object is only to be used as a parent and contains shared code between all GridControllers

//Init variables
grid_width = 5
grid_height = 5
grid_cell_size = 128
start_x = room_width/2 - (grid_width+.5)*grid_cell_size/2
start_y = room_height/2 - grid_cell_size/2
char_x_offset = .5
char_y_offset = .3


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

function convertGridXYtoXY(inputGridX,inputGridY) {
	var returnXY = array_create(2)
	
	var xoffset = 0
	if inputGridX mod 2 == 0 {
		xoffset = grid_cell_size / 2
	}
	returnXY[0] = (inputGridX * grid_cell_size)+ start_x + xoffset + (0.5*grid_cell_size)
	returnXY[1] = (inputGridY * grid_cell_size)+ start_y

	return returnXY;
}

// addCharacter creates a character at grid position X,Y and adds it to the battleGrid
// note: X and Y are grid positions, NOT literal gameMaker x and y
// if character is successfully placed, return the character id; otherwise, return 0. Any code using this function should check to ensure adding character was successful.
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
		var Character = instance_create_depth(char_x,char_y,depth - 1,asset_get_index(CharacterType))
		ds_grid_set(battleGrid,X,Y,Character)
	}
	
	
	
	with(Character){
		gridX = X
		homeGridX = gridX
		gridY = Y
		homeGridY = gridY
		returnXY = array_create(2)
		returnXY[0] = x
		returnXY[1] = y
		class = newClass
		race = newRace
		ability = newAbility
		if(spawn)
		{
			followMouse = 1
			other.selectedCharacter = id
		}
	}
	return Character;
}
