/// @description 

for (var i = 0; i < ds_grid_height(battleGrid); i+=1) 
{
	for (var j = 0; j < ds_grid_width(battleGrid); j+=1) 
	{	
		//The even rows will be offset by half a cell to make the hexes fit
		var x_offset = checkOffset(i);
		
		if(rangeGrid != -1 && ds_grid_get(rangeGrid,j,i))
			draw_sprite_ext(spr_hex,1,start_x + j*grid_cell_size+x_offset,start_y + i*grid_cell_size*0.75,1,1,0,c_blue,1)
		else if(targetedGrid != -1 && ds_grid_get(targetedGrid,j,i))
			draw_sprite_ext(spr_hex,1,start_x + j*grid_cell_size+x_offset,start_y + i*grid_cell_size*0.75,1,1,0,c_red,1)
		else
			draw_sprite(spr_hex,0,start_x + j*grid_cell_size+x_offset,start_y + i*grid_cell_size*0.75)
			
		
		
			
		draw_set_color(c_white)
		draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
		
		var q = j - (i + i%2)/2
		var r = i
		
		//draw_text(start_x + j*grid_cell_size+x_offset+grid_cell_size/2,start_y + i*grid_cell_size*0.75+grid_cell_size/2,string(q) + "," + string(r) + "," +string(-q-r))
		draw_text(start_x + j*grid_cell_size+x_offset+grid_cell_size/2,start_y + i*grid_cell_size*0.75+grid_cell_size/2,string(j) + "," + string(i))
		draw_text(start_x + j*grid_cell_size+x_offset+grid_cell_size/2,start_y + i*grid_cell_size*0.75+grid_cell_size/2+10,string(ds_grid_get(battleGrid,j,i)))

	}
}

