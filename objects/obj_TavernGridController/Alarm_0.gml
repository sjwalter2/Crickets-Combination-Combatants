/// @description Initialize battle controller
with(instance_create_depth(0,0,0,obj_BattleGridController)){
	//Init variables
	grid_width = other.grid_width+grid_X_buffer + 6
	grid_height = other.grid_height + grid_Y_buffer*2
	grid_cell_size = other.grid_cell_size
	char_x_offset = other.char_x_offset
	char_y_offset = other.char_y_offset

	//Create the battle grid
	battleGrid = ds_grid_create(grid_width,grid_height)
	//The grid will be filled with the id's of character instances
	//Empty grid spaces will have id -1
	ds_grid_set_region(battleGrid,0,0,grid_width-1,grid_height-1,-1);

	//add characters from the other grid
	var i
	var j
	for (i = 0; i < other.grid_width ; i += 1) {
		for (j = 0; j < other.grid_height; j += 1){
			show_debug_message("i = " + string(i) + ", j = " + string(j))
			if ds_grid_get(other.battleGrid,i,j) != -1 {
				var referenceChar = ds_grid_get(other.battleGrid,i,j)
				
				var newChar = addCharacter(referenceChar.gridX+grid_X_buffer,referenceChar.gridY+grid_Y_buffer,referenceChar.class,referenceChar.race,referenceChar.ability,0)

				newChar.classLvl = referenceChar.classLvl
				newChar.raceLvl = referenceChar.raceLvl
				newChar.abilityLvl = referenceChar.abilityLvl

				//stats
				newChar.statMap = referenceChar.statMap
				newChar.image_index = referenceChar.image_index

				ds_grid_set(battleGrid,i+grid_X_buffer,j+grid_Y_buffer,newChar)
				instance_destroy(referenceChar)
			}
		}
	}
}


instance_destroy(id)
