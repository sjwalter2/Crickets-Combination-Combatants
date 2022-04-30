/// @description Insert description here
// You can write your code in this editor
characterInfo()

level = 1
gridW = 3
gridH = 3
global.level = 5
rowSprites = ["spr_classIcons","spr_raceIcons","spr_abilityIcons"]

gridSizeW = 90
gridSizeH = 110 
paddingX = 20
paddingY = 20

start_x = room_width/2 - ((gridW)/2)*(gridSizeW+paddingX)
start_y = paddingY*2 + paddingY/2
end_x  = room_width/2 + ((gridW)/2)*(gridSizeW+paddingX)
end_y = paddingY*2 + gridH*(gridSizeH+paddingY) + paddingY/2

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
		var rowIndexCount = sprite_get_number(rowSprite)-1
		ds_grid_add(slotSpriteGrid,i,j,rowSprite)
		ds_grid_add(slotIndexGrid,i,j,irandom(rowIndexCount))
	}
	
}
for(var i = 0; i < gridH; i++)
{
	with(instance_create_depth(start_x + gridSizeW*3 + paddingX*5, start_y + (paddingY + gridSizeH)*i + gridSizeH/4,depth, obj_buyRow))
	{
		slots = other.id
		row = i
	}
}


finalRoll = [0,0,0]
finishRoll = [0,0,0]
rolling = [1,1,1]
rowCost = [0,0,0]
rollInitTimer = 120
rollInit = rollInitTimer
stopped = 0
rowBought = -1
grabbedSprite = ""
grabbedIndex = ""
grabbedColumn = -1
grabbedRow = -1
grabbedTile = noone
grabbedTilePlaced = 0
changeGrid = 0
