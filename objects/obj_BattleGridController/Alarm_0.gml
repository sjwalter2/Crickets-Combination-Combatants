/// @description Initialize tavern controller
with(obj_TavernGridController){
	//Init variables
	grid_width = other.grid_width - other.grid_X_buffer - 6
	grid_height = other.grid_height - 2*other.grid_Y_buffer
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
			if ds_grid_get(other.battleGrid,i,j) != -1 {
				var referenceChar = ds_grid_get(other.battleGrid,i,j)
				if(referenceChar.object_index != obj_BattleCharacter) {
					break;
				}
				var newChar = addCharacter(referenceChar.gridX-other.grid_X_buffer,referenceChar.gridY-other.grid_Y_buffer,referenceChar.class,referenceChar.race,referenceChar.ability,0)

				newChar.classLvl = referenceChar.classLvl
				newChar.raceLvl = referenceChar.raceLvl
				newChar.abilityLvl = referenceChar.abilityLvl

				//stats
				newChar.statMap = referenceChar.statMap
				newChar.image_index = referenceChar.image_index

				ds_grid_set(battleGrid,i-other.grid_X_buffer,j-other.grid_Y_buffer,newChar)
				instance_destroy(referenceChar)
			}
		}
	}
}

with(obj_enemy) {
	instance_destroy(id)
}
instance_destroy(id)
