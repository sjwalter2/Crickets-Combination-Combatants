/// @description 

var i
var j
for (i = 0; i < ds_grid_height(battleGrid); i+=1) {
	for (j = 0; j < ds_grid_width(battleGrid); j+=1) {
		draw_sprite(spr_hex,0,j*64,i*64)
	}
}
