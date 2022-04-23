/// @description Initialize a battle

//Init variables
grid_width = 4
grid_height = 5
grid_cell_size = 64

//Create the battle grid
battleGrid = ds_grid_create(grid_width,grid_height)


function addCharacter(X,Y){
	if X >= grid_width or Y >= grid_height or X < 0 or Y < 0 {
		show_debug_message(" X or Y is outside of grid")
		exit;
	}
	var x_offset = 0;
	if Y mod 2 == 0 {
		x_offset = grid_cell_size/2
	}

	var Character = instance_create_layer(X*grid_cell_size+x_offset,Y*grid_cell_size*0.75,"Instances",obj_Character)

	ds_grid_add(battleGrid,X,Y,Character)
}

addCharacter(1,2)
addCharacter(-1,0)
addCharacter(0,100)
addCharacter(3,1)
