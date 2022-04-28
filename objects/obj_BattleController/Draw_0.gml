/// @description 

var i
var j
for (i = 0; i < ds_grid_height(battleGrid); i+=1) {
	for (j = 0; j < ds_grid_width(battleGrid); j+=1) {
		
		//The even rows will be offset by half a cell to make the hexes fit
		var x_offset = 0;
		if i mod 2 == 0 {
			x_offset = grid_cell_size/2
		}
		var currentSprite = 0
		if (selectedCharacter != noone)
		{
			var newXY = convertXYtoGridXY(mouse_x,mouse_y + selectedCharacter.sprite_height/2)
			if j == newXY[0] && i == newXY[1]
				currentSprite = 1
		}
		
		draw_sprite(spr_hex,currentSprite,start_x + j*grid_cell_size+x_offset,start_y + i*grid_cell_size*0.75)
	}
}

