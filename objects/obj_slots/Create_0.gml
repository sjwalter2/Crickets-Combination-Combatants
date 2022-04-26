/// @description Insert description here
// You can write your code in this editor
characterInfo()

level = 1
gridW = 3
gridH = 3
global.level = 1
rowSprites = ["spr_classIcons","spr_raceIcons","spr_abilityIcons"]

gridSizeW = 90
gridSizeH = 110 
paddingX = 20
paddingY = 20

start_x = room_width/2 - ((gridW)/2)*(gridSizeW+paddingX)
start_y = paddingY*2
end_x  = room_width/2 + ((gridW)/2)*(gridSizeW+paddingX)
end_y = paddingY*2 + gridH*(gridSizeH+paddingY)

currentRoll = [0,0,0]
rollIncrease = [irandom_range(15,25),irandom_range(15,25),irandom_range(15,25)]

slotIndexGrid = ds_grid_create(gridW,gridH+1)
slotSpriteGrid = ds_grid_create(gridW,gridH+1)
for(var i = 0; i < gridW; i++)
{
	for(var j = 0; j <= gridH; j++)
	{
		var tier = getRandTier(global.level)
		var rowSprite = asset_get_index(rowSprites[i] + string(tier))
		var rowIndexCount = sprite_get_number(rowSprite)
		ds_grid_add(slotSpriteGrid,i,j,rowSprite)
		ds_grid_add(slotIndexGrid,i,j,irandom(rowIndexCount))
	}	
}

finalRoll = [0,0,0]
finishRoll = [0,0,0]
rolling = [1,1,1]
rollInitTimer = 120
rollInit = rollInitTimer
