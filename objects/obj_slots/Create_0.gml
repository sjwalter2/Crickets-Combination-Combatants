/// @description Insert description here
// You can write your code in this editor

gridW = 3
gridH = 3

rowSprites = [spr_classIcons,spr_classIcons,spr_classIcons]

show_debug_message("icons" + string(spr_classIcons.sprite_height))
show_debug_message("row" + string(rowSprites[0].sprite_height))

gridSizeW = 90
gridSizeH = 90 
paddingX = 20
paddingY = 20

start_x = room_width/2 - ((gridW)/2)*(gridSizeW+paddingX)
start_y = paddingY*2
end_x  = room_width/2 + ((gridW)/2)*(gridSizeW+paddingX)
end_y = paddingY*3 + gridH*(gridSizeH+paddingY)

currentRoll = 0
nextImage = 0
