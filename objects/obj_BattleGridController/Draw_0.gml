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
		
		draw_sprite(spr_hex,0,start_x + j*grid_cell_size+x_offset,start_y + i*grid_cell_size*0.75)
	}
}

