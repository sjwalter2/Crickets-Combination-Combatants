/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(.8)
switch(tileTier)
{
	case 0:
		var bg_color = c_green
	break
	case 1:
		var bg_color = c_navy
	break
	case 2:
		var bg_color = c_olive
	break
	case 3:
		var bg_color = c_silver
	break
}
draw_set_color(bg_color)
draw_roundrect(x,y,x+width,y+height,0)

draw_set_halign(fa_middle)
draw_set_valign(fa_top)

draw_sprite(sprite,index,x,y+padding/2)
draw_set_color(c_white)
draw_text(x+width/2,y+height-padding, tileName)
draw_set_alpha(1)
