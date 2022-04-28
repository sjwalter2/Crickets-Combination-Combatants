/// @description Insert description here
// You can write your code in this editor
var currentMoney = 0
with(obj_moneyController)
	currentMoney = money


if(!slots.stopped)
	image_blend = c_gray	
else if(currentMoney > rowCost)
	image_blend = c_white
else
	image_blend = c_red


rowCost = slots.rowCost[row]


draw_self()
draw_text(x+sprite_width/2, y + sprite_height + 5,rowCost)
